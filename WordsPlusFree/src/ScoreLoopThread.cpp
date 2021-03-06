/*
 * ScoreLoopThread.cpp
 *
 *  Created on: Oct 11, 2012
 *      Author: jamesmuir
 */
#include <scoreloop/scoreloopcore.h>
#include "ScoreLoopThread.hpp"
#include "Global.hpp"

#ifndef NDEBUG
#include <assert.h>
#define ASSERT(a) (assert(a))
#else
#define ASSERT(a)
#endif

#define LOG(fmt, args...)   do { fprintf(stdout, "[ScoreLoopThread.cpp ] " fmt "\n", ##args); fflush(stdout); } while (0);

//static const char SCORELOOP_GAME_ID[] = "5d01c386-ed3a-11dd-bc21-0017f2031122"; //scoreloop demo
//static const char SCORELOOP_GAME_SECRET[] = "V3jc99ubdm5MLnha5r9QzWiA89cywfoNCiHSqBDTfIyKRzob9Ra0bA==";  //scoreloop demo

//static const char SCORELOOP_GAME_ID[] = "daca41e8-24ed-4aa0-86e6-3169a32cb92d"; //game test
//static const char SCORELOOP_GAME_SECRET[] = "Go2uSPAUmvXY6CKu4v1hVxcI3jMgkATn2+tZ8e3qUovlU6UQaVXjGw==";  //game test

//TODO change version to 1.5
static const char SCORELOOP_GAME_ID[] = "acb55270-30e0-47b2-9d27-564f7bb163a6"; //live
static const char SCORELOOP_GAME_SECRET[] = "lQh1gNf3W9LJ53kAklF5x/YOLx1JJbSwsAXI7OBxWegNoYWaT/GRNA=="; //live
static const char SCORELOOP_GAME_VERSION[] = "1.4";
static const char SCORELOOP_GAME_CURRENCY[] = "GRL";
static const char SCORELOOP_GAME_LANGUAGE[] = "en";
//static const char SCORELOOP_AN_AWARD_ID[] = "wordsplus.testaward";

static ScoreLoopThread* _pinstance = NULL;


ScoreLoopThread::ScoreLoopThread(QObject* parent) :
		QThread(parent), m_quit(false) {
}

ScoreLoopThread::~ScoreLoopThread() {
	qDebug() << "ScoreLoopThread dtor called. Will wait for thread run() to finish.";

	m_quit = true;

	wait();

	qDebug() << "ScoreLoopThread dtor finished";

}

ScoreLoopThread* ScoreLoopThread::instance() {
	if (_pinstance == NULL) {
		_pinstance = new ScoreLoopThread();
	}
	return _pinstance;

}

//overrides run() from QThread (i think initiated when scoreloopThread->start() is called)
void ScoreLoopThread::run() {
	LOG("ScoreLoopThread run() started");

	AppData_t app;
	SC_InitData_t initData;
	SC_Error_t rc;
	char versionBuffer[0x100]; /* Thats 256 bytes */

	/* Initialize the BPS event system */
	bps_initialize();
	bps_set_verbosity(0); /* Set to 1 or 2 for more output if you like */

	memset(&app, 0, sizeof(AppData_t));

	/* Initialize the Scoreloop platform dependent SC_InitData_t structure to default values. */
	SC_InitData_Init(&initData);

	/* What version of the Scoreloop library do we use? */
	if (SC_GetVersionInfo(&initData, versionBuffer, sizeof(versionBuffer))) {
		//qDebug() << "Version-Info: " << versionBuffer;
		LOG("Version-Info: %s", versionBuffer);
	}

	/* Now, create the Scoreloop Client with the initialized SC_InitData_t structure
	 * as well as the game-id and game-secret as found on the developer portal.
	 */
	rc = SC_Client_New(&app.client, &initData, SCORELOOP_GAME_ID, SCORELOOP_GAME_SECRET, SCORELOOP_GAME_VERSION, SCORELOOP_GAME_CURRENCY, SCORELOOP_GAME_LANGUAGE);
	if (rc != SC_OK) {
		LOG("Error on SC_Client_NEW");
		HandleError(&app, rc);
	} else {
		//InformUser(&app, "Note", "Scoreloop Sample started...");

		//used to initiate SC_Client_CreateUserController
		//provides username in signal RequestUserCompleted(login) and user score
		RequestUser(&app);
	}

	while (!m_quit) {
		/* Get next BPS event */
		bps_event_t *event;
		bps_get_event(&event, -1);

		/* Scoreloop event handling  */
		if (bps_event_get_domain(event) == SC_GetBPSEventDomain(&initData)) {
			SC_HandleBPSEvent(&initData, event);
		}

		else if (bps_event_get_domain(event) == dialog_get_domain()) {
			dialog_destroy(dialog_event_get_dialog_instance(event));
			app.dialog = 0;
		}
		/* Add more BPS event handling here... */

	}

	/* Cleanup the Scoreloop client */
	SC_Client_Release(app.client);

	/* Shutdown BPS */
	bps_shutdown();
	LOG("ScoreloopThread run() finished");
}

