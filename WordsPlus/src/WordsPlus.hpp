// Default empty project template
#ifndef WordsPlus_HPP_
#define WordsPlus_HPP_

#include "timer.hpp"
#include "GameSettings.hpp"

#include <QObject>
#include <bb/cascades/Page>
#include <bb/cascades/TabbedPane>
#include <bb/cascades/Container>
#include <bb/cascades/Application>
#include <bb/cascades/ImageView>


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
    virtual ~WordsPlus() {}

    Q_INVOKABLE void intializePlayArea();
    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void stopTimer();
    Q_INVOKABLE void resetTimer();

    Q_PROPERTY (const QString category READ getCategory WRITE setCategory NOTIFY categoryChanged);
    Q_PROPERTY (const QString puzzleWords READ getPuzzleWords WRITE setPuzzleWords NOTIFY puzzleWordsChanged);
    Q_PROPERTY (const QString time READ getTime NOTIFY timeChanged);
    Q_PROPERTY (const QString totalWordsFound READ getTotalWordsFound NOTIFY totalWordsFoundChanged);

    QString getCategory();
    QString getPuzzleWords();
    QString getTime();
    QString getTotalWordsFound();
    void setCategory(const QString cat);
    void setPuzzleWords(const QString words);


private slots:
	void onTileTouch(bb::cascades::TouchEvent *event);
	void onTick();

signals:
	void categoryChanged(const QString);
	void puzzleWordsChanged(const QString);
	void timeChanged();
	void totalWordsFoundChanged();

private:
	void initTimer();
	void HighlightSelectedTile(int pos, int stateOfLetter);
	void WordCompleted(QList<int> listOfLetters);
	void CrossOutPuzzleWord(QString wordFound);
	void showToast(QString msg);

    Page *appPage;
    TabbedPane *tabs;
    QmlDocument *mQmlDocument;

    // Some Controls that we need to remember
    Container *mPlayAreaContainer;
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

    QString m_strCategory;
    QString m_strPuzzleWords;
    QString m_strTime;
    QList<int> tileNumbers;
    QDateTime timeKeeper;
    Timer *stopWatch;
    GameSettings *settings;
};


#endif /* WordsPlus_HPP_ */
