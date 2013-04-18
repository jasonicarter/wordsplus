// Default empty project template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

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

    Q_INVOKABLE void NewGame(int pkg=1, int level=1);
    Q_INVOKABLE void Home();
    Q_INVOKABLE bool Submit();

private Q_SLOTS:
	void onTileTouch(bb::cascades::TouchEvent *event);

private:
    void InitializeHomeContainer();
    void InitializePuzzleContainer();

    float wantedSize;
    float numTiles;
    QList<int> selectTiles;

	Page *appPage;
    Control *puzzleControl;
    Control *homeControl;
    Container *playContainer;
    ImageView* playField[4][4];

};

#endif /* ApplicationUI_HPP_ */
