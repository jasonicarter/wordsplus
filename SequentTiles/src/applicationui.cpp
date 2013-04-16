// Default empty project template
#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>

using namespace bb::cascades;

ApplicationUI::ApplicationUI(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // create root object for the UI
    //AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    //app->setScene(root);


    appPage = qml->createRootObject<Page>();
    InitializeHomeContainer();
    app->setScene(appPage);
}


void ApplicationUI::InitializeHomeContainer() {

	QmlDocument* qmlContent = QmlDocument::create("asset:///HomeContainer.qml");
	qmlContent->setContextProperty("seqentTiles", this);
	puzzleControl = qmlContent->createRootObject<Control>();
	InitializePlayArea();

}


void ApplicationUI::InitializePlayArea() {

	playContainer = puzzleControl->findChild<Container*>("homePlayContainer");
	//playContainer->removeAll();

	Container* pContainer = new Container();
	AbsoluteLayout *pAbsoluteLayout = new AbsoluteLayout();
	pContainer->setLayout(pAbsoluteLayout);

	numTiles = 2; // Calculate the size of the tiles
	wantedSize = 300; //playContainer->preferredWidth() / numTiles;

	for (int i = 0; i < 4; i++) {
		//listOfWords.append(puzzleWords[i]);

		//LOG("word index: %i", wordDataList[listOfWords]);

		ImageView *imageView = ImageView::create(); //.bottomMargin(0).topMargin(0).leftMargin(0).rightMargin(0);
		imageView->setPreferredSize(wantedSize, wantedSize);

		QString imageSource = QString("asset:///images/%1.png").arg("0");
		imageView->setImage(Image(imageSource));

		if (i < 2) {
			AbsoluteLayoutProperties* pProperties = AbsoluteLayoutProperties::create();
			pProperties->setPositionX(350.0 * i);
			pProperties->setPositionY(0.0);
			imageView->setLayoutProperties(pProperties);
			pContainer->add(imageView);
		}
		if (i >= 2) {
			AbsoluteLayoutProperties* pProperties = AbsoluteLayoutProperties::create();
			pProperties->setPositionX(350.0 * (i - 2));
			pProperties->setPositionY(350.0);
			imageView->setLayoutProperties(pProperties);
			pContainer->add(imageView);
		}

		// We are connecting all our tiles to the same slot, we can later identify them by sender().
		connect(imageView, SIGNAL(touch(bb::cascades::TouchEvent *)),this, SLOT(onTileTouch(bb::cascades::TouchEvent *)));

		// Keep track of the ImageView.
		//playField[i][ii] = imageView;
		//playField[i][ii]->setObjectName("about");

		playContainer->add(pContainer);
	}

	appPage->setContent(puzzleControl);

}


void ApplicationUI::onTileTouch(bb::cascades::TouchEvent *event) {

	//get initial position of tile touched
	if (event->isDown()) {
	} // isDown

	if (event->isUp()) {
		// Find who sent it.
		ImageView* senderImage = dynamic_cast<ImageView*>(sender());
		if (senderImage != NULL) {

			// Get the object name (actually the image name which is easy to identify).
			QVariant v = senderImage->imageSource();

			if (v.canConvert<QString>()) {
				QStringList imageSrc = v.value<QString>().split("/");
				int index = imageSrc.size() - 1; // size gives count not last index
				QStringList letterSrc = (imageSrc[index]).split(".");
				QString letter = letterSrc[0]; //a.png

				QString imageSource = QString("asset:///images/%1.png").arg("selected");
				senderImage->setImage(Image(imageSource));
			}

		} // if statement
	}

	if (event->isCancel()) {
	}

}
