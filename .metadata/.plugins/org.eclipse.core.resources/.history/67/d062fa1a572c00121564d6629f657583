/* Copyright (c) 2012 Research In Motion Limited.
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

#include "UpdateProfilePage.hpp"
#include "Global.hpp"

#include <bb/cascades/QmlDocument>
#include <bb/cascades/Control>

#define LOG(fmt, args...)   do { fprintf(stdout, "[Registration Sample] " fmt "\n", ##args); fflush(stdout); } while (0);

using namespace bb::cascades;

UpdateProfilePage::UpdateProfilePage(
		bb::platform::bbm::UserProfile* userProfile) :
		m_userProfile(userProfile) {
	LOG("UpdateProfilePage");
	m_userProfile = new bb::platform::bbm::UserProfile(
			Global::instance()->getContext(), this);
}

void UpdateProfilePage::saveStatus() {
	QString statusMessageString = "I'm Playing WordsPlus";
	bool showBusy = true;
	m_userProfile->requestUpdateStatus(
			(showBusy ?
					bb::platform::bbm::UserStatus::Busy :
					bb::platform::bbm::UserStatus::Available),
			statusMessageString);
}

void UpdateProfilePage::savePersonalMessage() {
	LOG("savePersonalMessage");
	QString personalMessageString =
			"WordsPlus: BEST WORDSEARCH GAME EVER!";
	m_userProfile->requestUpdatePersonalMessage(personalMessageString);
}

