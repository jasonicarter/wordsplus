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


#ifndef PROFILEBOX_HPP_
#define PROFILEBOX_HPP_

#include <bb/platform/bbm/ProfileBox>

#include <QtCore/QObject>

class ProfileBox : public QObject
{
  Q_OBJECT


public:
  ProfileBox(bb::platform::bbm::ProfileBox* profileBox);

  void addProfileBoxItem(const QString& text, int iconId);

private:
  // Registers all of the icons.
  void registerIcons();
  void registerIcon(const QString& path, int iconId);

  bb::platform::bbm::ProfileBox* m_profileBox;
};


#endif /* PROFILEBOX_HPP_ */
