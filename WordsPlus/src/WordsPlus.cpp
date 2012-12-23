// Default empty project template
#include "WordsPlus.hpp"
#include "wordsearch.h"

#include <string>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/TabbedPane>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/Container>
#include <bb/cascades/Color>
#include <bb/cascades/Page>
#include <bb/cascades/Label>
#include <bb/cascades/SystemDefaults>
#include <bb/cascades/StackLayout>
#include <bb/cascades/StackLayoutProperties>
#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>
#include <bb/system/SystemUiButton>
#include <bb/system/SystemDialog>
#include <bb/system/SystemToast>
#include <bb/multimedia/SystemSound>
#include <bb/cascades/FadeTransition>

#define NORMAL		1
#define SELECTED	2
#define HIGHLIGHT	3
#define REGISTERBBM 4
#define PROFILEBOXPUZZLECOMPLETED 5
#define PRESONALMESSAGE 6
#define STATUSMESSAGE 7
#define INVITETODOWNLOAD 8
#define HINTREVEAL	9
#define HINTROTATEUP	10
#define WORDSFOUND "settingsWordsFound"
#define CATEGORY "settingsCategory"
#define SOUNDBACKGROUNDMUSIC "X.WAV"
#define SOUNDLEVELCOMPLETED "puzzleCompleted.wav"
#define SOUNDLETTERSELECTED "letterSelected"
#define SOUND "settingsSound"
#define MUSIC "settingsMusic"
#define PROFILEBOXUPDATES "settingsProfileBox"
#define PUZZLECOMPLETEDTIME "settingsPuzzleTime"
#define SCORE "settingsScore"
#define GAMESPLAYED "settingsGamesPlayed"
#define DIFFICULTY "settingsDifficulty"

#define LOG(fmt, args...)   do { fprintf(stdout, "[WorsPlus.cpp ] " fmt "\n", ##args); fflush(stdout); } while (0);

using namespace bb::cascades;
using namespace bb::system;
using namespace bb::multimedia;

WordsPlus::WordsPlus(bb::platform::bbm::Context &context, QObject *parent) :
		QObject(parent), m_context(&context) {

	//set default values
	deltaX = 0.0;
	deltaY = 0.0;
	multiple = 1;
	length = 0;
	directionalBoundPos = 35;
    directionalBoundNeg = -35;
	upperbound = 100;
	lowerbound = 0;
	position = 0;
	tileSize = 50;
	timeSec = 0;
	stopWatch = NULL;
	numberOfWordsFound = 0;
	m_strSeletedLetters = "";
	isPuzzleDisplayed = false;
	wordDataValue = -1;

	// Initialize for local storage settings
	settings = new GameSettings();
	Global::instance()->setIsInternetAvailable(true); //initialize setting - implement real check later

	// Initialize the sound manager with a directory that resides in the
	// assets directory which only contains playable files.
	mSoundManager = new SoundManager("sounds/");

	//score loop stuff - need to register to make it work - investigate
	qmlRegisterType<ScoreLoopThread>("wordsPlus", 1, 0, "ScoreLoop");

}

// Look into what else to destroy if nescessary
WordsPlus::~WordsPlus() {
	// Destroy the sound manager.
	delete mSoundManager;
}

