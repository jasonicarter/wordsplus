/*
 * ActiveFrame.cpp
 *
 *  Created on: 2012-10-30
 *      Author: Jason
 */

#include "ActiveFrame.h"

#include <bb/cascades/ImageView>

ActiveFrame::ActiveFrame() :
		SceneCover(this) {

	/**
	 * Remember to set permission Run When Backgrounded in bar-descriptor.xml.
	 */
	qml = QmlDocument::create("asset:///ActiveFrameCover.qml").parent(this);
	mMainContainer = qml->createRootObject<Container>();

	// Set the content of ActiveFrame
	setContent(mMainContainer);
	QObject::connect(Application::instance(), SIGNAL(thumbnail()), this, SLOT(update()));

}

ActiveFrame::~ActiveFrame() {
	// TODO Auto-generated destructor stub
}

void ActiveFrame::update() {

	/**
	 *  You can update the cover here.
	 */

	//You can update AF every 1 sec but BB10 platform will update UI every 30sec
	//QTimer::singleShot(1000, this, SLOT(update()));
	Label* label_cat = mMainContainer->findChild<Label*>("label_category");
//	ImageView* imageFrame = mMainContainer->findChild<ImageView*>("activeImage");
//	GameSettings* settings = new GameSettings();
//
//	QString imageSource = QString("asset:///theme/%1/theme_activeFrame.png").arg(settings->getValueFor("settingsTheme", "wordsPlus"));
//	imageFrame->setImage(Image(imageSource));

	if (label_cat) {
		label_cat->setText(" " + settings->getValueFor("settingsCategory", "WEATHER").toUpper());
		//label_cat->setText(" " + settings->getValueFor("settingsDifficulty", "8").toUpper());
	}

}

