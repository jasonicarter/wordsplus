/*
 * GameSettings.cpp
 *
 *  Created on: 2012-10-29
 *      Author: Jason
 */

#include "GameSettings.hpp"
#include <QSettings>


GameSettings::GameSettings()
{
    // Set the application organization and name, which is used by QSettings
    // when saving values to the persistent store.
    QCoreApplication::setOrganizationName("JICarter");
    QCoreApplication::setApplicationName("WordsPlus");

}

GameSettings::~GameSettings()
{
}

QString GameSettings::getValueFor(const QString &objectName, const QString &defaultValue)
{
    QSettings settings;

    // If no value has been saved, return the default value.
    if (settings.value(objectName).isNull()) {
        return defaultValue;
    }

    // Otherwise, return the value stored in the settings object.
    return settings.value(objectName).toString();
}

void GameSettings::saveValueFor(const QString &objectName, const QString &inputValue)
{
    // A new value is saved to the application settings object.
    QSettings settings;
    settings.setValue(objectName, QVariant(inputValue));
}


