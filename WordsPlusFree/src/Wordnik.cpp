/*
 * Wordnik.cpp
 *
 *  Created on: 2013-07-07
 *      Author: Jason
 */

#include "Wordnik.hpp"

#include <bb/data/JsonDataAccess>

#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QUrl>

#include "json.h"

using QtJson::JsonObject;
using QtJson::JsonArray;

#define LOG(fmt, args...)   do { fprintf(stdout, "[QtJson ] " fmt "\n", ##args); fflush(stdout); } while (0);


Wordnik::Wordnik(QObject* parent)
    : QObject(parent)
    , m_networkAccessManager(new QNetworkAccessManager(this))
{
}



QList<QString> Wordnik::getWordOfTheDay(QString date = QDate::currentDate().toString(yyyy-MM-dd)){
	QList<QString> t;
	return t;
}

QList<QString> Wordnik::getWordList(int size = 12){
	QList<QString> t;
	return t;
}

void Wordnik::onWordOfTheReply(){

}

void Wordnik::onWordList(){

}
