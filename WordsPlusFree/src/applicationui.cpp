// Default empty project template
#include "applicationui.hpp"
#include "wordsearch.h"
#include "Countly.hpp"


#include <string>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Container>
#include <bb/cascades/Color>
#include <bb/cascades/Page>
#include <bb/cascades/Label>
#include <bb/cascades/SystemDefaults>
#include <bb/cascades/StackLayout>
#include <bb/cascades/StackLayoutProperties>
#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>
#include <bb/system/SystemUiButton>
#include <bb/system/SystemDialog>
#include <bb/system/SystemToast>
#include <bb/multimedia/SystemSound>
#include <bb/cascades/FadeTransition>
#include <bb/cascades/InvokeQuery>
#include <bb/system/InvokeManager>
#include <bb/cascades/advertisement/Banner>


//should probably all be static const and not #define as this makes them global
#define NORMAL		1
#define SELECTED	2
#define HIGHLIGHT	3
#define REGISTERBBM 4
#define PROFILEBOXPUZZLECOMPLETED 5
#define PRESONALMESSAGE 6
#define STATUSMESSAGE 7
#define INVITETODOWNLOAD 8
#define HINTREVEAL	9
#define HINTROTATEUP	10
#define WORDSFOUND "settingsWordsFound"
#define THEME "settingsTheme"
#define CATEGORY "settingsCategory"
#define SOUNDBACKGROUNDMUSIC "X.WAV"
#define SOUNDLEVELCOMPLETED "puzzleCompleted.wav"
#define SOUNDWORDFOUND "wordFound.wav"
#define SOUNDLETTERSELECTED "letterSelected"
#define SOUND "settingsSound"
#define MUSIC "settingsMusic"
#define PROFILEBOXUPDATES "settingsProfileBox"
#define PUZZLECOMPLETEDTIME "settingsPuzzleTime"
#define SCORE "settingsScore"
#define GAMESPLAYED "settingsGamesPlayed"
#define DIFFICULTY "settingsDifficulty"
#define FIRSTTIMEUSER "settingsFirstTimeUser"
#define PAID "settingsPaid"
#define REVIEWED "settingsUserReviewed"

//global - to be accessed from ApplicationUI to set awards
//static const char SCORELOOP_TESTONE[] =	"wordsplus.testaward";
//static const char SCORELOOP_TESTTWO[]	= "wordsplus.testaward2";
//static const char SCORELOOP_TESTTHREE[] = "wordsplus.testaward3";
static const char SCORELOOP_BBMPERSONALMSG[] = "wordsplus.bbmpersonalmsg";
static const char SCORELOOP_BBMSTATUSMSG[] = "wordsplus.bbmstatusmsg";
static const char SCORELOOP_BBMINVITE[] = "wordsplus.bbminvitetodownload";
static const char SCORELOOP_FIRSTGAME[] = "wordsplus.firstgame";
static const char SCORELOOP_USEAHINT[] = "wordsplus.usehint";
static const char SCORELOOP_BACKTWOBACK[] = "wordsplus.backtwoback";
static const char SCORELOOP_THREESOME[] = "wordsplus.threesome";
static const char SCORELOOP_NOHINTATHARD[] = "wordsplus.nohintsathard";
static const char SCORELOOP_UNDERTHIRTYATEASY[] = "wordsplus.underthirtyateasy";
static const char SCORELOOP_JUSTAVERAGE[] = "wordsplus.overthreeminsatmedium";
static const char SCORELOOP_OVERTENMINS[] = "wordsplus.overtenmins";
static const char SCORELOOP_NINETOFIVE[] = "wordsplus.ninetofive";
static const char SCORELOOP_UNDERONEMIN[] = "wordsplus.underonemin";
static const char SCORELOOP_OVERTENK[] = "wordsplus.overtenthousand";
static const char SCORELOOP_UNTOUCHABLE[] = "wordsplus.untouchable";
static const char SCORELOOP_RUSHHOUR[] = "wordsplus.rushhour";
static const char SCORELOOP_OVERFIFTYK[] = "wordsplus.overfiftythousand";
static const char SCORELOOP_OVERONETHOUSANDK[] = "wordsplus.overonethousandk";
static const char SCORELOOP_MIDNIGHT[] = "wordsplus.midnightrun";
static const char SCORELOOP_OVERONEMILLION[] = "wordsplus.overonemillion";
static const char SCORELOOP_OVERONEBILLION[] = "wordsplus.overonebillion";

#define LOG(fmt, args...)   do { fprintf(stdout, "[WorsPlusGame.cpp ] " fmt "\n", ##args); fflush(stdout); } while (0);

using namespace bb::cascades;
using namespace bb::system;
using namespace bb::multimedia;
using namespace bb::cascades::advertisement;


ApplicationUI::ApplicationUI(bb::platform::bbm::Context &context, bb::cascades::Application *app)
: QObject(app), m_context(&context)
{

	//LOG("appui function");
	//set default values
	deltaX = 0.0;
	deltaY = 0.0;
	multiple = 1;
	length = 0;
	directionalBoundPos = 35;
    directionalBoundNeg = -35;
	upperbound = 100;
	lowerbound = 0;
	position = 0;
	tileSize = 68;
	timeSec = 0;
	stopWatch = NULL;
	numberOfWordsFound = 0;
	m_strSeletedLetters = "";
	isPuzzleDisplayed = false;
	isHomePageDisplayed = false;
	wordDataValue = -1;
	continuousGameAward = 0;
	achievedAward = 0;
	bbmLoveAward = false;
	bbmBusyAward = false;
	bbmInviteAward = false;
	hintUsedAward = false;
	isRandomPuzzle = false;

	// Initialize for local storage settings
	settings = new GameSettings();
	//score loop stuff - need to register to make it work - investigate
	qmlRegisterType<ScoreLoopThread>("wordsPlus", 1, 0, "ScoreLoop");

	//TODO do i use this still?
	// Initialize the sound manager with a directory that resides in the
	// assets directory which only contains playable files.
	mSoundManager = new SoundManager("sounds/");
}