void WordsPlus::show() {

	mQmlDocument = QmlDocument::create("asset:///main.qml");
	mQmlDocument->setParent(this);
	mQmlDocument->setContextProperty("wordsPlus", this);

	if (!mQmlDocument->hasErrors()) {

		// The application navigationPane is created from QML.
		appPage = mQmlDocument->createRootObject<Page>();

		if (appPage) {

			ControlsForBBM(REGISTERBBM);

			Application::instance()->setCover(new ActiveFrame());

			// scoreloop stuff
			mScoreLoop = ScoreLoopThread::instance();
			QObject::connect(mScoreLoop, SIGNAL(ScoreLoopUserReady(AppData_t*)),
					this, SLOT(scoreLoopLoaded(AppData_t*)));
			QObject::connect(mScoreLoop,
					SIGNAL(SubmitScoreCompleted(ScoreData_t*)), this,
					SLOT(onSubmitScoreCompleted(ScoreData_t*)));
			QObject::connect(mScoreLoop, SIGNAL(LoadLeaderboardCompleted(QVariantList)),
					this, SLOT(onLoadLeaderboardCompleted(QVariantList)));

			mOrientationSensor = new OrientationSensor(this);
			QObject::connect(mOrientationSensor, SIGNAL(orientationChanged()),
					this, SLOT(onOrientationChanged()));

			// deal with stuff when enter/exit thumbnail or fullscreen
			QObject::connect(Application::instance(), SIGNAL(thumbnail()), this,
					SLOT(onThumbnail()));
			QObject::connect(Application::instance(), SIGNAL(fullscreen()),
					this, SLOT(onFullscreen()));

			InitializeHomePage();
			InitializePuzzlePage();
			//playSound(SOUNDBACKGROUNDMUSIC);
			Application::instance()->setScene(appPage);

			mScoreLoop->start();
		}
	}

}

void WordsPlus::onThumbnail() {
	stopTimer();
}

void WordsPlus::onFullscreen() {
	startTimer();
}

void WordsPlus::onOrientationChanged() {
	if (mOrientationSensor->orientation() == mOrientationSensor->OrientationSensor::RightUp) {
		if (isPuzzleDisplayed) {
			ImageView *redHeart = puzzlePageControl->findChild<ImageView*>("puzzleHeart");
			redHeart->setRotationZ(90);

			int r = rand() % listOfWords.count(); //list of words reduced once word is found
			//LOG("list count: %i", listOfWords.count());
			//LOG("hint word: %s",listOfWords[r].toStdString().c_str());
			wordDataValue = wordDataIndex.value(listOfWords[r]);
			//LOG("wordDataValue: %i", wordDataValue);
			if(wordDataValue >= 0) HighlightSelectedTile(wordDataValue, HINTREVEAL);
		}
		else {
			ImageView *rotateReviewImage = homePageControl->findChild<ImageView*>("rotateReviewImage");
			ImageView *rotateHeartImage = homePageControl->findChild<ImageView*>("rotateHeartImage");
			ImageView *rotateRotateImage = homePageControl->findChild<ImageView*>("rotateRotateImage");
			ImageView *rotateGuideImage = homePageControl->findChild<ImageView*>("rotateGuideImage");
			ImageView *rotateProfileImage = homePageControl->findChild<ImageView*>("rotateProfileImage");
			ImageView *rotateHomeImage = homePageControl->findChild<ImageView*>("rotateHomeImage");
			ImageView *rotateImageMsg = homePageControl->findChild<ImageView*>("rotateImageMsg");
			rotateReviewImage->setRotationZ(90);
			rotateHeartImage->setRotationZ(90);
			rotateRotateImage->setRotationZ(90);
			rotateGuideImage->setRotationZ(90);
			rotateProfileImage->setRotationZ(90);
			rotateHomeImage->setRotationZ(90);
			rotateImageMsg->setOpacity(1);
		}
	} // end of rightup
	if (mOrientationSensor->orientation() == mOrientationSensor->OrientationSensor::TopUp) {
		if (isPuzzleDisplayed && wordDataValue >= 0) {
			ImageView *redHeart = puzzlePageControl->findChild<ImageView*>("puzzleHeart");
			redHeart->setRotationZ(0);

			HighlightSelectedTile(wordDataValue, HINTROTATEUP);
		}
		else {
			ImageView *rotateReviewImage = homePageControl->findChild<ImageView*>("rotateReviewImage");
			ImageView *rotateHeartImage = homePageControl->findChild<ImageView*>("rotateHeartImage");
			ImageView *rotateRotateImage = homePageControl->findChild<ImageView*>("rotateRotateImage");
			ImageView *rotateGuideImage = homePageControl->findChild<ImageView*>("rotateGuideImage");
			ImageView *rotateProfileImage = homePageControl->findChild<ImageView*>("rotateProfileImage");
			ImageView *rotateHomeImage = homePageControl->findChild<ImageView*>("rotateHomeImage");
			ImageView *rotateImageMsg = homePageControl->findChild<ImageView*>("rotateImageMsg");
			rotateReviewImage->setRotationZ(0);
			rotateHeartImage->setRotationZ(0);
			rotateRotateImage->setRotationZ(0);
			rotateGuideImage->setRotationZ(0);
			rotateProfileImage->setRotationZ(0);
			rotateHomeImage->setRotationZ(0);
			rotateImageMsg->setOpacity(0);
		}
	} //end of topup
}

