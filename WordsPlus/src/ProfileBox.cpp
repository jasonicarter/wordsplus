/*
* Copyright (c) 2012 Jason I. Carter
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


#include <bb/platform/bbm/ProfileBoxItem>
#include "ProfileBox.hpp"

#include <QtCore/QDIR>

ProfileBox::ProfileBox(bb::platform::bbm::ProfileBox* profileBox) :
		m_profileBox(profileBox)
{
  registerIcons();
}

void ProfileBox::registerIcons()
{
	const QString imageDir(QDir::currentPath() + QLatin1String("/app/native/assets/images/"));
	registerIcon(imageDir + QLatin1String("profileBox.png"), 2);

	//register other icons that you might want to use
	//registerIcon(imageDir + QLatin1String("wordsPlus2.png"), 2);
	//registerIcon(imageDir + QLatin1String("wordsPlus3.png"), 3);
}

void ProfileBox::registerIcon(const QString& path, int iconId)
{
	// Read the icon from the file
	QFile file(path);
	if (!file.open(QIODevice::ReadOnly))
		return;

	const QByteArray imageData = file.readAll();

	// Create the icon object and register the icon
	m_profileBox->requestRegisterIcon(iconId, bb::platform::bbm::ImageType::Png, imageData);

}

void ProfileBox::addProfileBoxItem(const QString& text, int iconId)
{
	switch(iconId){
		case 0:
			m_profileBox->requestAddItem(text);
			break;
		default:
			m_profileBox->requestAddItem(text, iconId);
			break;
	}
}