// Look into what else to destroy if nescessary
ApplicationUI::~ApplicationUI() {
	// Destroy the sound manager.
	delete mSoundManager;
}

void ApplicationUI::show() {

	//LOG("show function");

	QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
	qml->setContextProperty("wordsPlus", this);

	if (!qml->hasErrors()) {

		//LOG("qml has no errors");
		appPage = qml->createRootObject<Page>();

		if (appPage) {

			//LOG("appPage");
			ControlsForBBM(REGISTERBBM);

			Application::instance()->setCover(new ActiveFrame());

			// scoreloop stuff
			mScoreLoop = ScoreLoopThread::instance();
			QObject::connect(mScoreLoop, SIGNAL(ScoreLoopUserReady(AppData_t*)),
					this, SLOT(scoreLoopLoaded(AppData_t*)));
			QObject::connect(mScoreLoop,
					SIGNAL(SubmitScoreCompleted(ScoreData_t*)), this,
					SLOT(onSubmitScoreCompleted(ScoreData_t*)));
			QObject::connect(mScoreLoop, SIGNAL(LoadLeaderboardCompleted(QVariantList)),
					this, SLOT(onLoadLeaderboardCompleted(QVariantList)));
			QObject::connect(mScoreLoop, SIGNAL(AchieveAwardCompleted()),
								this, SLOT(onAchievedAward()));

			// orientation sensor
			mOrientationSensor = new OrientationSensor(this);
			QObject::connect(mOrientationSensor, SIGNAL(orientationChanged()),
					this, SLOT(onOrientationChanged()));

			// deal with stuff when enter/exit thumbnail or fullscreen
			QObject::connect(Application::instance(), SIGNAL(thumbnail()), this,
					SLOT(onThumbnail()));
			QObject::connect(Application::instance(), SIGNAL(fullscreen()),
					this, SLOT(onFullscreen()));

			// worknik
			wordnik = new Wordnik();
			QObject::connect(wordnik, SIGNAL(completedWordOfTheDay(QString)),
								this, SLOT(onWordOfTheDay(QString)));
			QObject::connect(wordnik, SIGNAL(completedWordList(QString)),
								this, SLOT(onWordList(QString)));


			// Registers the banner for QML
			qmlRegisterType<bb::cascades::advertisement::Banner>(
			   "bb.cascades.advertisement", 1, 0, "Banner");

			InitializeHomePage();
			InitializePuzzlePage();
			Application::instance()->setScene(appPage);

			mScoreLoop->start();
			countly::CountlyInit(Application::instance(), "https://cloud.count.ly", "your key here");
		}
	}else{
		LOG("mQmlDocument has errors");
	}

}

void ApplicationUI::onThumbnail() {
	stopTimer();
	continuousGameAward = 0;
}

void ApplicationUI::onFullscreen() {
	startTimer();
}

void ApplicationUI::onOrientationChanged() {
	if (mOrientationSensor->orientation() == mOrientationSensor->OrientationSensor::RightUp) {
		if (isPuzzleDisplayed) {
			//used for achievements
			hintUsedAward = true;

//			ImageView *redHeartImage = puzzlePageControl->findChild<ImageView*>("puzzleHeart");
//			redHeartImage->setRotationZ(90);

			int r = rand() % listOfWords.count(); //list of words reduced once word is found
			//LOG("list count: %i", listOfWords.count());
			//LOG("hint word: %s",listOfWords[r].toStdString().c_str());
			wordDataValue = wordDataIndex.value(listOfWords[r]);
			//LOG("wordDataValue: %i", wordDataValue);
			if(wordDataValue >= 0) HighlightSelectedTile(wordDataValue, HINTREVEAL);
		}
		else if(isHomePageDisplayed) {
//			ImageView *rotateHeartImage = homePageControl->findChild<ImageView*>("rotateHeartImage");
//			ImageView *rotateProfileImage = homePageControl->findChild<ImageView*>("rotateProfileImage");
//			ImageView *rotateHomeImage = homePageControl->findChild<ImageView*>("rotateHomeImage");
//			ImageView *rotateImageMsg = homePageControl->findChild<ImageView*>("rotateImageMsg");
//			rotateHeartImage->setRotationZ(90);
//			rotateProfileImage->setRotationZ(90);
//			rotateHomeImage->setRotationZ(90);
//			rotateImageMsg->setOpacity(1);
		}
	} // end of rightup
	if (mOrientationSensor->orientation() == mOrientationSensor->OrientationSensor::TopUp) {
		if (isPuzzleDisplayed && wordDataValue >= 0) {
//			ImageView *redHeart = puzzlePageControl->findChild<ImageView*>("puzzleHeart");
//			redHeart->setRotationZ(0);

			HighlightSelectedTile(wordDataValue, HINTROTATEUP);
		}
		else if(isHomePageDisplayed) {
//			ImageView *rotateHeartImage = homePageControl->findChild<ImageView*>("rotateHeartImage");
//			ImageView *rotateProfileImage = homePageControl->findChild<ImageView*>("rotateProfileImage");
//			ImageView *rotateHomeImage = homePageControl->findChild<ImageView*>("rotateHomeImage");
//			ImageView *rotateImageMsg = homePageControl->findChild<ImageView*>("rotateImageMsg");
//			rotateHeartImage->setRotationZ(0);
//			rotateProfileImage->setRotationZ(0);
//			rotateHomeImage->setRotationZ(0);
//			rotateImageMsg->setOpacity(0);
		}
	} //end of topup
}

