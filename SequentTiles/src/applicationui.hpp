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

private Q_SLOTS:
	void onTileTouch(bb::cascades::TouchEvent *event);

private:
    void InitializePlayArea();
    void InitializeHomeContainer();

    float wantedSize;
    float numTiles;

	Page *appPage;
    Control *puzzleControl;
    Container *playContainer;
    ImageView* playField[4][4];
};

#endif /* ApplicationUI_HPP_ */
