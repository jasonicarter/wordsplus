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

#ifndef UPDATEPROFILEPAGE_HPP_
#define UPDATEPROFILEPAGE_HPP_

#include <bb/platform/bbm/UserProfile>
#include <QtCore/QObject>

class UpdateProfile: public QObject {
  Q_OBJECT

public Q_SLOTS:
	void saveStatus();
	void savePersonalMessage();

public:
	UpdateProfile(bb::platform::bbm::UserProfile* userProfile);

private:
	bb::platform::bbm::UserProfile * m_userProfile;

};

#endif /* UPDATEPROFILEPAGE_HPP_ */