/****SCORELOOP*****/
void ApplicationUI::scoreLoopLoaded(AppData_t *data) {
	mAppData = data;
}

void ApplicationUI::onSubmitScoreCompleted(ScoreData_t *scoreData) {
	mLastScoreData = scoreData;
	emit(submitScoreCompleted());
}

void ApplicationUI::submitScore(int score) {
	if (Global::instance()->getIsInternetAvailable() && mAppData) {
		ScoreLoopThread::SubmitScore(mAppData, score, 0);
	}
}

void ApplicationUI::onLoadLeaderboardCompleted(QVariantList data) {
	if(data.count() == 1){
		QMap<QString, QVariant> mapScore = data[0].toMap();
		int score = mapScore.value("formattedScore").toInt();
		settings->saveValueFor(SCORE, QString::number(score));
		emit scoreChanged();
		LOG("user score: %i", score);
	}
}

void ApplicationUI::loadLeaderboard(bool includeBuddyList) {
	LOG("loadLeaderboard")
	if (Global::instance()->getIsInternetAvailable() && mAppData) {
		ScoreLoopThread::LoadLeaderboard(mAppData, SC_SCORES_SEARCH_LIST_ALL, 50, includeBuddyList);
	}
}

void ApplicationUI::loadLeaderboardAroundLastScore() {
	if (Global::instance()->getIsInternetAvailable() && mAppData) {
		ScoreLoopThread::LoadLeaderboardAroundScore(mAppData,
				mLastScoreData->score, SC_SCORES_SEARCH_LIST_ALL, 5);
	}
}

void ApplicationUI::loadLeaderboardAroundUser() {
	if (Global::instance()->getIsInternetAvailable() && mAppData) {
		ScoreLoopThread::LoadLeaderboardAroundUser(mAppData,
				SC_SCORES_SEARCH_LIST_ALL, 5);
	}
}

void ApplicationUI::LoadAchievementsAwards() {
	if (Global::instance()->getIsInternetAvailable() && mAppData) {
		ScoreLoopThread::LoadAchievements(mAppData);
	}
}

void ApplicationUI::ProcessAwards() {
//TODO
	int puzzleTimeAward = 0;
	int scoreAward = 0;
	int difficultyAward = 0;
	bool nineTofiveAward = false;
	bool rushHourAward = false;
	bool midnightAward = false;

	continuousGameAward++;
	puzzleTimeAward = timeSec;
	scoreAward = getScore();
	difficultyAward = getDifficulty();

	QDate today;
	int day = today.dayOfWeek();
	int hourOfDay = QTime::currentTime().hour();
	if(day < 6) {
		if( (hourOfDay > 8) && (hourOfDay < 17) ) {
			nineTofiveAward = true;
		} else if ( (hourOfDay > 5) and (hourOfDay < 9) ) {
			rushHourAward = true;
		} else if ( (hourOfDay > 16) and (hourOfDay < 20) ) {
			rushHourAward = true;
		}
	}

	// time between 11pm and 1am
	if( hourOfDay > 22) {
		midnightAward = true;
	}

	if( hourOfDay < 1 ) {
		midnightAward = true;
	}

//	if( (puzzleTimeAward <= 120) && (difficultyAward == 2) ) {
//		ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_TESTONE);
//	}
//	if(continuousGameAward == 3) {
//		ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_TESTTWO);
//	}
//	if(scoreAward > 500) {
//		ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_TESTTHREE);
//	}

	if (Global::instance()->getIsInternetAvailable()  && mAppData) {
		//beginner's luck
		ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_FIRSTGAME);

		//two games straight
		if (continuousGameAward == 2) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_BACKTWOBACK);
		}

		//three games straight
		if (continuousGameAward == 3) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_THREESOME);
		}

		//rush hour
		if(rushHourAward) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_RUSHHOUR);
		}

		//nine to five
		if(nineTofiveAward) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_NINETOFIVE);
		}

		//midnight run
		if(midnightAward) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_MIDNIGHT);
		}

		//no hint at hard
		if( !hintUsedAward && difficultyAward == 8) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_NOHINTATHARD);
		}

		//use a hint
		if( hintUsedAward ) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_USEAHINT);
		}

		//under 30 secs at easy
		if( (puzzleTimeAward <= 30) && (difficultyAward == 2) ) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_UNDERTHIRTYATEASY);
		}

		//over 3 mins at medium
		if( (puzzleTimeAward > 180) && (difficultyAward == 4) ) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_JUSTAVERAGE);
		}

		//under 1 min at hard
		if( (puzzleTimeAward <= 60) && (difficultyAward == 8) ) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_UNDERONEMIN);
		}

		//over 10 mins
		if (puzzleTimeAward > 600) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERTENMINS);
		}

		//over 10K points
		if (scoreAward > 10000) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERTENK);
		}

		//over 50K points
		if (scoreAward > 50000) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERFIFTYK);
		}

		//over 100K points
		if (scoreAward > 100000) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERONETHOUSANDK);
		}

		//over 1Million points
		if (scoreAward > 1000000) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERONEMILLION);
		}

		//over 1Billion points
		if (scoreAward > 1000000000) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_OVERONEBILLION);
		}

		//20 games straight
		if (continuousGameAward == 20) {
			ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_UNTOUCHABLE);
		}


		ScoreLoopThread::SyncAwards(mAppData);
	}
}

void ApplicationUI::onAchievedAward() {
	achievedAward = 1;
	emit achievedAwardChanged();
}

int ApplicationUI::getAchievedAward() {
	return achievedAward;
}

ScoreLoopThread* ApplicationUI::scoreLoop() {
	return ScoreLoopThread::instance();
}
/****SCORELOOP*****/

