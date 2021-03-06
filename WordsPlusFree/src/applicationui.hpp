// Default empty project template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include "timer.hpp"
#include "GameSettings.hpp"
#include "soundmanager.h"
#include "ActiveFrame.h"
#include "ProfileBox.hpp"
#include "RegistrationHandler.hpp"
#include "Global.hpp"
#include "UpdateProfile.hpp"
#include "InviteToDownload.hpp"
#include "ScoreLoopThread.hpp"
#include "OrientationSensor.hpp"
#include "Wordnik.hpp"


#include <QObject>
#include <bb/cascades/Page>
#include <bb/cascades/Container>
#include <bb/cascades/Application>
#include <bb/cascades/ImageView>
#include <bb/cascades/Invocation>
#include <bb/platform/bbm/Context>
#include <bb/platform/bbm/UserProfile>


using namespace bb::cascades;
namespace bb { namespace cascades { class Application; class QmlDocument; class ImageView; class TouchEvent; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::platform::bbm::Context &context, bb::cascades::Application *app);
    //ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI();

    Q_INVOKABLE void intializePlayArea();
	Q_INVOKABLE void InitializeHomePage();
	Q_INVOKABLE void InitializePuzzlePage();
	Q_INVOKABLE void InitializeWordnik(QString type);

	Q_INVOKABLE void submitScore(int score);
	Q_INVOKABLE void loadLeaderboard(bool includeBuddyList);
	Q_INVOKABLE void loadLeaderboardAroundLastScore();
	Q_INVOKABLE void loadLeaderboardAroundUser();
	Q_INVOKABLE void LoadAchievementsAwards();
	Q_INVOKABLE ScoreLoopThread* scoreLoop();

	Q_INVOKABLE void startTimer();
	Q_INVOKABLE void stopTimer();
	Q_INVOKABLE void resetTimer();
	Q_INVOKABLE void ControlsForBBM(int state);
	Q_INVOKABLE void playSound(const QString msg);
	Q_INVOKABLE void invokeFacebook();

	//countly
	Q_INVOKABLE void cntlyCategory(const QString &name, const QString &level);
	Q_INVOKABLE void cntlyMenuOptions(const QString &name);
	Q_INVOKABLE void cntlySocial(const QString &name);
	Q_INVOKABLE void cntlyScoreloop(const QString &name);
	Q_INVOKABLE void cntlyThemes(const QString &name);
	Q_INVOKABLE void cntlyWordOfTheDay();
	Q_INVOKABLE void cntlyDictionaryPuzzle();
	Q_INVOKABLE void cntlyIAP(const QString &name, const QString &price);
	//countly

	Q_PROPERTY (const QString theme READ getTheme WRITE setTheme NOTIFY themeChanged);
	Q_PROPERTY (const QString category READ getCategory WRITE setCategory NOTIFY categoryChanged);
	Q_PROPERTY (const QString time READ getTime NOTIFY timeChanged);
	Q_PROPERTY (const QString totalWordsFound READ getTotalWordsFound NOTIFY totalWordsFoundChanged);
	Q_PROPERTY (bool soundOn READ getSound WRITE setSound NOTIFY soundChanged);
	Q_PROPERTY (bool musicOn READ getMusic WRITE setMusic NOTIFY musicChanged);
	Q_PROPERTY (bool profileBoxOn READ getProfileBox WRITE setProfileBox NOTIFY profileBoxChanged);
	Q_PROPERTY (const QString puzzleCompletedTime READ getPuzzleCompletedTime NOTIFY puzzleCompletedTimeChanged);
	Q_PROPERTY (const QString lastPuzzleTime READ getLastPuzzleTime NOTIFY lastPuzzleTimeChanged);
	Q_PROPERTY (int score READ getScore WRITE setScore NOTIFY scoreChanged);
	Q_PROPERTY (int gamesPlayed READ getGamesPlayed NOTIFY gamesPlayedChanged);
	Q_PROPERTY (const QString selectedLetters READ getSelectedLetters WRITE setSelectedLetters NOTIFY selectedLettersChanged);
	Q_PROPERTY (int difficulty READ getDifficulty WRITE setDifficulty NOTIFY difficultyChanged);
	Q_PROPERTY (int achievedAward READ getAchievedAward NOTIFY achievedAwardChanged);
	Q_PROPERTY (bool isFirstTimeUser READ getIsFirstTimeUser WRITE setIsFirstTimeUser NOTIFY isFirstTimeUserChanged);
	Q_PROPERTY (bool isPaid READ getIsPaid WRITE setIsPaid NOTIFY isPaidChanged);
	Q_PROPERTY (bool isReviewed READ getIsReviewed WRITE setIsReviewed NOTIFY isReviewedChanged);

	//wordnik
	Q_PROPERTY (const QString wordnikWord READ getWord NOTIFY wordnikWordChanged);
	Q_PROPERTY (const QString wordnikPartOfSpeech READ getPartOfSpeech NOTIFY wordnikPartOfSpeechChanged);
	Q_PROPERTY (const QString wordnikDefinition READ getDefinition NOTIFY wordnikDefinitionChanged);
	//wordnik