/****SCORELOOP*****/
void WordsPlus::scoreLoopLoaded(AppData_t *data) {
	mAppData = data;
}

void WordsPlus::onSubmitScoreCompleted(ScoreData_t *scoreData) {
	mLastScoreData = scoreData;
	emit(submitScoreCompleted());
}

void WordsPlus::submitScore(int score) {
	if (Global::instance()->getIsInternetAvailable()) {
		ScoreLoopThread::SubmitScore(mAppData, score, 0);
	}
}

void WordsPlus::onLoadLeaderboardCompleted(QVariantList data) {
	if(data.count() == 1){
		QMap<QString, QVariant> mapScore = data[0].toMap();
		int score = mapScore.value("formattedScore").toInt();
		settings->saveValueFor(SCORE, QString::number(score));
		LOG("user score: %i", score);
	}
}

void WordsPlus::loadLeaderboard() {
	LOG("loadLeaderboard")
	if (Global::instance()->getIsInternetAvailable()) {
		ScoreLoopThread::LoadLeaderboard(mAppData, SC_SCORES_SEARCH_LIST_ALL, 20);
	}
}

void WordsPlus::loadLeaderboardAroundLastScore() {
	if (Global::instance()->getIsInternetAvailable()) {
		ScoreLoopThread::LoadLeaderboardAroundScore(mAppData,
				mLastScoreData->score, SC_SCORES_SEARCH_LIST_ALL, 5);
	}
}

void WordsPlus::loadLeaderboardAroundUser() {
	if (Global::instance()->getIsInternetAvailable()) {
		ScoreLoopThread::LoadLeaderboardAroundUser(mAppData,
				SC_SCORES_SEARCH_LIST_ALL, 5);
	}
}

void WordsPlus::LoadAchievementsAwards() {
	if (Global::instance()->getIsInternetAvailable()) {
		ScoreLoopThread::LoadAchievements(mAppData);
	}
}

ScoreLoopThread* WordsPlus::scoreLoop() {
	return ScoreLoopThread::instance();
}
/****SCORELOOP*****/

void WordsPlus::InitializeHomePage() {

	isPuzzleDisplayed = false;
	stopWatch = NULL;
	QmlDocument* qmlContent = QmlDocument::create("asset:///HomePage.qml");
	qmlContent->setContextProperty("wordsPlus", this);
	homePageControl = qmlContent->createRootObject<Control>();
	appPage->setContent(homePageControl);
}

void WordsPlus::InitializePuzzlePage() {

	QmlDocument* qmlContent = QmlDocument::create(
			"asset:///PlayPuzzlePage.qml");
	qmlContent->setContextProperty("wordsPlus", this);
	puzzlePageControl = qmlContent->createRootObject<Control>();
	//setContent performed in InitializePlayArea

}