void ApplicationUI::InitializeHomePage() {

	isPuzzleDisplayed = false;
	isHomePageDisplayed = true;
	continuousGameAward = 0;
	stopWatch = NULL;
	QmlDocument* qmlContent = QmlDocument::create("asset:///HomePage.qml");
	qmlContent->setContextProperty("wordsPlus", this);
	homePageControl = qmlContent->createRootObject<Control>();
	appPage->setContent(homePageControl);
}

void ApplicationUI::InitializePuzzlePage() {

	QmlDocument* qmlContent = QmlDocument::create("asset:///PlayPuzzlePage.qml");
	qmlContent->setContextProperty("wordsPlus", this);
	puzzlePageControl = qmlContent->createRootObject<Control>();
	//setContent performed in InitializePlayArea

}

void ApplicationUI::intializePlayArea() {

	hintUsedAward = false;
	achievedAward = 0;
	isPuzzleDisplayed = true;
	isHomePageDisplayed = false;
	wordDataValue = -1;
	listOfWords.clear();

	//reset after puzzle completed
	if(getCategory() == "wordnik"){isRandomPuzzle = true;}

	//need to do id for timer, then get container to setup timer
	mPlayAreaContainer = puzzlePageControl->findChild<Container*>("playAreaContainer");
	mPlayAreaContainer->removeAll();
	mWordsToFindContainer = puzzlePageControl->findChild<Container*>("wordsToFind");
	mWordsToFindContainer->removeAll();

	Container* pContainer = new Container();
	AbsoluteLayout *pAbsoluteLayout = new AbsoluteLayout();
	pContainer->setLayout(pAbsoluteLayout);

	TextStyle subTitleWhite = SystemDefaults::TextStyles::smallText();
	subTitleWhite.setColor(Color::fromARGB(0xfffafafa));

	// As long as nothing is broken, we continue.
	if (mPlayAreaContainer) {

		std::string cat = getCategory().toLower().toStdString();
		cat.append(".txt");

		//LOG("isRandomPuzzle: %i", isRandomPuzzle);
		char** letter = createNewPuzzle((char*) cat.c_str(), getDifficulty(), isRandomPuzzle);
		isRandomPuzzle = false; //reset
		QList<char*> puzzleWords = returnPuzzleWords();

		numberOfWords = returnNumberOfPuzzleWords();
		wordDataIndex = returnPuzzleIndex();

		for (int i = 0; i < numberOfWords; i++) {
			listOfWords.append(puzzleWords[i]);

			//LOG("word index: %i", wordDataList[listOfWords]);

			//get word, create label and add to wordsToFind container
			QString labelText = puzzleWords[i];
			Label *wordLabel = new Label();
			wordLabel->textStyle()->setBase(subTitleWhite);
			wordLabel->setObjectName(labelText);
			wordLabel->setText(labelText);

			//always give them x space and then if total is more than 720
			//update positionY (new line)

			if (i <= 3) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * i);
				pProperties->setPositionY(0.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}
			if (i >= 4 && i <= 7) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * (i - 4));
				pProperties->setPositionY(30.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}
			if (i >= 8) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * (i - 8));
				pProperties->setPositionY(60.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}

			mWordsToFindContainer->add(pContainer);
		}

		mNumTiles = 10; // Calculate the size of the tiles
		mWantedSize = mPlayAreaContainer->preferredWidth() / mNumTiles;

		// Iterate through all the tiles.
		for (int i = 0; i < mNumTiles; i++) {
			Container* columnContainer = new Container();

			for (int ii = 0; ii < mNumTiles; ii++) {
				ImageView *imageView =
						ImageView::create().bottomMargin(0).topMargin(0).leftMargin(
								0).rightMargin(0);
				imageView->setPreferredSize(mWantedSize, mWantedSize);

				QString imageSource = QString("asset:///theme/%1/letters/%2.png").arg(getTheme(),QString(letter[i][ii]).toLower());
				imageView->setImage(Image(imageSource));

				// We are connecting all our tiles to the same slot, we can later identify them by sender().
				connect(imageView, SIGNAL(touch(bb::cascades::TouchEvent *)),
						this, SLOT(onTileTouch(bb::cascades::TouchEvent *)));

				// Keep track of the ImageView.
				mPlayField[i][ii] = imageView;
				mPlayField[i][ii]->setObjectName(
						QString(letter[i][ii]).toLower());
				columnContainer->add(imageView);
			}

			mPlayAreaContainer->add(columnContainer);
		} // for loop

		//Call timer class - Depends on what challenge (regular or beat-the-clock type thing)
		initTimer();
		resetTimer();
		numberOfWordsFound = 0;

	} // set up mPlayAreaContainer

	appPage->setContent(puzzlePageControl);

}

