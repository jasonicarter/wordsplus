// Default empty project template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include "GameSettings.hpp"
#include "LevelHints.hpp"

#include <QObject>
#include <bb/cascades/Page>
#include <bb/cascades/ImageView>
#include <bb/cascades/Container>

using namespace bb::cascades;
namespace bb { namespace cascades { class Application;  class ImageView; class TouchEvent;}}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI() {}


    Q_INVOKABLE void StartGame();
    Q_INVOKABLE void NextGame();
    Q_INVOKABLE void RedoGame();
    Q_INVOKABLE void ResetAll();
    Q_INVOKABLE void SkipToEnd();
    Q_INVOKABLE void Home();
    Q_INVOKABLE void Submit();

    Q_PROPERTY (bool showNext READ getShowNext WRITE setShowNext NOTIFY showNextChanged);
    Q_PROPERTY (bool showRetry READ getShowRetry WRITE setShowRetry NOTIFY ShowRetryChanged);
    Q_PROPERTY (int coinCount READ getCoinCount WRITE setCoinCount NOTIFY coinCountChanged);
    Q_PROPERTY (bool hintShown READ getHintShown WRITE setHintShown NOTIFY hintShownChanged);
    Q_PROPERTY (bool isGuest READ getIsGuest WRITE setIsGuest NOTIFY isGuestChanged);
    Q_PROPERTY (const QString levelHint READ getLevelHint NOTIFY levelHintChanged);
    Q_PROPERTY (int userLevel READ getUserLevel NOTIFY userLevelChanged);

    Q_SIGNALS:
    	void showNextChanged();
    	void ShowRetryChanged();
    	void coinCountChanged();
    	void hintShownChanged();
    	void levelHintChanged();
    	void userLevelChanged();
    	void gameCompletedSignal();
    	void isGuestChanged();

private Q_SLOTS:
	void onTileTouch(bb::cascades::TouchEvent *event);

private:
    void InitializeHomeContainer();
    void InitializePuzzleContainer();
    void NewGame(int pkg=1, int level=1);

    bool showNext;
	bool getShowNext();
	void setShowNext(bool status);

	int getCurrentLevel();
	void setCurrentLevel(int level);

	int getCurrentGuestLevel();
	void setCurrentGuestLevel(int level);

	int getCoinCount();
	void setCoinCount(int coins);

	bool hintShown;
	bool getHintShown();
	void setHintShown(bool status);

    bool showRetry;
	bool getShowRetry();
	void setShowRetry(bool status);

	bool isGuest;
	bool getIsGuest();
	void setIsGuest(bool status);

	QString getLevelHint();
	int getUserLevel();

    float wantedSize;
    float numTiles;
    int currentLevel;
    int currentPackage;
    int currentGuestLevel;
    int tilesAvailable;
    int levelCount;
    QList<int> selectTiles;

    LevelHints *hints;
    GameSettings *settings;
	Page *appPage;
    Control *puzzleControl;
    Control *homeControl;
    Container *playContainer;
    ImageView* playField[4][4];

};

#endif /* ApplicationUI_HPP_ */