void WordsPlus::intializePlayArea() {

	//need to do id for timer, then get container to setup timer
	//try to divide up below into smaller methods passing control for each one

	isPuzzleDisplayed = true;
	wordDataValue = -1;
	listOfWords.clear();
	mPlayAreaContainer = puzzlePageControl->findChild<Container*>("playAreaContainer");
	mPlayAreaContainer->removeAll();
	mWordsToFindContainer = puzzlePageControl->findChild<Container*>("wordsToFind");
	mWordsToFindContainer->removeAll();

	Container* pContainer = new Container();
	AbsoluteLayout *pAbsoluteLayout = new AbsoluteLayout();
	pContainer->setLayout(pAbsoluteLayout);

	TextStyle subTitleWhite = SystemDefaults::TextStyles::smallText();
	subTitleWhite.setColor(Color::fromARGB(0xfffafafa));

	// As long as nothing is broken, we continue.
	if (mPlayAreaContainer) {

		std::string cat = getCategory().toLower().toStdString();
		cat.append(".txt");

		char** letter = createNewPuzzle((char*) cat.c_str(), getDifficulty());
		QList<char*> puzzleWords = returnPuzzleWords();

		numberOfWords = returnNumberOfPuzzleWords();
		wordDataIndex = returnPuzzleIndex();

		for (int i = 0; i < numberOfWords; i++) {
			listOfWords.append(puzzleWords[i]);

			//LOG("word index: %i", wordDataList[listOfWords]);

			//get word, create label and add to wordsToFind container
			QString labelText = puzzleWords[i];
			Label *wordLabel = new Label();
			wordLabel->textStyle()->setBase(subTitleWhite);
			wordLabel->setObjectName(labelText);
			wordLabel->setText(labelText);

			//always give them x space and then if total is more than 720
			//update positionY (new line)

			if (i <= 3) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * i);
				pProperties->setPositionY(0.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}
			if (i >= 4 && i <= 7) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * (i - 4));
				pProperties->setPositionY(30.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}
			if (i >= 8) {
				AbsoluteLayoutProperties* pProperties =
						AbsoluteLayoutProperties::create();
				pProperties->setPositionX(180.0 * (i - 8));
				pProperties->setPositionY(60.0);
				wordLabel->setLayoutProperties(pProperties);
				pContainer->add(wordLabel);
			}

			mWordsToFindContainer->add(pContainer);
		}

		mNumTiles = 10; // Calculate the size of the tiles
		mWantedSize = mPlayAreaContainer->preferredWidth() / mNumTiles;

		// Iterate through all the tiles.
		for (int i = 0; i < mNumTiles; i++) {
			Container* columnContainer = new Container();

			for (int ii = 0; ii < mNumTiles; ii++) {
				ImageView *imageView =
						ImageView::create().bottomMargin(0).topMargin(0).leftMargin(
								0).rightMargin(0);
				imageView->setPreferredSize(mWantedSize, mWantedSize);

				QString imageSource =
						QString("asset:///images/letters/%1.png").arg(
								QString(letter[i][ii]).toLower());
				imageView->setImage(Image(imageSource));

				// We are connecting all our tiles to the same slot, we can later identify them by sender().
				connect(imageView, SIGNAL(touch(bb::cascades::TouchEvent *)),
						this, SLOT(onTileTouch(bb::cascades::TouchEvent *)));

				// Keep track of the ImageView.
				mPlayField[i][ii] = imageView;
				mPlayField[i][ii]->setObjectName(
						QString(letter[i][ii]).toLower());
				columnContainer->add(imageView);
			}

			mPlayAreaContainer->add(columnContainer);
		} // for loop

		//Call timer class - Depends on what challenge (regular or beat-the-clock type thing)
		initTimer();
		resetTimer();
		numberOfWordsFound = 0;

	} // set up mPlayAreaContainer

	appPage->setContent(puzzlePageControl);

}

