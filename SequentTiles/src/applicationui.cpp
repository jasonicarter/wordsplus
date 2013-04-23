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

    //initialize stuff
    showNext = false;
    showRetry = false;
    currentLevel = 1;
    currentPackage = 1;

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
void ApplicationUI::Submit() {

	bool answer = true;

	if (selectTiles.count() != 0) {

		if (selectTiles.count() < 4) {
			answer = false;
		} else {
			for (int i = 0; i < 4; i++) {
				if (selectTiles[i] != i) {
					answer = false;
				}
			}
		}
		if (answer) {
			//emit signal correctSignal
			setShowNext(true);
			emit showNextChanged();
		} else {
			//emit signal incorrectSignal
			setShowRetry(true);
			//NewGame();
			emit ShowRetryChanged();
		}

	}
}


bool ApplicationUI::getShowNext(){
	return showNext;
}
void ApplicationUI::setShowNext(bool status){
	showNext = status;
}
bool ApplicationUI::getShowRetry(){
	return showRetry;
}
void ApplicationUI::setShowRetry(bool status){
	showRetry = status;
}


void ApplicationUI::NextGame(){
	//should actually increase level up to x and then increase package
	//TODO
	if(currentLevel != 19){currentLevel++;} //just so it wont crash during testing
	NewGame(currentPackage,currentLevel);
}
void ApplicationUI::RedoGame(){
	NewGame(currentPackage,currentLevel);
}


void ApplicationUI::NewGame(int pkg, int level) {

	//rest puzzleCenterContainer.qml
	setShowRetry(false);
	setShowNext(false);
	emit ShowRetryChanged();
	emit showNextChanged();

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

//			AbsoluteLayoutProperties* pProperties = AbsoluteLayoutProperties::create();
//			pProperties->setPositionX(337.0 * 1);
//			pProperties->setPositionY(0.0);
//			senderImage->setLayoutProperties(pProperties);
//			playContainer->add(senderImage);

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
			}

		} // if statement
	}

	if (event->isCancel()) {
	}

}




