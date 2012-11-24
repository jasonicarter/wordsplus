/*
 * ActiveFrame.cpp
 *
 *  Created on: 2012-10-30
 *      Author: Jason
 */

#include "ActiveFrame.h"

ActiveFrame::ActiveFrame() :
		SceneCover(this) {

	/**
	 * Remember to set permission Run When Backgrounded in bar-descriptor.xml.
	 */
	qml = QmlDocument::create("asset:///ActiveFrameCover.qml").parent(this);
	mMainContainer = qml->createRootObject<Container>();

	// Set the content of ActiveFrame
	setContent(mMainContainer);

	// description xml file - run in background if using update();
	// You can do it now or trigger the slot whne application is moved to baackground.
	//QObject::connect(Application::instance(), SIGNAL(thumbnail()), this, SLOT(update()));
	// and/or disable updates when it's in foreground

	//update();
}

ActiveFrame::~ActiveFrame() {
	// TODO Auto-generated destructor stub
}

void ActiveFrame::update() {

	/**
	 *  You can update the cover here.
	 */

	//You can update AF every 1 sec but BB10 platform will update UI every 30sec :)
	//QTimer::singleShot(1000, this, SLOT(update()));

	Label* label2 = mMainContainer->findChild<Label*>("label2");

	if (label2) {
		int c = label2->text().toInt() + 1;
		label2->setText(QString::number(c));
	}

}


