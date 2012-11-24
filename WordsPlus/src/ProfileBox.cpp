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

#include <bb/cascades/Container>
#include <bb/cascades/LongPressHandler>

#include <bb/platform/bbm/ProfileBoxItem>
#include "ProfileBox.hpp"
#include "Global.hpp"

#define LOG(fmt, args...)   do { fprintf(stdout, "[Registration Sample] " fmt "\n", ##args); fflush(stdout); } while (0);

using namespace bb::cascades;

//static const QString logPrefix("ProfileBox");

ProfileBox::ProfileBox()
{
  m_profileBox = new bb::platform::bbm::ProfileBox(Global::instance()->getContext(), this);
  registerIcons();
}

void ProfileBox::registerIcons()
{
  QString imageDir(QDir::currentPath() + "/app/native/assets/images/");
  registerIcon(imageDir + "profileBox.png", 1);
  //register other icons that you might want to use
}

void ProfileBox::registerIcon(const QString& path, int iconId)
{
  // Read the icon from the file
  QImage image;
  QByteArray iconArray;
  QBuffer buffer(&iconArray);
  buffer.open(QIODevice::WriteOnly);
  if(not image.load(path)) {
    //LOG("Failed to load icon");
    return;
  }
  //LOG("Icon loaded");
  image.save(&buffer, "PNG");

  // Create the icon object and register the icon
  const bool result = m_profileBox->requestRegisterIcon(
    iconId, bb::platform::bbm::ImageType::Png, iconArray);
  //LOG("load result: %i", result);
}

void ProfileBox::createItem(const QString& text, const QString& iconPath)
{

  m_text = text;
  m_iconPath = iconPath;

  // If no icon was selected, add the item right away
  if(m_iconPath == "none") {
    m_profileBox->requestAddItem(m_text, QString("cookie"));
    return;
  }


  // Icon was selected. Determine its ID
  int iconId;
  if(m_iconPath == "profileBox") {
    iconId = 1;
    //LOG("IconID 1");
  } else if(m_iconPath == "x") {
    iconId = 2;
  } else if(m_iconPath == "y") {
    iconId = 3;
  } else {
    return;
  }

  // Add the item
  m_profileBox->requestAddItem(
  m_text, iconId, QString("cookie"));
}
