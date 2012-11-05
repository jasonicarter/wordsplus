// Default empty project template
#include "WordsPlus.hpp"
#include "wordsearch.h"

#include "RegistrationHandler.hpp"

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
#include <bb/system/SystemToast>
#include <bb/multimedia/SystemSound>

#define NORMAL		1
#define SELECTED	2
#define HIGHLIGHT	3
#define WORDSFOUND "settingsWordsFound"
#define CATEGORY "settingsCategory"
#define SOUNDLEVELCOMPLETED "puzzleCompleted.wav"
#define SOUNDLEVELSELECTED "levelSelected"
#define SOUND "settingsSound"

using namespace bb::cascades;
using namespace bb::system;
using namespace bb::multimedia;

WordsPlus::WordsPlus(bb::cascades::Application *app) :
		QObject(app) {

	//set default values
	deltaX = 0.0;
	deltaY = 0.0;
	multiple = 1;
	length = 0;
	upperbound = 100;
	lowerbound = 0;
	position = 0;
	tileSize = 50;
	timeSec = 0;
	stopWatch = NULL;
	numberOfWordsFound = 0;

	// Initialize for local storage settings
	settings = new GameSettings();

	// Initialize the sound manager with a directory that resides in the
	// assets directory which only contains playable files.
	mSoundManager = new SoundManager("sounds/");

	mQmlDocument = QmlDocument::create("asset:///main.qml");
	mQmlDocument->setParent(this);
	mQmlDocument->setContextProperty("wordsPlus", this);

	if (!mQmlDocument->hasErrors()) {

		// The application navigationPane is created from QML.
		tabs = mQmlDocument->createRootObject<TabbedPane>();

		if (tabs) {

			RegistrationHandler* regBBM;
			regBBM = new RegistrationHandler();
			regBBM->appRegister();

			// Create the cover now. When application in moved to a background it's too late
			// to create some UI controls or send asynch. requests. Remember ActiveFrame is refreshed every 30sec.
			// Using DataModel in ActiveFrame isn't good idea too.
			// Provider creates the CustomControls once they are needed.
			app->setCover(new ActiveFrame());

			//possible connecting to a function here so on thumbnail - stop timer
			//QObject::connect(Application::instance(), SIGNAL(thumbnail()), this, SLOT(onThumbnail()));

			intializePlayArea(); //check spelling :)
			stopTimer();

			// Set the main application scene to NavigationPane.
			Application::instance()->setScene(tabs);
		}
	}
}

// Look into what else to destroy if nescessary
WordsPlus::~WordsPlus() {
	// Destroy the sound manager.
	delete mSoundManager;
}

void WordsPlus::intializePlayArea() {

	mPlayAreaContainer = tabs->findChild<Container*>("playAreaContainer");
	mPlayAreaContainer->removeAll();

	Container *mWordsToFindContainer = tabs->findChild<Container*>(
			"wordsToFind");
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
//		printf(cat.c_str());
//		fflush(stdout);
		char** letter = createNewPuzzle((char*) cat.c_str());
		char** puzzleWords = returnPuzzleWords();

		QString listOfWords;
		numberOfWords = returnNumberOfPuzzleWords();

		printf("WordsPlus\n");
		printf("Number Of Words: ");
		printf("%i", numberOfWords);
		for (int i = 0; i < numberOfWords; i++) {
			listOfWords.append(puzzleWords[i]);
			listOfWords.append(' ');

			//get word, create label and add to wordsToFind container
			QString labelText = puzzleWords[i];
			Label *wordLabel = new Label();
			wordLabel->textStyle()->setBase(subTitleWhite);
			wordLabel->setObjectName(labelText);
			wordLabel->setText(labelText);

			printf("\n");
			printf("%s", labelText.toStdString().c_str());
			fflush(stdout);

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

		setPuzzleWords(listOfWords);

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

//		printf("(%i , %i) ", (int) deltaX, (int) deltaY);
//		fflush(stdout);

		//Y direction only
		if (deltaX >= -25 && deltaX <= 25) {
			length = (int) deltaY;
			//deltaY increases (+ve) when finger moves top to bottom
			if (length / 60 == multiple && length > 0) {
				position += 1;
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
		} else if (deltaY >= -25 && deltaY <= 25) {
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
		} else if (deltaX > 25) { //east
			if (deltaY > 25) { // diagonal South East
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
			if (deltaY < -25) { // diagonal North East
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
		} else if (deltaX < -25) { // west
			if (deltaY > 25) { // diagonal South West
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
			if (deltaY < -25) { // diagonal North West
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
		QString objURL = v.value<QString>();
		QStringList imageSrc = objURL.split("/");
		int index = imageSrc.size() - 1; // size gives count not last index

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
			playSound(SOUNDLEVELSELECTED);
			break;
		}

		mPlayField[i][ii]->setImage(Image(imageSource));
	}

}

void WordsPlus::WordCompleted(QList<int> listOfNumbers) {

	int i;
	int ii;
	QString selectedWord;
	QStringList puzzleWords;

	// get array of puzzle words
	puzzleWords = getPuzzleWords().split(" ");

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

	if (puzzleWords.indexOf(selectedWord) >= 0) { // word found in puzzle words
		for (int j = 0; j < listOfNumbers.size(); j++) {
			int pos = listOfNumbers.at(j);
			HighlightSelectedTile(pos, SELECTED);
		}

		numberOfWordsFound++;
		CrossOutPuzzleWord(selectedWord);

		// save off total words found
		bool ok;
		int found = settings->getValueFor(WORDSFOUND, "0").toInt(&ok, 10);
		if (ok) {
			found++;
			settings->saveValueFor(WORDSFOUND, QString::number(found));
			emit totalWordsFoundChanged();
		}

		if (numberOfWordsFound == numberOfWords) { // Puzzle Completed
			playSound(SOUNDLEVELCOMPLETED);
			showToast("PUZZLE COMPLETED!"); // add icon url to pass to function
			intializePlayArea(); // create a new puzzle
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

	Label *mWordFound = tabs->findChild<Label*>(wordFound);

	TextStyle subTitleSelected = SystemDefaults::TextStyles::smallText();
	subTitleSelected.setColor(Color::fromARGB(0xff00629C));
	mWordFound->textStyle()->setBase(subTitleSelected);

}

void WordsPlus::showToast(QString msg) {
	SystemToast *toast = new SystemToast(this);
	toast->setBody(msg);
	toast->setPosition(SystemUiPosition::TopCenter);
	toast->show();
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

QString WordsPlus::getPuzzleWords() {
	return m_strPuzzleWords;
}

void WordsPlus::setPuzzleWords(const QString words) {
	m_strPuzzleWords = words;
	emit puzzleWordsChanged(m_strPuzzleWords);
}

QString WordsPlus::getTime() {
	return m_strTime;
}

QString WordsPlus::getTotalWordsFound() {
	return settings->getValueFor(WORDSFOUND, "0");
}

void WordsPlus::playSound(const QString &msg) {

	if (getSound()) { // if true play sound
		if (msg == SOUNDLEVELSELECTED)
			SystemSound::play(SystemSound::InputKeypress);
		if (msg == SOUNDLEVELCOMPLETED)
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