void ScoreLoopThread::DisplayDialog(AppData_t *app, const char* title, const char* message) {
	/* Close a former dialog - if any */
	if (app->dialog) {
		dialog_destroy(app->dialog);
		app->dialog = 0;
	}

	/* Open a new alert dialog here - you would probably want to do something more elaborate */
	dialog_create_alert(&app->dialog);
	dialog_set_title_text(app->dialog, title);
	dialog_set_alert_message_text(app->dialog, message);
	dialog_add_button(app->dialog, DIALOG_OK_LABEL, true, NULL, true);
	dialog_show(app->dialog);
}

void ScoreLoopThread::InformUser(AppData_t *app, const char* title, const char* message) {
	/* Inform user by displaying a simple dialog here */
	DisplayDialog(app, title, message);

	/* Also log title and message */
	LOG("%s: %s", title, message);
}

void ScoreLoopThread::HandleError(AppData_t *app, SC_Error_t error) {
	/* Inform user with an alert dialog here - you would probably want to do a more intelligent error handling instead */
	//InformUser(app, "Error", SC_MapErrorToStr(error));

//	if(error == SC_HTTP_SERVER_ERROR) {
//		// other errors could be caught related to connection issues
//		Global::instance()->setIsInternetAvailable(false);
//		LOG("Internet access not available");
//	}

	//Global::instance()->setIsInternetAvailable(false);
	emit(instance()->ConnectionError("DATA CONNECTION ERROR!\nInternet access could be an issue\nYour scores may not be saved"));
	/* Also log the error */
	LOG("%s", SC_MapErrorToStr(error));
}

void ScoreLoopThread::RequestUser(AppData_t *app) {
	/* Create a UserController */
	SC_Error_t rc = SC_Client_CreateUserController(app->client, &app->userController, RequestUserCompletionCallback, app);
	if (rc != SC_OK) {
		LOG("RequestUser Error");
		HandleError(app, rc);
		return;
	}

	/* Make the asynchronous request */
	rc = SC_UserController_LoadUser(app->userController);
	if (rc != SC_OK) {
		LOG("LoadUser Error");
		SC_UserController_Release(app->userController);
		HandleError(app, rc);
		return;
	}
	LOG("Requesting User...");
}

void ScoreLoopThread::RequestUserCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_UserController_Release(app->userController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	LOG("Done requesting User");

	/* Get the session from the client. */
	SC_Session_h session = SC_Client_GetSession(app->client);

	/* Get the session user from the session. */
	SC_User_h user = SC_Session_GetUser(session);

	/* Write out some user data */
	SC_String_h login = SC_User_GetLogin(user);
	SC_String_h email = SC_User_GetEmail(user);

	LOG("User's login: %s and User's email: %s", login ? SC_String_GetData(login) : "<unknown>", email ? SC_String_GetData(email) : "<unknown>");

	/* We don't need the UserController anymore, so release it */
	SC_UserController_Release(app->userController);

	/* send this to the app so we can save it for future requests */
	emit(instance()->ScoreLoopUserReady(app));

	/* normal signal for emitting the username */
	emit(instance()->RequestUserCompleted(login ? SC_String_GetData(login) : "<unknown>"));

	LoadLeaderboardAroundUser(app, SC_SCORES_SEARCH_LIST_ALL,1);

	SyncAwards(app);
//	RequestGameData(app);
//	SubmitGameData(app);
}

