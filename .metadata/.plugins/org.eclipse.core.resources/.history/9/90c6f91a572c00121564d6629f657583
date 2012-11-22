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


#include "RegistrationHandler.hpp"
#include <bb/platform/bbm/RegistrationState>
#include <bb/platform/bbm/Context>

#include <bb/cascades/QmlDocument>

#include "Global.hpp"

#define LOG(fmt, args...)   do { fprintf(stdout, "[Registration Sample] " fmt "\n", ##args); fflush(stdout); } while (0);

using namespace bb::cascades;

RegistrationHandler::RegistrationHandler()
{

  // Attempt to register the application with the following UUID.
  // Define your own UUID here.  You can generate one here: http://www.guidgenerator.com/
  m_uuid = QString::fromUtf8("f6ffc443-c55b-4f19-aef6-fe005279e325");//original

  // this->appRegister();

}


void RegistrationHandler::appRegister()
{
	LOG("appRegister");
  m_context = new bb::platform::bbm::Context(QUuid(m_uuid));
  Global::instance()->setContext(m_context);
  QObject::connect(m_context, SIGNAL(registrationStateUpdated(bb::platform::bbm::RegistrationState::Type)),
  			this, SLOT(registrationStatus(bb::platform::bbm::RegistrationState::Type)));
  m_context->requestRegisterApplication();
}

void RegistrationHandler::checkRegistrationAccess(){
	LOG("checkRegistrationAccess");
	bb::platform::bbm::RegistrationState::Type status = bb::platform::bbm::RegistrationState::Unknown;
	if (Global::instance()->getContext()) {
		status = Global::instance()->getContext()->registrationState();
	}
	registrationStatus(status);
}


void RegistrationHandler::registrationStatus(bb::platform::bbm::RegistrationState::Type state) {
    LOG("registrationStatus: %i", state);

  switch(state){
	case bb::platform::bbm::RegistrationState::Unregistered:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::Unknown:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::Allowed:
		LOG("BBM SP registration succeeded");
	  break;

	case bb::platform::bbm::RegistrationState::Pending:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::BlockedByUser:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::BlockedByRIM:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::NoDataConnection:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::UnexpectedError:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::InvalidUuid:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::TemporaryError:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::CancelledByUser:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::MaxDownloadsReached:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::MaxAppsReached:
	  this->registrationFailed();
	  break;

	case bb::platform::bbm::RegistrationState::Expired:
	  this->registrationFailed();
	  break;

	default:
	  this->registrationFailed();
	  break;
	}
}

void RegistrationHandler::registrationFailed() // update to accept string to id the exact error for user
{
	LOG("registrationFailed");
	//A generic error message is provided here.
	//You could provide a different error for each failure code to instruct the
	//user on how to continue.
}