void WordsPlus::onTileTouch(bb::cascades::TouchEvent *event) {

	if (event->isDown()) {
		// Find who sent it.
		ImageView* senderImage = dynamic_cast<ImageView*>(sender());
		if (senderImage != NULL) {

			multiple = 1;
			//get initial position of finger touch
			initX = event->windowX();
			initY = event->windowY();

			// If that container is real, we iterate through all the tiles.
			for (int i = 0; i < mNumTiles; i++) {
				for (int ii = 0; ii < mNumTiles; ii++) {

					if (mPlayField[i][ii] == senderImage) {

						// Get array position
						if (i == 0) {
							position = ii;
						}
						if (i > 0) {
							position = i * 10 + ii;
						}
						tileNumbers.append(position);
						HighlightSelectedTile(position, HIGHLIGHT);
					}
				} // Inner loop
			} // Outer loop
		} // if statement
	} // isDown

	if (event->isMove()) {

		deltaX = event->windowX() - initX;
		deltaY = event->windowY() - initY;

		//Y direction only
		if (deltaX >= directionalBoundNeg && deltaX <= directionalBoundPos) {
			length = (int) deltaY;
			//deltaY increases (+ve) when finger moves top to bottom
			if (length / 60 == multiple && length > 0) {
				position += 1;
				//LOG("%i", position);
				if (position < upperbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
			//deltaY decreases (-ve) when finger moves bottom to top
			if (length / 60 == -multiple && length < 0) {
				position -= 1;
				if (position > lowerbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
		} else if (deltaY >= directionalBoundNeg && deltaY <= directionalBoundPos) {
			length = (int) deltaX;
			//deltaX increases (+ve) when finger moves left to right
			if (length / 60 == multiple && length > 0) {
				position += 10;
				if (position < upperbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
			//deltaX decreases (-ve) when finger moves right to left
			if (length / 60 == -multiple && length < 0) {
				position -= 10;
				if (position > lowerbound) {
					HighlightSelectedTile(position, HIGHLIGHT);
					tileNumbers.append(position);
					multiple++;
				}
			}
		} else if (deltaX > directionalBoundPos) { //east
			if (deltaY > directionalBoundPos) { // diagonal South East
				length = (int) deltaY;
				if (length / 60 == multiple) {
					position += 10; //x
					position += 1; //y
					if (position < upperbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
			if (deltaY < directionalBoundNeg) { // diagonal North East
				length = (int) deltaY;
				if (length / 60 == -multiple) {
					position += 10; //x
					position -= 1; //y
					if (position < upperbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
		} else if (deltaX < directionalBoundNeg) { // west
			if (deltaY > directionalBoundPos) { // diagonal South West
				length = (int) deltaY;
				if (length / 60 == multiple) {
					position -= 10; //x
					position += 1; //y
					if (position > lowerbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
			if (deltaY < directionalBoundNeg) { // diagonal North West
				length = (int) deltaY;
				if (length / 60 == -multiple) {
					position -= 10; //x
					position -= 1; //y
					if (position > lowerbound) {
						HighlightSelectedTile(position, HIGHLIGHT);
						tileNumbers.append(position);
						multiple++;
					}
				}
			}
		}

	} // isMove

	if (event->isUp()) {
		position = 0;
		multiple = 1;
		WordCompleted(tileNumbers);
		tileNumbers.clear();
	} // isUp

	if (event->isCancel()) {
		//LOG("touch cancelled");
		position = 0;
		multiple = 1;
		WordCompleted(tileNumbers);
		tileNumbers.clear();
	}

}

void WordsPlus::HighlightSelectedTile(int pos, int stateOfLetter) {

	int i;
	int ii;
	QString imageSource;

	if (pos <= 9) {
		i = 0;
		ii = pos;
	}
	if (pos >= 10) {
		i = pos / 10;
		ii = pos % 10;
	}

	// Get the object name (actually the image name which is easy to identify).
	QVariant v = mPlayField[i][ii]->imageSource();

	if (v.canConvert<QString>()) {
		//QString objURL = v.value<QString>();
		QStringList imageSrc = v.value<QString>().split("/");
		int index = imageSrc.size() - 1; // size gives count not last index
		QStringList letterSrc = (imageSrc[index]).split(".");
		QString letter = letterSrc[0]; //a.png

		switch (stateOfLetter) {
			case NORMAL:
				imageSource = QString("asset:///images/letters/%1").arg(
						imageSrc[index]);
				break;
			case SELECTED:
				imageSource = QString("asset:///images/letters/selected/%1").arg(
						imageSrc[index]);
				mPlayField[i][ii]->setObjectName("selected");
				break;
			case HIGHLIGHT:
				imageSource = QString("asset:///images/letters/highlight/%1").arg(
						imageSrc[index]);
				playSound(SOUNDLETTERSELECTED);
				setSelectedLetters(letter);
				break;
			case HINTREVEAL:
				mPlayField[i][ii]->setRotationZ(90);
				imageSource = QString("asset:///images/letters/hints/%1").arg(
						imageSrc[index]);
				playSound(SOUNDLETTERSELECTED);
				break;
			case HINTROTATEUP:
				imageSource = QString("asset:///images/letters/hints/%1").arg(
						imageSrc[index]);
				mPlayField[i][ii]->setRotationZ(0);
				break;
		}

		mPlayField[i][ii]->setImage(Image(imageSource));
	}

}

void WordsPlus::WordCompleted(QList<int> listOfNumbers) {

	int i;
	int ii;
	QString selectedWord;

	//whether word found or not blank out selectedLetters
	setSelectedLetters("clear");

	// get corresponding letters and make word
	for (int j = 0; j < listOfNumbers.size(); j++) {
		int pos = listOfNumbers.at(j);

		if (pos <= 9) {
			i = 0;
			ii = pos;
		}
		if (pos >= 10) {
			i = pos / 10;
			ii = pos % 10;
		}

		QVariant v = mPlayField[i][ii]->imageSource();

		if (v.canConvert<QString>()) {
			QString objURL = v.value<QString>();
			QStringList imageSrc = objURL.split("/");
			int index = imageSrc.size() - 1; // size gives count not last index
			QString letter = imageSrc[index].split(".")[0];
			selectedWord.append(letter.toUpper()); // append letters to make word
		}
	}

	if (listOfWords.indexOf(selectedWord) >= 0) { // word found in puzzle words

		//remove word from list so it can't be selected a second time
		listOfWords.removeAll(selectedWord);

		for (int j = 0; j < listOfNumbers.size(); j++) {
			int pos = listOfNumbers.at(j);
			HighlightSelectedTile(pos, SELECTED);
		}

		numberOfWordsFound++;
		CrossOutPuzzleWord(selectedWord);

		// save off total words found - create a setter
		bool ok;
		int found = settings->getValueFor(WORDSFOUND, "0").toInt(&ok, 10);
		if (ok) {
			found++;
			settings->saveValueFor(WORDSFOUND, QString::number(found));
			emit totalWordsFoundChanged();
		}

		if (numberOfWordsFound == numberOfWords) { // Puzzle Completed
			setGamesPlayed();
			SaveBestPuzzleTime(timeSec);
			setScore(timeSec);
			//playSound(SOUNDLEVELCOMPLETED);
			QString puzzleMsg = QString(
					"PUZZLE COMPLETED! \nTime: %1 Score: %2").arg(
					(QDateTime::fromTime_t(timeSec)).toString("mm':'ss")).arg(
					getScore());
			showToast(puzzleMsg); // add icon url to pass to function
			ControlsForBBM(PROFILEBOXPUZZLECOMPLETED);
		}
	} else {
		for (int j = 0; j < listOfNumbers.size(); j++) { //word not found in puzzle words
			int pos = listOfNumbers.at(j);

			if (pos <= 9) {
				i = 0;
				ii = pos;
			}
			if (pos >= 10) {
				i = pos / 10;
				ii = pos % 10;
			}

			QVariant v = mPlayField[i][ii]->objectName();

			if (v.canConvert<QString>()) {
				QString objName = v.value<QString>(); // letter of word completed

				if (!objName.contains("selected", Qt::CaseInsensitive)) { // not part of another word
					HighlightSelectedTile(pos, NORMAL);
				} else {
					HighlightSelectedTile(pos, SELECTED);
				}
			}
		}
	}

}

void WordsPlus::CrossOutPuzzleWord(QString wordFound) {

	Label *mWordFound = appPage->findChild<Label*>(wordFound);

	TextStyle subTitleSelected = SystemDefaults::TextStyles::smallText();
	subTitleSelected.setColor(Color::fromARGB(0xff00629C));
	mWordFound->textStyle()->setBase(subTitleSelected);

}

void WordsPlus::showToast(QString msg) {

	emit mainSysToastSignal(msg);
}

void WordsPlus::onTick() {
	timeSec++;
	timeKeeper = QDateTime::fromTime_t(timeSec);
	m_strTime = timeKeeper.toString("mm':'ss");
	emit timeChanged();
}

void WordsPlus::initTimer() {

	if (stopWatch == NULL) {
		stopWatch = new Timer();
		connect(stopWatch, SIGNAL(timeout()), this, SLOT(onTick()));
		stopWatch->setInterval(1000);
	}
}

void WordsPlus::startTimer() {

	if (stopWatch == NULL) {
		//do nothing
	} else {
		stopWatch->start();
	}
}

void WordsPlus::stopTimer() {

	if (stopWatch == NULL) {
		//do nothing
	} else {
		stopWatch->stop();
	}
}

void WordsPlus::resetTimer() {

	if (stopWatch != NULL) {
		stopWatch->stop();
		timeSec = 0;
		stopWatch->start();
	}
}

QString WordsPlus::getCategory() {
	m_strCategory = settings->getValueFor(CATEGORY, "WEATHER");
	return m_strCategory;
}

void WordsPlus::setCategory(const QString cat) {
	m_strCategory = cat;
	settings->saveValueFor(CATEGORY, m_strCategory);
	emit categoryChanged(m_strCategory);
}

QString WordsPlus::getTime() {
	return m_strTime;
}

QString WordsPlus::getTotalWordsFound() {
	return settings->getValueFor(WORDSFOUND, "0");
}

void WordsPlus::playSound(const QString msg) {

	if (getSound()) { // if true play sound
		if (msg == SOUNDLETTERSELECTED)
			SystemSound::play(SystemSound::InputKeypress);
		if (msg == SOUNDLEVELCOMPLETED)
			mSoundManager->play(msg);
		if (msg == SOUNDBACKGROUNDMUSIC)
			mSoundManager->play(msg);
	}

}

bool WordsPlus::getSound() {
	bool okSound;
	QString strSoundEnabled = settings->getValueFor(SOUND, "1");
	isSoundEnabled = strSoundEnabled.toInt(&okSound, 10);
	return isSoundEnabled;
}

void WordsPlus::setSound(bool status) {
	isSoundEnabled = status;
	QString strSoundEnabled = QString::number(isSoundEnabled);
	settings->saveValueFor(SOUND, strSoundEnabled);
	emit soundChanged();
}

bool WordsPlus::getMusic() {
	bool okMusic;
	QString strMusicEnabled = settings->getValueFor(MUSIC, "1");
	isMusicEnabled = strMusicEnabled.toInt(&okMusic, 10);
	return isMusicEnabled;
}

void WordsPlus::setMusic(bool status) {
	isMusicEnabled = status;
	QString strMusicEnabled = QString::number(isMusicEnabled);
	settings->saveValueFor(MUSIC, strMusicEnabled);
	emit musicChanged();
}

bool WordsPlus::getProfileBox() {
	bool okProfile;
	QString strProfileBoxEnabled = settings->getValueFor(PROFILEBOXUPDATES,"1");
	isProfileBoxEnabled = strProfileBoxEnabled.toInt(&okProfile, 10);
	return isProfileBoxEnabled;
}

void WordsPlus::setProfileBox(bool status) {
	isProfileBoxEnabled = status;
	QString strProfileBoxEnabled = QString::number(isProfileBoxEnabled);
	settings->saveValueFor(PROFILEBOXUPDATES, strProfileBoxEnabled);
	emit profileBoxChanged();
}

QString WordsPlus::getPuzzleCompletedTime() {

	bool okTime;
	QString strSavedTime = settings->getValueFor(PUZZLECOMPLETEDTIME, "0");
	int savedTime = strSavedTime.toInt(&okTime, 10);
	//LOG("get savedTime: %i",savedTime );
	return (QDateTime::fromTime_t(savedTime)).toString("mm':'ss");

}

void WordsPlus::SaveBestPuzzleTime(int puzzleTime) {

	bool okTime;
	QString strSavedTime = settings->getValueFor(PUZZLECOMPLETEDTIME, "0");
	int savedTime = strSavedTime.toInt(&okTime, 10);

	//LOG("puzzleTime: %i savedTime: %i",puzzleTime,savedTime );
	if (savedTime == 0)
		savedTime = puzzleTime;
	if (puzzleTime <= savedTime) {
		settings->saveValueFor(PUZZLECOMPLETEDTIME,
				QString::number(puzzleTime));
		emit puzzleCompletedTimeChanged();
	}

}

int WordsPlus::getScore() {

	bool okScore;
	QString strScore = settings->getValueFor(SCORE, "0");
	int score = strScore.toInt(&okScore, 10);

	return score;

}

void WordsPlus::setScore(int puzzleTime) {

	int score = getScore();
	score = score + (100000 / puzzleTime) * (getDifficulty() / 2); //minimize ridiculously large scores divide difficulty by 2

	settings->saveValueFor(SCORE, QString::number(score));
	submitScore(score);

	emit scoreChanged();

}

int WordsPlus::getGamesPlayed() {

	bool okGames;
	QString strPlayed = settings->getValueFor(GAMESPLAYED, "0");
	int numberOfGames = strPlayed.toInt(&okGames, 10);

	return numberOfGames;

}

void WordsPlus::setGamesPlayed() {

	bool okGames;
	QString strPlayed = settings->getValueFor(GAMESPLAYED, "0");
	int numberOfGames = strPlayed.toInt(&okGames, 10);

	numberOfGames++; //increase by 1

	settings->saveValueFor(GAMESPLAYED, QString::number(numberOfGames));
	emit gamesPlayedChanged();

}

void WordsPlus::setSelectedLetters(QString letter) {

	if (letter == "clear") {
		m_strSeletedLetters = "";
	} else {
		m_strSeletedLetters = m_strSeletedLetters.append(letter.toUpper());
	}
	emit selectedLettersChanged();
}

QString WordsPlus::getSelectedLetters() {
	return m_strSeletedLetters;
}

int WordsPlus::getDifficulty() {

	bool okDiff;
	QString strDiff = settings->getValueFor(DIFFICULTY, "2");
	puzzleDifficulty = strDiff.toInt(&okDiff, 10);

	//LOG("%i", puzzleDifficulty);
	return puzzleDifficulty;

}

void WordsPlus::setDifficulty(int difficulty) {

	//LOG("Set Difficulty: %i", difficulty);
	settings->saveValueFor(DIFFICULTY, QString::number(difficulty));
	emit difficultyChanged();

}

void WordsPlus::ControlsForBBM(int state) {

	// Create the user profile and profile box objects
	m_userProfile = new bb::platform::bbm::UserProfile(m_context, this);
	m_profileBox = new bb::platform::bbm::ProfileBox(m_context, this);

	switch (state) {
	case PROFILEBOXPUZZLECOMPLETED: {
		if (getProfileBox()) {
			QString msg = QString(
					"More Puzzles. More Fun.\nCompleted Another One! \nTime: %1  Score: %2").arg(
					(QDateTime::fromTime_t(timeSec)).toString("mm':'ss")).arg(
					getScore());

			//register icons
			profileBox = new ProfileBox(m_profileBox);

			//wordsPlus.png iconId = 1
			//could use #define WORDSPLUSPROFILEBOX 1
			//use 0 if you have no image
			profileBox->addProfileBoxItem(msg, 3);
		}
		break;
	}
	case PRESONALMESSAGE: {
		updateProfile = new UpdateProfile(m_userProfile);
		updateProfile->savePersonalMessage();
		break;
	}
	case STATUSMESSAGE: {
		updateProfile = new UpdateProfile(m_userProfile);
		updateProfile->saveStatus();
		break;
	}
	case INVITETODOWNLOAD: {
		inviteToDownload = new InviteToDownload(m_context);
		inviteToDownload->sendInvite();
		break;
	}
	}

}