void ScoreLoopThread::RequestGameData(AppData_t *app) {

	/* Create a UserController */
	SC_Error_t rc = SC_Client_CreateUserController(app->client, &app->userController, RequestGameDataCompletionCallback, app);
	if (rc != SC_OK) {
		LOG("RequestUser Error");
		HandleError(app, rc);
		return;
	}

	/* Make the asynchronous request */
	rc = SC_UserController_LoadUserContext(app->userController);
	if (rc != SC_OK) {
		LOG("LoadUser Error");
		SC_UserController_Release(app->userController);
		HandleError(app, rc);
		return;
	}
	LOG("Requesting User...");
}

void ScoreLoopThread::RequestGameDataCompletionCallback(void *userData, SC_Error_t completionStatus) {

	SC_String_h points;
	SC_Context_h myContext;
	SC_Error_t errCode;

	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_UserController_Release(app->userController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	LOG("Done requesting game data");

	/* Get the session from the client. */
	SC_Session_h session = SC_Client_GetSession(app->client);
	/* Get the session user from the session. */
	SC_User_h user = SC_Session_GetUser(session);

	myContext = SC_User_GetContext(user);

	errCode = SC_Context_Get(myContext, "points", &points);

	LOG("game data: %s", SC_String_GetData(points));

	//SC_UserController_Release(app->userController);

}

void ScoreLoopThread::SubmitGameData(AppData_t *app) {

	SC_String_h points;
	SC_Error_t errCode;
	SC_Context_h myContext;

	errCode = SC_String_New(&points, "1240");

	errCode = SC_Context_New(&myContext);
	// points is the const char string to which we assign the experience points
	SC_Context_Put(myContext, "points", points);

	/* Create a UserController */
	SC_Error_t rc = SC_Client_CreateUserController(app->client, &app->userController, SubmitGameDataCompletionCallback, app);
	if (rc != SC_OK) {
		LOG("RequestUser Error");
		HandleError(app, rc);
		return;
	}

	/* Get the session from the client. */
	SC_Session_h session = SC_Client_GetSession(app->client);

	/* Get the session user from the session. */
	SC_User_h user = SC_Session_GetUser(session);

	// myContext
	errCode = SC_User_SetContext(user, myContext);
	errCode = SC_UserController_SetUser(app->userController, user);
	/* Make the asynchronous request */
	errCode = SC_UserController_UpdateUserContext(app->userController);

	if (errCode != SC_OK) {
		LOG("GameData Error");
		SC_UserController_Release(app->userController);
		HandleError(app, rc);
		return;
	}
	LOG("Submitting game data...");
}

void ScoreLoopThread::SubmitGameDataCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		LOG("Context Error???");
		SC_UserController_Release(app->userController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	LOG("Done submitting game data");
	SC_UserController_Release(app->userController);

	RequestGameData(app);
}

void ScoreLoopThread::SubmitScore(AppData_t *app, double result, unsigned int mode) {
	//qDebug() << "Submitting score " << result;

	LOG("Submitting score: %f", result);
	/* Create a ScoreController */
	SC_Error_t rc = SC_Client_CreateScoreController(app->client, &app->scoreController, SubmitScoreCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Create and configure the score */
	rc = SC_Client_CreateScore(app->client, &app->score);
	if (rc != SC_OK) {
		SC_ScoreController_Release(app->scoreController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	SC_Score_SetLevel(app->score, 0); //0 was result
	SC_Score_SetResult(app->score, result);
	SC_Score_SetMode(app->score, mode); //easy/medium/hard

	/* Submit the score */
	rc = SC_ScoreController_SubmitScore(app->scoreController, app->score);
	if (rc != SC_OK) {
		SC_ScoreController_Release(app->scoreController); /* Cleanup Controller */
		SC_Score_Release(app->score); /* Cleanup Score */
		HandleError(app, rc);
		return;
	}
	//qDebug() << "Submitting Score...";
	LOG("Submitting Score...");
}

void ScoreLoopThread::SubmitScoreCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	SC_Error_t rc ;
	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ScoreController_Release(app->scoreController); /* Cleanup Controller */
		SC_Score_Release(app->score); /* Cleanup Score */
		HandleError(app, completionStatus);
		return;
	}
	//qDebug() << "Done submitting Score";
	LOG("Done submitting Score");

	/* Cleanup Controller */
	SC_ScoreController_Release(app->scoreController);

	SC_Score_h lastScore;

	rc = SC_Client_CreateScore(app->client, &lastScore);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}
	SC_Score_SetLevel(lastScore, SC_Score_GetLevel(app->score));
	SC_Score_SetResult(lastScore, SC_Score_GetResult(app->score));
	SC_Score_SetMode(lastScore, SC_Score_GetMode(app->score));

	ScoreData_t scoreData;
	scoreData.score = lastScore;

	emit(instance()->SubmitScoreCompleted(&scoreData));

	/* Cleanup Score */
	SC_Score_Release(app->score);
}

void ScoreLoopThread::LoadLeaderboard(AppData_t *app, SC_ScoresSearchList_t searchList, unsigned int count, bool includeBuddyList) {
	/* Create a ScoresController */
	SC_Error_t rc = SC_Client_CreateScoresController(app->client, &app->scoresController, LoadLeaderboardCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	if(includeBuddyList) {
		/* Get the session from the client. */
		SC_Session_h session = SC_Client_GetSession(app->client);

		/* Get the session user from the session. */
		SC_User_h user = SC_Session_GetUser(session);

		/* Configure the Controller */
		searchList.timeInterval = SC_TIME_INTERVAL_ALL;
		searchList.countrySelector = SC_COUNTRY_SELECTOR_ALL;
		searchList.country = NULL;
		searchList.usersSelector = SC_USERS_SELECTOR_BUDDYHOOD;
		searchList.buddyhoodUser = user;
	}

	rc = SC_ScoresController_SetSearchList(app->scoresController, searchList);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	SC_Range_t range;
	range.offset = 0;
	range.length = count;
	/* Load the Leaderboard for the given score and count */
	rc = SC_ScoresController_LoadScores(app->scoresController, range);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	qDebug() << "Loading Leaderboard...";
}

void ScoreLoopThread::LoadLeaderboardAroundScore(AppData_t *app, SC_Score_h score, SC_ScoresSearchList_t searchList, unsigned int count) {
	/* Create a ScoresController */
	SC_Error_t rc = SC_Client_CreateScoresController(app->client, &app->scoresController, LoadLeaderboardCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Configure the Controller */
	//only mode 0 probably remove next line
	SC_ScoresController_SetMode(app->scoresController, SC_Score_GetMode(score));
	rc = SC_ScoresController_SetSearchList(app->scoresController, searchList);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Load the Leaderboard for the given score and count */
	rc = SC_ScoresController_LoadScoresAroundScore(app->scoresController, score, count);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	LOG("LoadLeaderboardAroundScore - Loading Leaderboard...");
}

void ScoreLoopThread::LoadLeaderboardAroundUser(AppData_t *app, SC_ScoresSearchList_t searchList, unsigned int count) {

	/* Create a ScoresController */
	SC_Error_t rc = SC_Client_CreateScoresController(app->client, &app->scoresController, LoadLeaderboardCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Configure the Controller */
	//only mode 0 probably remove next line
	SC_ScoresController_SetMode(app->scoresController, 0);
	rc = SC_ScoresController_SetSearchList(app->scoresController, searchList);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Get the session from the client. */
	SC_Session_h session = SC_Client_GetSession(app->client);

	/* Get the session user from the session. */
	SC_User_h user = SC_Session_GetUser(session);

	/* Load the Leaderboard for the given user and count */
	rc = SC_ScoresController_LoadScoresAroundUser(app->scoresController, user, count);
	if (rc != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	LOG("LoadLeaderboardAroundUser - Loading Leaderboard...");
}

void ScoreLoopThread::LoadLeaderboardCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}

	/* Just log the scores here for demonstration purposes */
	SC_ScoreList_h scoreList = SC_ScoresController_GetScores(app->scoresController);
	if (scoreList == NULL) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, SC_NOT_FOUND);
		return;
	}
	LOG("Done loading Leaderboard");

	/* Get the score formatter here - remember that you need to add a
	 * scoreloop/SLScoreFormatter.strings file to your asset files in order to retrieve a formatter.
	 */
	SC_ScoreFormatter_h scoreFormatter = SC_Client_GetScoreFormatter(app->client);
	if (!scoreFormatter) {
		SC_ScoresController_Release(app->scoresController); /* Cleanup Controller */
		HandleError(app, SC_NOT_FOUND);
		return;
	}

	QVariantList leaderboardData;

	unsigned int i, numScores = SC_ScoreList_GetCount(scoreList);
	for (i = 0; i < numScores; ++i) {
		SC_Score_h score = SC_ScoreList_GetAt(scoreList, i);
		SC_User_h user = SC_Score_GetUser(score);
		SC_String_h login = user ? SC_User_GetLogin(user) : NULL;
		SC_String_h formattedScore;

		/* Format the score - we take ownership of string */
		int rc = SC_ScoreFormatter_FormatScore(scoreFormatter, score, SC_SCORE_FORMAT_SCORES_ONLY, &formattedScore);
		if (rc != SC_OK) {
			HandleError(app, rc);
			return;
		}
		//qDebug() << "  Rank: " << SC_Score_GetRank(score) << ", Result: " << SC_String_GetData(formattedScore) << ", User: " << (login ? SC_String_GetData(login) : "<unknown>");
		LOG("Rank: %i, Result: %s, User: %s",SC_Score_GetRank(score), SC_String_GetData(formattedScore), (login ? SC_String_GetData(login) : "<unknown>") );

		QVariantMap scoreData;
		scoreData["rank"] = SC_Score_GetRank(score);
		scoreData["formattedScore"] = SC_String_GetData(formattedScore);
		scoreData["username"] = login ? SC_String_GetData(login) : "<unknown>";

		leaderboardData.append(scoreData);

		/* Release the string */
		SC_String_Release(formattedScore);
	}

	emit(instance()->LoadLeaderboardCompleted(leaderboardData));

	/* Cleanup Controller */
	SC_ScoresController_Release(app->scoresController);

}

void ScoreLoopThread::AchieveAward(AppData_t *app, const char *awardIdentifier) {
	SC_Bool_t achieved;

	/* Create an Achievements Controller */
	SC_Error_t rc = SC_Client_CreateLocalAchievementsController(app->client, &app->achievementsController, AchieveAwardCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	if(!SC_LocalAchievementsController_IsAchievedForAwardIdentifier(app->achievementsController, awardIdentifier)){
		/* Set the award with the given identifier to be achieved */
		rc = SC_LocalAchievementsController_SetAchievedValueForAwardIdentifier(app->achievementsController, awardIdentifier, &achieved);
		if (rc != SC_OK) {
			SC_LocalAchievementsController_Release(app->achievementsController); /* Cleanup Controller */
			HandleError(app, rc);
			return;
		}

		emit(instance()->AchieveAwardCompleted());
	}

}

void ScoreLoopThread::SyncAwards(AppData_t *app) {
	/* Create an Achievements Controller */
	SC_Error_t rc = SC_Client_CreateLocalAchievementsController(app->client, &app->achievementsController, AchieveAwardCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Synchronize achievement if indicated - this can be done at some other point in time and does not have to come
	 * after every setting of an achievement.
	 */
	if (SC_LocalAchievementsController_ShouldSynchronize(app->achievementsController) == SC_TRUE) {
		rc = SC_LocalAchievementsController_Synchronize(app->achievementsController);
		if (rc != SC_OK) {
			SC_LocalAchievementsController_Release(app->achievementsController); /* Cleanup Controller */
			HandleError(app, rc);
			return;
		}
		qDebug() << "Synchronizing Achievements...";
		LOG("Synchronizing Achievements...");
	}
}

void ScoreLoopThread::AchieveAwardCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_LocalAchievementsController_Release(app->achievementsController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	qDebug() << "Done synchronizing Achievements";
	LOG("Done synchronizing Achievements");
	/* Cleanup Controller */
	SC_LocalAchievementsController_Release(app->achievementsController);

	/* Load Achievement here just for demonstration purposes */
	//LoadAchievements(app);
}

void ScoreLoopThread::LoadAchievements(AppData_t *app) {
	/* Create an Achievements Controller */
	SC_Error_t rc = SC_Client_CreateLocalAchievementsController(app->client, &app->achievementsController, LoadAchievementsCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Load the achievements */
	// callback isn't called for some reason, so it's called manually - code from sample
	LOG("Loading Achievements...");
	LoadAchievementsCompletionCallback(app, SC_OK);
}

void ScoreLoopThread::LoadAchievementsCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_LocalAchievementsController_Release(app->achievementsController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}

	/* Just log the achievements here for demonstration purposes */
	SC_AchievementList_h achievementList = SC_LocalAchievementsController_GetAchievements(app->achievementsController);
	if (achievementList == NULL) {
		SC_LocalAchievementsController_Release(app->achievementsController); /* Cleanup Controller */
		HandleError(app, SC_NOT_FOUND);
		return;
	}
	qDebug() << "Done loading Achievements";

	QVariantList achievementData;
	unsigned int i, numAchievements = SC_AchievementList_GetCount(achievementList);
	for (i = 0; i < numAchievements; ++i) {
		SC_Achievement_h achievement = SC_AchievementList_GetAt(achievementList, i);
		SC_Bool_t isAchieved = SC_Achievement_IsAchieved(achievement);
		SC_Award_h award = SC_Achievement_GetAward(achievement);
		SC_String_h title = SC_Award_GetLocalizedTitle(award);
		SC_String_h description = SC_Award_GetLocalizedDescription(award);
		SC_String_h image = SC_Achievement_GetImageName(achievement);
		//LOG("Awards: %s", SC_String_GetData(SC_Award_GetIdentifier(award)));

		QVariantMap awardData;
		awardData["order"] = i;
		awardData["achievement"] = SC_String_GetData(SC_Award_GetIdentifier(award));
		awardData["achieved"] = isAchieved;
		awardData["title"] = SC_String_GetData(title);
		awardData["description"] = SC_String_GetData(description);
		awardData["image"] = SC_String_GetData(image);
		LOG("Awards: %i, %s, %s, %i, %s", i, SC_String_GetData(title), SC_String_GetData(description), isAchieved, SC_String_GetData(image) );
		achievementData.append(awardData);
	}

	/* Cleanup Controller */
	SC_LocalAchievementsController_Release(app->achievementsController);
	emit(instance()->LoadAchievementsCompleted(achievementData));


	/* Create a Challenge here for demonstration purposes only */
	/*
	SC_Money_h money = GetStake(app);
	if (money) {
		CreateChallenge(app, money, GetScoreResult(app), 0);
	} else {
		// No balance, so skip this step and continue with next step for demonstration only
		LoadChallenges(app);
	}
	*/
}

void ScoreLoopThread::CreateChallenge(AppData_t *app, SC_Money_h stake, double result, unsigned int mode) {
	SC_Error_t rc;
	SC_Challenge_h challenge;
	SC_Score_h score;

	/* Create a ChallengeController */
	rc = SC_Client_CreateChallengeController(app->client, &app->challengeController, CreateChallengeCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Create a Challenge */
	rc = SC_Client_CreateChallenge(app->client, stake, NULL, mode, 0, &challenge);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Assign challenge to controller */
	rc = SC_ChallengeController_SetChallenge(app->challengeController, challenge);
	SC_Challenge_Release(challenge); /* Not needed anymore, so cleanup */
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Create a Score object with given result */
	rc = SC_Client_CreateScore(app->client, &score);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	rc = SC_Score_SetResult(score, result);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		SC_Score_Release(score); /* Cleanup Score */
		HandleError(app, rc);
		return;
	}

	/* Submit Challenge for score */
	rc = SC_ChallengeController_SubmitChallengeScore(app->challengeController, score);
	SC_Score_Release(score); /* Not needed anymore, so cleanup */
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	qDebug() << "Creating Challenge...";
}

void ScoreLoopThread::CreateChallengeCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	qDebug() << "Done creating Challenge";

	/* Cleanup Controller */
	SC_ChallengeController_Release(app->challengeController);

	/* Load open challenges just for demonstration purposes */
	LoadChallenges(app);
}

void ScoreLoopThread::LoadChallenges(AppData_t *app) {
	/* Create a Challenges Controller */
	SC_Error_t rc = SC_Client_CreateChallengesController(app->client, &app->challengesController, LoadChallengesCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Load the open challenges */
	rc = SC_ChallengesController_LoadOpenChallenges(app->challengesController);
	if (rc != SC_OK) {
		SC_ChallengesController_Release(app->challengesController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	qDebug() << "Loading Challenges...";
}

void ScoreLoopThread::LoadChallengesCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;
	SC_ChallengeList_h challengeList;
	int challengeCount;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ChallengesController_Release(app->challengesController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}

	/* Get the list of challenges*/
	challengeList = SC_ChallengesController_GetChallenges(app->challengesController);

	/* Log number of challenges for demonstration only*/
	challengeCount = challengeList != NULL ? SC_ChallengeList_GetCount(challengeList) : 0;
	qDebug() << "Done loading Challenges. Got: " << challengeCount;

	/* Accept some challenge if there is one with mode 0 for demonstration purposes only */
	if (challengeCount > 0) {
		int i;
		SC_Challenge_h challenge;

		for (i = 0; i < challengeCount; ++i) {
			challenge = SC_ChallengeList_GetAt(challengeList, i);

			if (SC_Challenge_GetMode(challenge) == 0) {

				/* Found a challenge with mode 0, so go for it */
				AcceptChallenge(app, challenge);

				/* Cleanup Controller */
				SC_ChallengesController_Release(app->challengesController);

				return;
			}
		}
	}

	/* Cleanup Controller */
	SC_ChallengesController_Release(app->challengesController);

	/* Done with sample, so inform user for demonstration purposes */
//	InformUser(app, "Note", "Successfully finished Scoreloop Integration Sample");
}

void ScoreLoopThread::AcceptChallenge(AppData_t *app, SC_Challenge_h challenge) {
	/* Create a ChallengeController */
	SC_Error_t rc = SC_Client_CreateChallengeController(app->client, &app->challengeController, AcceptChallengeCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Set challenge to be accepted */
	rc = SC_ChallengeController_SetChallenge(app->challengeController, challenge);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Inform server that we accepted that challenge */
	rc = SC_ChallengeController_AcceptChallenge(app->challengeController);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	qDebug() << "Accepting Challenge...";
}

void ScoreLoopThread::AcceptChallengeCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;
	SC_Challenge_h challenge;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	qDebug() << "Done accepting Challenge";

	/* In your game you would now start the game play to get a score result. Here we just
	 * pick a score result and submit the challenge
	 */
	challenge = SC_ChallengeController_GetChallenge(app->challengeController);

	/* Cleanup Controller - In order to have challenge stay alive, bump its retain-count */
	SC_Challenge_Retain(challenge);
	SC_ChallengeController_Release(app->challengeController);

	/* Submit Challenge */
	//SubmitChallenge(app, challenge, GetScoreResult(app), 0);

	/* Decrement retain count on challenge */
	SC_Challenge_Release(challenge);
}

void ScoreLoopThread::SubmitChallenge(AppData_t *app, SC_Challenge_h challenge, double result, unsigned int mode) {
	SC_Error_t rc;
	SC_Score_h score;

	/* Create a ChallengeController */
	rc = SC_Client_CreateChallengeController(app->client, &app->challengeController, SubmitChallengeCompletionCallback, app);
	if (rc != SC_OK) {
		HandleError(app, rc);
		return;
	}

	/* Set challenge to be accepted */
	rc = SC_ChallengeController_SetChallenge(app->challengeController, challenge);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}

	/* Create a Score object with given result and mode */
	rc = SC_Client_CreateScore(app->client, &score);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	rc = SC_Score_SetResult(score, result);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		SC_Score_Release(score); /* Cleanup Score */
		HandleError(app, rc);
		return;
	}
	rc = SC_Score_SetMode(score, mode);
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		SC_Score_Release(score); /* Cleanup Score */
		HandleError(app, rc);
		return;
	}

	/* Submit Challenge for score */
	rc = SC_ChallengeController_SubmitChallengeScore(app->challengeController, score);
	SC_Score_Release(score); /* Not needed anymore, so cleanup */
	if (rc != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, rc);
		return;
	}
	qDebug() << "Submitting Challenge...";
}

void ScoreLoopThread::SubmitChallengeCompletionCallback(void *userData, SC_Error_t completionStatus) {
	/* Get the application from userData argument */
	AppData_t *app = (AppData_t *) userData;

	/* Check completion status */
	if (completionStatus != SC_OK) {
		SC_ChallengeController_Release(app->challengeController); /* Cleanup Controller */
		HandleError(app, completionStatus);
		return;
	}
	qDebug() << "Done submitting Challenge";

	/* Cleanup Controller */
	SC_ChallengeController_Release(app->challengeController);

	/* Done with sample, so just inform user for demonstration purposes */
	//InformUser(app, "Note", "Successfully finished Scoreloop Integration Sample");
}



SC_Money_h ScoreLoopThread::GetStake(AppData_t *app) {
	/* Get all possible stakes */
	SC_MoneyList_h moneyList = SC_Session_GetChallengeStakes(SC_Client_GetSession(app->client));

	/* Just pick the first stake here - if available */
	if (SC_MoneyList_GetCount(moneyList) > 0) {
		return SC_MoneyList_GetAt(moneyList, 0);
	} else {
		return NULL;
	}
}