void ApplicationUI::onTileTouch(bb::cascades::TouchEvent *event) {

	//get initial position of tile touched
	if (event->isDown()) {
		// Find who sent it.
		ImageView* senderImage = dynamic_cast<ImageView*>(sender());
		if (senderImage != NULL) {

			multiple = 1;
			//get initial position of finger touch
			initX = event->windowX();
			initY = event->windowY();

			// If that container is real, we iterate through all the tiles.
			for (int i = 0; i < mNumTiles; i++) {
				for (int ii = 0; ii < mNumTiles; ii++) {

					if (mPlayField[i][ii] == senderImage) {

						// Get array position
						if (i == 0) {
							position = ii;
						}
						if (i > 0) {
							position = i * 10 + ii;
						}
						tileNumbers.append(position);
						HighlightSelectedTile(position, HIGHLIGHT);
					}
				} // Inner loop
			} // Outer loop
		} // if statement
	} // isDown

	if (event->isMove()) {

		deltaX = event->windowX() - initX;
		deltaY = event->windowY() - initY;

		//Y direction only
		if (deltaX >= directionalBoundNeg && deltaX <= directionalBoundPos) {
			length = (int) deltaY;
			//deltaY increases (+ve) when finger moves top to bottom
			if (length / tileSize == multiple && length > 0) {
				position += 1;
				//LOG("%i", position);
				if (position < upperbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
			//deltaY decreases (-ve) when finger moves bottom to top
			if (length / tileSize == -multiple && length < 0) {
				position -= 1;
				if (position > lowerbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
		} else if (deltaY >= directionalBoundNeg && deltaY <= directionalBoundPos) {
			length = (int) deltaX;
			//deltaX increases (+ve) when finger moves left to right
			if (length / tileSize == multiple && length > 0) {
				position += 10;
				if (position < upperbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
			//deltaX decreases (-ve) when finger moves right to left
			if (length / tileSize == -multiple && length < 0) {
				position -= 10;
				if (position > lowerbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
		} else if (deltaX > directionalBoundPos) { //east
			if (deltaY > directionalBoundPos) { // diagonal South East
				length = (int) deltaY;
				if (length / tileSize == multiple) {
					position += 10; //x
					position += 1; //y
					if (position < upperbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
			if (deltaY < directionalBoundNeg) { // diagonal North East
				length = (int) deltaY;
				if (length / tileSize == -multiple) {
					position += 10; //x
					position -= 1; //y
					if (position < upperbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
		} else if (deltaX < directionalBoundNeg) { // west
			if (deltaY > directionalBoundPos) { // diagonal South West
				length = (int) deltaY;
				if (length / tileSize == multiple) {
					position -= 10; //x
					position += 1; //y
					if (position > lowerbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
			if (deltaY < directionalBoundNeg) { // diagonal North West
				length = (int) deltaY;
				if (length / tileSize == -multiple) {
					position -= 10; //x
					position -= 1; //y
					if (position > lowerbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
		}

	} // isMove

	if (event->isUp()) {
		position = 0;
		multiple = 1;
		WordCompleted(tileNumbers);
		tileNumbers.clear();
		//LOG("touch event->isUp");
	} // isUp

	if (event->isCancel()) {
		//LOG("touch event->isCancelled");
		position = 0;
		multiple = 1;
		WordCompleted(tileNumbers);
		tileNumbers.clear();
	}

}

bool ApplicationUI::isHighlighted(int pos) {
	bool isTileHighlighted = false;

	int i;
	int ii;
	QString imageSource;

	if (pos <= 9) {
		i = 0;
		ii = pos;
	}
	if (pos >= 10) {
		i = pos / 10;
		ii = pos % 10;
	}

	// Get the object name (actually the image name which is easy to identify).
	QVariant v = mPlayField[i][ii]->imageSource();

	if (v.canConvert<QString>()) {
		QString objName = v.value<QString>(); // entire path of image letter ../highlight/a.png

		if (!objName.contains("highlight", Qt::CaseInsensitive)) {
			isTileHighlighted = true;
		}
	}

return 	isTileHighlighted;
}

void ApplicationUI::HighlightSelectedTile(int pos, int stateOfLetter) {

	int i;
	int ii;
	QString imageSource;

	if (pos <= 9) {
		i = 0;
		ii = pos;
	}
	if (pos >= 10) {
		i = pos / 10;
		ii = pos % 10;
	}

	// Get the object name (actually the image name which is easy to identify).
	QVariant v = mPlayField[i][ii]->imageSource();

	if (v.canConvert<QString>()) {
		QStringList imageSrc = v.value<QString>().split("/");
		int index = imageSrc.size() - 1; // size gives count not last index
		QStringList letterSrc = (imageSrc[index]).split(".");
		QString letter = letterSrc[0]; //a.png

		switch (stateOfLetter) {
			case NORMAL:
				imageSource = QString("asset:///theme/%1/letters/%2").arg(getTheme(),imageSrc[index]);
				break;
			case SELECTED:
				imageSource = QString("asset:///theme/%1/letters/selected/%2").arg(getTheme(),imageSrc[index]);
				mPlayField[i][ii]->setObjectName("selected");
				break;
			case HIGHLIGHT:
				imageSource = QString("asset:///theme/%1/letters/highlight/%2").arg(getTheme(),imageSrc[index]);
				playSound(SOUNDLETTERSELECTED);
				setSelectedLetters(letter);
				break;
			case HINTREVEAL:
				mPlayField[i][ii]->setRotationZ(90);
				imageSource = QString("asset:///theme/%1/letters/hints/%2").arg(getTheme(),imageSrc[index]);
				playSound(SOUNDLETTERSELECTED);
				break;
			case HINTROTATEUP:
				imageSource = QString("asset:///theme/%1/letters/hints/%2").arg(getTheme(),imageSrc[index]);
				mPlayField[i][ii]->setRotationZ(0);
				break;
		}

		mPlayField[i][ii]->setImage(Image(imageSource));
	}

}

void ApplicationUI::WordCompleted(QList<int> listOfNumbers) {

	int i;
	int ii;
	QString selectedWord;

	//TODO REMOVE ME
	//emit puzzleCompleted();
	//if(getIsPaid()){ProcessAwards();}
	//REMOVE ABOVE

	//whether word found or not blank out selectedLetters
	setSelectedLetters("clear");

	// get corresponding letters and make word
	for (int j = 0; j < listOfNumbers.size(); j++) {
		int pos = listOfNumbers.at(j);

		if (pos <= 9) {
			i = 0;
			ii = pos;
		}
		if (pos >= 10) {
			i = pos / 10;
			ii = pos % 10;
		}

		QVariant v = mPlayField[i][ii]->imageSource();

		if (v.canConvert<QString>()) {
			QString objURL = v.value<QString>();
			QStringList imageSrc = objURL.split("/");
			int index = imageSrc.size() - 1; // size gives count not last index
			QString letter = imageSrc[index].split(".")[0];
			selectedWord.append(letter.toUpper()); // append letters to make word
		}
	}

	if (listOfWords.indexOf(selectedWord) >= 0) { // word found in puzzle words

		//remove word from list so it can't be selected a second time
		listOfWords.removeAll(selectedWord);

		//highlight word
		for (int j = 0; j < listOfNumbers.size(); j++) {
			int pos = listOfNumbers.at(j);
			HighlightSelectedTile(pos, SELECTED);
		}

		//update variable, cross off list
		numberOfWordsFound++;
		CrossOutPuzzleWord(selectedWord);

		// save off total words found - create a setter
		bool ok;
		int found = settings->getValueFor(WORDSFOUND, "0").toInt(&ok, 10);
		if (ok) {
			found++;
			settings->saveValueFor(WORDSFOUND, QString::number(found));
			emit totalWordsFoundChanged();
		}

		if (numberOfWordsFound == numberOfWords) { // Puzzle Completed
			setGamesPlayed();
			SaveBestPuzzleTime(timeSec);
			setScore(timeSec);
			playSound(SOUNDLEVELCOMPLETED);
			ControlsForBBM(PROFILEBOXPUZZLECOMPLETED);
			if(getIsPaid()){ProcessAwards();} //TODO only available if paid for
			isPuzzleDisplayed = false;
			emit puzzleCompleted();
		}
		else {
			playSound(SOUNDWORDFOUND); //puzzle not completed, single word found
		}

	} else {
		for (int j = 0; j < listOfNumbers.size(); j++) { //word not found in puzzle words
			int pos = listOfNumbers.at(j);

			if (pos <= 9) {
				i = 0;
				ii = pos;
			}
			if (pos >= 10) {
				i = pos / 10;
				ii = pos % 10;
			}

			QVariant v = mPlayField[i][ii]->objectName();

			if (v.canConvert<QString>()) {
				QString objName = v.value<QString>(); // letter of word completed

				if (!objName.contains("selected", Qt::CaseInsensitive)) { // not part of another word
					HighlightSelectedTile(pos, NORMAL);
				} else {
					HighlightSelectedTile(pos, SELECTED);
				}
			}
		}
	}

}

void ApplicationUI::CrossOutPuzzleWord(QString wordFound) {

	Label *mWordFound = appPage->findChild<Label*>(wordFound);

	TextStyle subTitleSelected = SystemDefaults::TextStyles::smallText();
	subTitleSelected.setColor(Color::fromARGB(0xff00629C));
	mWordFound->textStyle()->setBase(subTitleSelected);

}

void ApplicationUI::showToast(QString msg) {

	emit mainSysToastSignal(msg);
}

void ApplicationUI::onTick() {
	timeSec++;
	timeKeeper = QDateTime::fromTime_t(timeSec);
	m_strTime = timeKeeper.toString("mm':'ss");
	emit timeChanged();
}

void ApplicationUI::initTimer() {

	if (stopWatch == NULL) {
		stopWatch = new Timer();
		connect(stopWatch, SIGNAL(timeout()), this, SLOT(onTick()));
		stopWatch->setInterval(1000);
	}
}

void ApplicationUI::startTimer() {

	if (stopWatch == NULL) {
		//do nothing
	} else {
		stopWatch->start();
	}
}

void ApplicationUI::stopTimer() {

	if (stopWatch == NULL) {
		//do nothing
	} else {
		stopWatch->stop();
	}
}

void ApplicationUI::resetTimer() {

	if (stopWatch != NULL) {
		stopWatch->stop();
		timeSec = 0;
		stopWatch->start();
	}
}

QString ApplicationUI::getTheme() {
	return settings->getValueFor(THEME, "wordsPlus");
}

void ApplicationUI::setTheme(const QString themeName) {
	settings->saveValueFor(THEME, themeName);
	emit themeChanged();
}

QString ApplicationUI::getCategory() {
	m_strCategory = settings->getValueFor(CATEGORY, "WEATHER");
	return m_strCategory;
}

void ApplicationUI::setCategory(const QString cat) {
	m_strCategory = cat;
	settings->saveValueFor(CATEGORY, m_strCategory);
	emit categoryChanged(m_strCategory);
}

QString ApplicationUI::getTime() {
	return m_strTime;
}

QString ApplicationUI::getTotalWordsFound() {
	return settings->getValueFor(WORDSFOUND, "0");
}

void ApplicationUI::playSound(const QString msg) {

	if (getSound()) { // if true play sound
		if (msg == SOUNDLETTERSELECTED)
			SystemSound::play(SystemSound::InputKeypress);
		else
			mSoundManager->play(msg);
	}

}

bool ApplicationUI::getSound() {
	bool okSound;
	QString strSoundEnabled = settings->getValueFor(SOUND, "1");
	isSoundEnabled = strSoundEnabled.toInt(&okSound, 10);
	return isSoundEnabled;
}

void ApplicationUI::setSound(bool status) {
	isSoundEnabled = status;
	QString strSoundEnabled = QString::number(isSoundEnabled);
	settings->saveValueFor(SOUND, strSoundEnabled);
	emit soundChanged();
}

bool ApplicationUI::getMusic() {
	bool okMusic;
	QString strMusicEnabled = settings->getValueFor(MUSIC, "0");
	isMusicEnabled = strMusicEnabled.toInt(&okMusic, 10);
	return isMusicEnabled;
}

void ApplicationUI::setMusic(bool status) {
	isMusicEnabled = status;
	QString strMusicEnabled = QString::number(isMusicEnabled);
	settings->saveValueFor(MUSIC, strMusicEnabled);
	emit musicChanged();
}

bool ApplicationUI::getProfileBox() {
	bool okProfile;
	QString strProfileBoxEnabled = settings->getValueFor(PROFILEBOXUPDATES,"1");
	isProfileBoxEnabled = strProfileBoxEnabled.toInt(&okProfile, 10);
	return isProfileBoxEnabled;
}

void ApplicationUI::setProfileBox(bool status) {
	isProfileBoxEnabled = status;
	QString strProfileBoxEnabled = QString::number(isProfileBoxEnabled);
	settings->saveValueFor(PROFILEBOXUPDATES, strProfileBoxEnabled);
	emit profileBoxChanged();
}

QString ApplicationUI::getPuzzleCompletedTime() {

	bool okTime;
	QString strSavedTime = settings->getValueFor(PUZZLECOMPLETEDTIME, "0");
	int savedTime = strSavedTime.toInt(&okTime, 10);
	//LOG("get savedTime: %i",savedTime );
	return (QDateTime::fromTime_t(savedTime)).toString("mm':'ss");

}

QString ApplicationUI::getLastPuzzleTime() {

	//no setter used. Emit signal whenever puzzle is completed. Sheet picks up value
	return (QDateTime::fromTime_t(timeSec)).toString("mm':'ss");
}

void ApplicationUI::SaveBestPuzzleTime(int puzzleTime) {

	bool okTime;
	QString strSavedTime = settings->getValueFor(PUZZLECOMPLETEDTIME, "0");
	int savedTime = strSavedTime.toInt(&okTime, 10);

	//LOG("puzzleTime: %i savedTime: %i",puzzleTime,savedTime );
	if (savedTime == 0)
		savedTime = puzzleTime;
	if (puzzleTime <= savedTime) {
		settings->saveValueFor(PUZZLECOMPLETEDTIME,
				QString::number(puzzleTime));
		emit puzzleCompletedTimeChanged();
	}

}

int ApplicationUI::getScore() {

	bool okScore;
	QString strScore = settings->getValueFor(SCORE, "0");
	int score = strScore.toInt(&okScore, 10);

	return score;

}

void ApplicationUI::setScore(int puzzleTime) {

	int score = getScore();
	score = score + (50000 / puzzleTime) * (getDifficulty() / 2); //minimize ridiculously large scores divide difficulty by 2

	settings->saveValueFor(SCORE, QString::number(score));
	submitScore(score);

	emit scoreChanged();

}

int ApplicationUI::getGamesPlayed() {

	bool okGames;
	QString strPlayed = settings->getValueFor(GAMESPLAYED, "0");
	int numberOfGames = strPlayed.toInt(&okGames, 10);

	return numberOfGames;

}

void ApplicationUI::setGamesPlayed() {

	bool okGames;
	QString strPlayed = settings->getValueFor(GAMESPLAYED, "0");
	int numberOfGames = strPlayed.toInt(&okGames, 10);

	numberOfGames++; //increase by 1

	settings->saveValueFor(GAMESPLAYED, QString::number(numberOfGames));
	emit gamesPlayedChanged();

}

void ApplicationUI::setSelectedLetters(QString letter) {

	if (letter == "clear") {
		m_strSeletedLetters = "";
	} else if (letter == "removeLast") {
		m_strSeletedLetters.chop(1);
	} else {
		m_strSeletedLetters = m_strSeletedLetters.append(letter.toUpper());
	}
	emit selectedLettersChanged();
}

QString ApplicationUI::getSelectedLetters() {
	return m_strSeletedLetters;
}

int ApplicationUI::getDifficulty() {

	bool okDiff;
	QString strDiff = settings->getValueFor(DIFFICULTY, "8");
	puzzleDifficulty = strDiff.toInt(&okDiff, 10);

	//LOG("%i", puzzleDifficulty);
	return puzzleDifficulty;

}

void ApplicationUI::setDifficulty(int difficulty) {

	//LOG("Set Difficulty: %i", difficulty);
	settings->saveValueFor(DIFFICULTY, QString::number(difficulty));
	emit difficultyChanged();

}

bool ApplicationUI::getIsFirstTimeUser() {
	return (settings->getValueFor(FIRSTTIMEUSER, "1")).toInt();
}

void ApplicationUI::setIsFirstTimeUser(bool status) {
	settings->saveValueFor(FIRSTTIMEUSER, QString::number(status));
	emit isFirstTimeUserChanged();
}

bool ApplicationUI::getIsPaid() {
	return (settings->getValueFor(PAID, "0")).toInt();
}

void ApplicationUI::setIsPaid(bool status) {
	settings->saveValueFor(PAID, QString::number(status));
	emit isPaidChanged();
}


bool ApplicationUI::getIsReviewed() {
	return (settings->getValueFor(REVIEWED, "0")).toInt();
}

void ApplicationUI::setIsReviewed(bool status) {
	settings->saveValueFor(REVIEWED, QString::number(status));
	emit isReviewedChanged();
}


void ApplicationUI::invokeFacebook() {

	InvokeManager invokeManager;
	InvokeRequest request;
	request.setTarget("com.rim.bb.app.facebook");
	request.setAction("bb.action.OPEN");
	QVariantMap payload;

	payload["object_type"] = "page";
	payload["object_id"] = "481826101858895"; // facebook.com/wordsplusgame

	request.setMetadata(payload);
	invokeManager.invoke(request);

}


void ApplicationUI::cntlyCategory(const QString &name, const QString &level) {
	countly::CountlyEvent event(this, "category");
	event.set("item", name);
	event.set("difficulty", level);
	event.send();
}


void ApplicationUI::cntlyMenuOptions(const QString &name) {
	countly::CountlyEvent event(this, "menu");
	event.set("option", name);
	event.send();
}


void ApplicationUI::cntlySocial(const QString &name) {
	countly::CountlyEvent event(this, "social");
	event.set("type", name);
	event.send();
}


void ApplicationUI::cntlyScoreloop(const QString &name) {
	countly::CountlyEvent event(this, "scoreloop");
	event.set("type", name);
	event.send();
}


void ApplicationUI::cntlyThemes(const QString &name) {
	countly::CountlyEvent event(this, "theme");
	event.set("type", name);
	event.send();
}


void ApplicationUI::cntlyWordOfTheDay() {
	countly::CountlyEvent event(this, "wordOfTheDay");
	event.send();
}


void ApplicationUI::cntlyDictionaryPuzzle() {
	countly::CountlyEvent event(this, "dictionaryPuzzle");
	event.send();
}


void ApplicationUI::cntlyIAP(const QString &name, const QString &price) {
	countly::CountlyEvent event(this, "iap");
	event.set("type", name);
	event.setSum(price);
	event.send();
}


void ApplicationUI::onWordOfTheDay(QString response) {

	//LOG("%s", response.toStdString().c_str() );

	tmpWordOfTheDay.clear();
	tmpWordOfTheDay = response.split("|");

	emit wordnikWordChanged();
	emit wordnikPartOfSpeechChanged();
	emit wordnikDefinitionChanged();

}

void ApplicationUI::onWordList(QString response) {

	//LOG("%s", response.toStdString().c_str() );
	response.remove(QRegExp("[-' ]"));
	//LOG("After Clense: %s", response.toStdString().c_str() );

	QStringList wordList = response.split(",");
	wordList.removeLast(); //comma at end of string, causes issue

	QString tmp;
	for(int i = 0; i < wordList.count(); i++){
		tmp.append(wordList[i]).append("\n");
	}

	//LOG("WordList:\n%s", tmp.toStdString().c_str() );

	//call initialize play area or some variant of it with a new list of words
	QFile textfile("data/wordnik.txt");
	textfile.open(QIODevice::WriteOnly | QIODevice::Text);
	QTextStream out(&textfile);
	out <<  tmp; //"This is a text file\n";
	textfile.close();

	isRandomPuzzle = true;
	setCategory("wordnik");
	intializePlayArea();

//	if (textfile.open(QIODevice::ReadOnly | QIODevice::Text))
//	{
//		//LOG("onWordList:inside");
//	    QTextStream stream ( &textfile );
//	    QString line;
//	    do {
//	        line = stream.readLine();
//	        //qDebug() << line;
//	        LOG("%s", line.toStdString().c_str() );
//	    } while (!line.isNull());
//	}
//	else {
//		//LOG("onWordList:error");
//	}
//
//	textfile.close();

}

void ApplicationUI::InitializeWordnik(QString type){
	if (Global::instance()->getIsInternetAvailable()){
		wordnik->callWordnik(type);
	}
}

QString ApplicationUI::getWord(){
	if(!tmpWordOfTheDay.empty()){
		//LOG("%s", tmpWordOfTheDay[0].toStdString().c_str() );
		return tmpWordOfTheDay[0];
	}

	return "...";
}
QString ApplicationUI::getPartOfSpeech(){
	if(!tmpWordOfTheDay.empty()){
		return  tmpWordOfTheDay[2];
	}

	return "...";
}
QString ApplicationUI::getDefinition(){
	if(!tmpWordOfTheDay.empty()){
		return tmpWordOfTheDay[1];
	}

	return "Sorry. No word for today.";
}


void ApplicationUI::ControlsForBBM(int state) {

	//LOG("Inside ControlsForBBM");
	if(m_context->registrationState() == bb::platform::bbm::RegistrationState::Allowed) {
		// Create the user profile and profile box objects
		m_userProfile = new bb::platform::bbm::UserProfile(m_context, this);
		m_profileBox = new bb::platform::bbm::ProfileBox(m_context, this);

		//BBM Awards - if already awarded, nothing happens in AchieveAward();

		switch (state) {
			case PROFILEBOXPUZZLECOMPLETED: {
				//LOG("PROFILEBOXPUZZLECOMPLETED");
				if (getProfileBox()) {
					QString msg = QString(
							"Completed Another One! \nTime: %1  Score: %2").arg(
							(QDateTime::fromTime_t(timeSec)).toString("mm':'ss")).arg(
							getScore());

					//register icons
					profileBox = new ProfileBox(m_profileBox);

					//ApplicationUI.png iconId = 1
					//could use #define WORDSPLUSPROFILEBOX 1
					//use 0 if you have no image
					profileBox->addProfileBoxItem(msg, 3);
					//cntlySocial("bbm_profileBox"); automated may not want this on
				}
				break;
			}
			case PRESONALMESSAGE: {
				//LOG("PRESONALMESSAGE");
				ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_BBMPERSONALMSG);
				updateProfile = new UpdateProfile(m_userProfile);
				updateProfile->savePersonalMessage();
				cntlySocial("bbm_personalMsg");
				break;
			}
			case STATUSMESSAGE: {
				//LOG("STATUSMESSAGE");
				ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_BBMSTATUSMSG);
				updateProfile = new UpdateProfile(m_userProfile);
				updateProfile->saveStatus();
				cntlySocial("bbm_statusMsg");
				break;
			}
			case INVITETODOWNLOAD: {
				//LOG("INVITETODOWNLOAD");
				ScoreLoopThread::AchieveAward(mAppData, SCORELOOP_BBMINVITE);
				inviteToDownload = new InviteToDownload(m_context);
				inviteToDownload->sendInvite();
				cntlySocial("bbm_inviteToDownload");
				break;
			}
		}
	}
	else {
		SystemDialog *bbmDialog = new SystemDialog("OK");
		bbmDialog->setTitle("BBM Connection Error");
		bbmDialog->setBody("BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
		connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)), this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
		bbmDialog->show();
		return;
	}

}

