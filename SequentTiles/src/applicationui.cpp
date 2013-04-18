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
    InitializePuzzleContainer();
    app->setScene(appPage);
}

void ApplicationUI::Home()
{
	InitializeHomeContainer();
}

void ApplicationUI::InitializeHomeContainer() {

	QmlDocument* qmlContent = QmlDocument::create("asset:///HomeContainer.qml");
	qmlContent->setContextProperty("sequentTiles", this);
	homeControl = qmlContent->createRootObject<Control>();
	appPage->setContent(homeControl);
}

void ApplicationUI::InitializePuzzleContainer() {

	QmlDocument* qmlContent = QmlDocument::create("asset:///PuzzleContainer.qml");
	qmlContent->setContextProperty("sequentTiles", this);
	puzzleControl = qmlContent->createRootObject<Control>();
	//appPage->setContent(puzzleControl);
}

//needs to have a property to emit value
bool ApplicationUI::Submit() {

	bool answer = true;

	if( (selectTiles.count() == 0) or (selectTiles.count() < 4)){
		//no nothing
	}
	else {
		for(int i = 0; i < 4; i++){
			if(selectTiles[i] != i){
				 answer = false;
			}
		}
	}

	return answer;
}


void ApplicationUI::NewGame(int pkg, int level) {

	playContainer = puzzleControl->findChild<Container*>("puzzlePlayContainer");
	playContainer->removeAll();

	Container* pContainer = new Container();
	AbsoluteLayout *pAbsoluteLayout = new AbsoluteLayout();
	pContainer->setLayout(pAbsoluteLayout);

	numTiles = 2; // Calculate the size of the tiles
	wantedSize = 300; //playContainer->preferredWidth() / numTiles;
	QList<int> tileNumber;
	tileNumber << 0 << 1 << 2 << 3;
	selectTiles.clear(); //reset selection tracker

	for (int i = 0; i < 4; i++) {
		//listOfWords.append(puzzleWords[i]);

		//LOG("word index: %i", wordDataList[listOfWords]);

		ImageView *imageView = ImageView::create().bottomMargin(0).topMargin(0).leftMargin(0).rightMargin(0);
		imageView->setPreferredSize(wantedSize, wantedSize);


		int r = rand() % tileNumber.count(); //list of words reduced once word is found
		//LOG("list count: %i", listOfWords.count());
		//LOG("hint word: %s",listOfWords[r].toStdString().c_str());

		QString imageSource = QString("asset:///packages/pkg_%1/level_%2/%3.png").arg(pkg).arg(level).arg(tileNumber[r]);
		imageView->setImage(Image(imageSource));
		tileNumber.removeAt(r);

		if (i < 2) {
			AbsoluteLayoutProperties* pProperties = AbsoluteLayoutProperties::create();
			pProperties->setPositionX(337.0 * i);
			pProperties->setPositionY(0.0);
			imageView->setLayoutProperties(pProperties);
			pContainer->add(imageView);
		}
		if (i >= 2) {
			AbsoluteLayoutProperties* pProperties = AbsoluteLayoutProperties::create();
			pProperties->setPositionX(337.0 * (i - 2));
			pProperties->setPositionY(337.0);
			imageView->setLayoutProperties(pProperties);
			pContainer->add(imageView);
		}

		// We are connecting all our tiles to the same slot, we can later identify them by sender().
		connect(imageView, SIGNAL(touch(bb::cascades::TouchEvent *)),this, SLOT(onTileTouch(bb::cascades::TouchEvent *)));

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
				QStringList numberSrc = (imageSrc[index]).split(".");
				QString numberSelected = numberSrc[0]; //a.png

				if(selectTiles.indexOf(numberSelected.toInt()) <= 0) {
					//-1 is not found
					selectTiles.append(numberSelected.toInt());
					QString imageSource = QString("asset:///packages/selected.png");
					senderImage->setImage(Image(imageSource));
				}

//				QString imageSource = QString("asset:///packages/selected.png");
//				senderImage->setImage(Image(imageSource));
			}

		} // if statement
	}

	if (event->isCancel()) {
	}

}




