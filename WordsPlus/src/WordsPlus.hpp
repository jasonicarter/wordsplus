// Default empty project template
#ifndef WordsPlus_HPP_
#define WordsPlus_HPP_

#include "timer.hpp"
#include "GameSettings.hpp"
#include "soundmanager.h"
#include "ActiveFrame.h"
#include "ProfileBox.hpp"
#include "RegistrationHandler.hpp"
#include "Global.hpp"
#include "UpdateProfilePage.hpp"

#include <QObject>
#include <bb/cascades/Page>
#include <bb/cascades/TabbedPane>
#include <bb/cascades/Container>
#include <bb/cascades/Application>
#include <bb/cascades/ImageView>

#include <bb/platform/bbm/Context>
#include <bb/platform/bbm/UserProfile>

using namespace bb::cascades;
namespace bb { namespace cascades { class Application; class QmlDocument; class ImageView; class TouchEvent; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class WordsPlus : public QObject
{
    Q_OBJECT
public:
    WordsPlus(bb::cascades::Application *app);
    virtual ~WordsPlus();

    Q_INVOKABLE void intializePlayArea();
    Q_INVOKABLE void InitializeHomePage();
    Q_INVOKABLE void InitializePuzzlePage();

    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void stopTimer();
    Q_INVOKABLE void resetTimer();
    Q_INVOKABLE void ControlsForBBM(int state);

    Q_PROPERTY (const QString category READ getCategory WRITE setCategory NOTIFY categoryChanged);
    Q_PROPERTY (const QString puzzleWords READ getPuzzleWords WRITE setPuzzleWords NOTIFY puzzleWordsChanged);
    Q_PROPERTY (const QString time READ getTime NOTIFY timeChanged);
    Q_PROPERTY (const QString totalWordsFound READ getTotalWordsFound NOTIFY totalWordsFoundChanged);
    Q_PROPERTY (bool sound READ getSound WRITE setSound NOTIFY soundChanged);
    Q_PROPERTY (const QString puzzleCompletedTime READ getPuzzleCompletedTime NOTIFY puzzleCompletedTimeChanged);
    Q_PROPERTY (int score READ getScore WRITE setScore NOTIFY scoreChanged);

    QString getCategory();
    void setCategory(const QString cat);

    QString getPuzzleWords();
    void setPuzzleWords(const QString words);

    QString getTime();
    QString getTotalWordsFound();
    void playSound(const QString &msg);

    bool getSound();
    void setSound(bool status);

    QString getPuzzleCompletedTime();

    int getScore();
    void setScore(int puzzleTime);

private slots:
	void onTileTouch(bb::cascades::TouchEvent *event);
	void onTick();

signals:
	void categoryChanged(const QString);
	void puzzleWordsChanged(const QString);
	void timeChanged();
	void totalWordsFoundChanged();
	void soundChanged();
	void puzzleCompletedTimeChanged();
	void scoreChanged();

private:
	void initTimer();
	void HighlightSelectedTile(int pos, int stateOfLetter);
	void WordCompleted(QList<int> listOfLetters);
	void CrossOutPuzzleWord(QString wordFound);
	void showToast(QString msg);
	void SaveBestPuzzleTime(int puzzleTime);

    Page *appPage;
    TabbedPane *tabs;
    QmlDocument *mQmlDocument;
    Control *homePageControl;
    Control *puzzlePageControl;

    // Some Controls that we need to remember
    Container *mPlayAreaContainer;
    Container *mWordsToFindContainer;
    ImageView* mPlayField[32][32]; //change this or set to 10

    // Internal game state variables
    float mWantedSize;
    float mNumTiles;
	float deltaX;
	float deltaY;
	float initX;
	float initY;
	int multiple;
	int length;
	int upperbound;
	int lowerbound;
	int position;
	int tileSize;
	int timeSec;
	int numberOfWords;
	int numberOfWordsFound;
	bool isSoundEnabled;

    QString m_strCategory;
    QString m_strPuzzleWords;
    QString m_strTime;
    QList<int> tileNumbers;
    QDateTime timeKeeper;
    Timer *stopWatch;
    GameSettings *settings;
    SoundManager *mSoundManager;
    ProfileBox *profileBox;
    RegistrationHandler* regBBM;

    bb::platform::bbm::UserProfile * m_userProfile;
};


#endif /* WordsPlus_HPP_ */