	QString getCategory();
	void setCategory(const QString cat);

	QString getTheme();
	void setTheme(const QString themeName);

	QString getTime();
	QString getTotalWordsFound();

	bool getSound();
	void setSound(bool status);

	bool getMusic();
	void setMusic(bool status);

	bool getProfileBox();
	void setProfileBox(bool status);

	bool getIsFirstTimeUser();
	void setIsFirstTimeUser(bool status);

	bool getIsPaid();
	void setIsPaid(bool status);

	bool getIsReviewed();
	void setIsReviewed(bool status);

	int getGamesPlayed();
	void setGamesPlayed();

	QString getPuzzleCompletedTime();
	QString getLastPuzzleTime();

	int getScore();
	void setScore(int puzzleTime);

	QString getSelectedLetters();
	void setSelectedLetters(QString letter);

	int getDifficulty();
	void setDifficulty(int difficulty);

	int getAchievedAward();

	QString getWord();
	QString getPartOfSpeech();
	QString getDefinition();

public Q_SLOTS:
	void show();
	void scoreLoopLoaded(AppData_t *data);
	void onSubmitScoreCompleted(ScoreData_t *scoreData);
	void onOrientationChanged();

Q_SIGNALS:
	void submitScoreCompleted();
	void mainSysToastSignal(QString toastMessage);
	void puzzleCompleted();

private Q_SLOTS:
	void onTileTouch(bb::cascades::TouchEvent *event);
	void onTick();
	void onThumbnail();
	void onFullscreen();
	void onLoadLeaderboardCompleted(QVariantList data);
	void onAchievedAward();
	void onWordOfTheDay(QString response);
	void onWordList(QString response);

Q_SIGNALS:
	void themeChanged();
	void categoryChanged(const QString);
	void puzzleWordsChanged(const QString);
	void timeChanged();
	void totalWordsFoundChanged();
	void soundChanged();
	void musicChanged();
	void profileBoxChanged();
	void puzzleCompletedTimeChanged();
	void lastPuzzleTimeChanged();
	void scoreChanged();
	void gamesPlayedChanged();
	void selectedLettersChanged();
	void difficultyChanged();
	void achievedAwardChanged();
	void isFirstTimeUserChanged();
	void isPaidChanged();
	void isReviewedChanged();
	void wordnikWordChanged();
	void wordnikPartOfSpeechChanged();
	void wordnikDefinitionChanged();

private:
	void initTimer();
	void HighlightSelectedTile(int pos, int stateOfLetter);
	bool isHighlighted(int pos);
	void WordCompleted(QList<int> listOfLetters);
	void CrossOutPuzzleWord(QString wordFound);
	void showToast(QString msg);
	void SaveBestPuzzleTime(int puzzleTime);
	void ProcessAwards();

	Page *appPage;
	Control *homePageControl;
	Control *puzzlePageControl;

	// Some Controls that we need to remember
	Container *mPlayAreaContainer;
	Container *mWordsToFindContainer;
	ImageView* mPlayField[12][12];

	// Internal game state variables
	float mWantedSize;
	float mNumTiles;
	float deltaX;
	float deltaY;
	float initX;
	float initY;
	int multiple;
	int length;
	int directionalBoundPos;
	int directionalBoundNeg;
	int upperbound;
	int lowerbound;
	int position;
	int tileSize;
	int timeSec;
	int numberOfWords;
	int numberOfWordsFound;
	int puzzleDifficulty;
	int wordDataValue;
	int continuousGameAward;
	int achievedAward;
	bool hintUsedAward;
	bool bbmLoveAward;
	bool bbmBusyAward;
	bool bbmInviteAward;
	bool isSoundEnabled;
	bool isMusicEnabled;
	bool isProfileBoxEnabled;
	bool isPuzzleDisplayed;
	bool isHomePageDisplayed;
	bool isRandomPuzzle;

	QString m_strCategory;
	QString m_strTime;
	QString m_strSeletedLetters;
	QList<int> tileNumbers;
	QDateTime timeKeeper;
	Timer *stopWatch;
	GameSettings *settings;
	SoundManager *mSoundManager;
	QMap<QString, int> wordDataIndex;
	QStringList listOfWords;
	QStringList tmpWordOfTheDay;

	RegistrationHandler *regHandler;
	ProfileBox *profileBox;
	UpdateProfile *updateProfile;
	InviteToDownload *inviteToDownload;
	bb::platform::bbm::ProfileBox* m_profileBox;
	bb::platform::bbm::UserProfile* m_userProfile;
	bb::platform::bbm::Context* m_context;

	Invocation* m_pInvocation;

	Wordnik* wordnik;

	AppData_t *mAppData;
	ScoreLoopThread *mScoreLoop;
	ScoreData_t *mLastScoreData;

	OrientationSensor *mOrientationSensor;

};


#endif /* ApplicationUI_HPP_ */
