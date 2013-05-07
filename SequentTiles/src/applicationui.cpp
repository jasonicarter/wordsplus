// Default empty project template
#include "applicationui.hpp"

#include <QLocale>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>

#include "Countly.hpp"


using namespace bb::cascades;

#define LOG(fmt, args...)   do { fprintf(stdout, "[Sequent ] " fmt "\n", ##args); fflush(stdout); } while (0);

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

	// Initialize for local storage settings
	settings = new GameSettings();

	// Initialize hint class
	hints = new LevelHints();

    // Initialize other stuff
	isGuest = false;
    showNext = false;
    showRetry = false;
    hintShown = false;
    tilesAvailable = 4;
    currentLevel = getCurrentLevel();
    currentPackage = 1;
    currentGuestLevel = getCurrentGuestLevel();


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

	QDir packagesDir("app/native/assets/packages/pkg_1");
	levelCount = packagesDir.count(); //returns extra stuff in directory needs to be filtered
	QStringList filters;
	filters << "level_*";
	QStringList levelNames = packagesDir.entryList(filters);
	levelCount = levelNames.count();

}

//needs to have a property to emit value
void ApplicationUI::Submit() {

	bool answer = true;

	if (selectTiles.count() != 0) {

		if (selectTiles.count() < tilesAvailable) {
			answer = false;
		} else {
			for (int i = 0; i < tilesAvailable; i++) {
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
bool ApplicationUI::getIsGuest(){
	return isGuest;
}
void ApplicationUI::setIsGuest(bool status){
	isGuest = status;
}
int ApplicationUI::getCurrentLevel(){
	return (settings->getValueFor("CurrentLevel", "1")).toInt();
}
void ApplicationUI::setCurrentLevel(int level){
	currentLevel = level;
	settings->saveValueFor("CurrentLevel", QString::number(level));
}
int ApplicationUI::getCurrentGuestLevel(){
	return (settings->getValueFor("CurrentGuestLevel", "1")).toInt();
}
void ApplicationUI::setCurrentGuestLevel(int level){
	currentGuestLevel = level;
	settings->saveValueFor("CurrentGuestLevel", QString::number(level));
}
void ApplicationUI::ResetAll(){
	if(isGuest){setCurrentGuestLevel(1);}else{setCurrentLevel(1);}
}
void ApplicationUI::SkipToEnd(){
	setCurrentLevel(levelCount);
}
int ApplicationUI::getCoinCount(){
	return (settings->getValueFor("Coins", "600")).toInt();
}
void ApplicationUI::setCoinCount(int coins){
	settings->saveValueFor("Coins", QString::number(coins));
	emit coinCountChanged();
}
bool ApplicationUI::getHintShown(){
	return hintShown;
}
void ApplicationUI::setHintShown(bool status){
	hintShown = status;
}
QString ApplicationUI::getLevelHint(){
	int level;
	if(isGuest){level = getCurrentGuestLevel();}else{level = getCurrentLevel();}
	return 	hints->getHint(level);
}
int ApplicationUI::getUserLevel(){
	int level;
	if(isGuest){level = getCurrentGuestLevel();}else{level = getCurrentLevel();}
	return level;
}



void ApplicationUI::NextGame(){

	int level;
	//LOG("isGuest: %i, GuestLevel: %i, OwnerLevel: %i", isGuest, currentGuestLevel, getCurrentLevel());
	if(isGuest){
		level = getCurrentGuestLevel() + 1;
		setCurrentGuestLevel(level);
		//LOG("variable_level: %i", level);
	}else{
		level = getCurrentLevel() + 1;
		setCurrentLevel(level);
	}

	if(level <= levelCount){
		setHintShown(false);
		emit levelHintChanged();
		emit userLevelChanged();
		NewGame(currentPackage,level);
	}else {
		emit gameCompletedSignal();
	}

}
void ApplicationUI::RedoGame(){
	int level;
	if(isGuest){level = getCurrentGuestLevel();}else{level = getCurrentLevel();}
	NewGame(currentPackage,level);
}

void ApplicationUI::StartGame(){
	int level;
	if(isGuest){level = getCurrentGuestLevel();}else{level = getCurrentLevel();}
	NewGame(currentPackage,level);
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
	tilesAvailable = 4;
	QList<int> tileNumber;
	tileNumber << 0 << 1 << 2 << 3;
	selectTiles.clear(); //reset selection tracker

	for (int i = 0; i < 4; i++) {

		ImageView *imageView = ImageView::create().bottomMargin(0).topMargin(0).leftMargin(0).rightMargin(0);
		imageView->setPreferredSize(wantedSize, wantedSize);


		int r = rand() % tileNumber.count();

		//"app//native//assets//wordLists//"
		QString imageSource = QString("asset:///packages/pkg_%1/level_%2/%3.png").arg(pkg).arg(level).arg(tileNumber[r]);

		//LOG("r.png Value: %i, File Exist? %i File Path: %s",tileNumber[r], QFile::exists(imageSource),imageSource.toStdString().c_str());
		if(tileNumber[r] == 3){
			if(!QFile::exists(QString("app/native/assets/packages/pkg_%1/level_%2/%3.png").arg(pkg).arg(level).arg(tileNumber[r]))){
				//LOG("Doesn't Exist: %s",imageSource.toStdString().c_str())
				tilesAvailable = 3;
				imageSource = QString("asset:///packages/selected.png");
			}
		}

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
			}

		} // if statement
	}

	if (event->isCancel()) {
	}

}


void ApplicationUI::cntlyBtnClick(const QString &key, const QString &segment) { //test with item,name
	// LOCALE
	QLocale locale;

	countly::CountlyEvent event(this,"IAP");
	event.setSum("0.99");
	event.set(key, segment);
	event.set("country", locale.countryToString(locale.country()));
	event.send();
}

void ApplicationUI::cntlyBtnClick2(const QString &key, const QString &segment) { //test with item,name
	// LOCALE
	QLocale locale;

	countly::CountlyEvent event(this,"IAP2");
	event.setSum("0.99");
	event.set(key, segment);
	event.set("country", locale.countryToString(locale.country()));
	event.send();
}


