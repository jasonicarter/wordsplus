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

#include "ExternalIP.hpp"

#include "AppSettings.hpp"

#include <bb/data/JsonDataAccess>

#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QSettings>
#include <QSslConfiguration>
#include <QUrl>

#include "QtObjectFormatter.hpp"

#include "json.h"

using QtJson::JsonObject;
using QtJson::JsonArray;
using namespace bb::data;

#define LOG(fmt, args...)   do { fprintf(stdout, "[QtJson ] " fmt "\n", ##args); fflush(stdout); } while (0);

/**
 * ExternalIP
 *
 * In this class you will learn the following:
 * -- How to use QNetworkAccessManager to make a network request
 * -- How to setup a secure connection with QSslConfiguration
 * -- How to read a network response with QNetworkReply
 * -- How to parse JSON data using JsonDataAccess
 */
//! [0]
ExternalIP::ExternalIP(QObject* parent)
    : QObject(parent)
    , m_networkAccessManager(new QNetworkAccessManager(this))
{
}
//! [0]
/**
 * ExternalIP::getIP()
 *
 * Make a network request to httpbin.org/ip to return your external IP address in JSON
 * format
 */
//! [1]
void ExternalIP::getIP()
{
    //const QUrl url("http://httpbin.org/ip");
	//const QUrl url("http://api.wordnik.com/v4/words.json/wordOfTheDay?date=2013-07-1&api_key=ddf8d3e28266772522105018b8307cc64aa976d8f76f90ac8");
	const QUrl url("http://api.wordnik.com/v4/words.json/wordOfTheDay?api_key=ddf8d3e28266772522105018b8307cc64aa976d8f76f90ac8");
	//const QUrl url("http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=12&limit=10&api_key=ddf8d3e28266772522105018b8307cc64aa976d8f76f90ac8");
    QNetworkRequest request(url);

    // Check App settings to see if we should use SSL
    if (AppSettings::isUsingHttps()) {
        request.setUrl(QUrl("https://httpbin.org/ip"));

        QSslConfiguration config = request.sslConfiguration();
        config.setPeerVerifyMode(QSslSocket::VerifyNone);
        config.setProtocol(QSsl::TlsV1);
        request.setSslConfiguration(config);
    }

    QNetworkReply* reply = m_networkAccessManager->get(request);

    connect(reply, SIGNAL(finished()), this, SLOT(onGetReply()));
}
//! [1]
/**
 * ExternalIP::onGetReply()
 *
 * SLOT
 * Parse the network response if we get one
 */
//! [2]
void ExternalIP::onGetReply()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());

    QString response;
    if (reply) {
        if (reply->error() == QNetworkReply::NoError) {
            const int available = reply->bytesAvailable();
            if (available > 0) {
                const QByteArray buffer(reply->readAll());

                QString json(buffer);


                JsonDataAccess jda;
                QVariant qtData = jda.loadFromBuffer(json);
                if (jda.hasError()) {
                	response = "fail";
//                    const DataAccessError err = jda.error();
//                    const QString errorMsg = tr("Error converting JSON data: %1").arg(err.errorMessage());
//                    setResultAndState(errorMsg, JsonLoaded);
                } else {
                	response = "success";
                	const QtObjectFormatter fmt;
                	//response = fmt.wordList(qtData);
                	response = fmt.wordOfTheDay(qtData);
                	LOG("%s", response.toStdString().c_str() );
                }


//                bool ok;
//               QtJson::JsonObject result = QtJson::parse(json, ok).toMap();
//
//                foreach(QString k, result.keys()){
//                	LOG("%s", k.toStdString().c_str());
//                	response += k;
//                }

//				foreach(QVariant def, result[""].toList()) {
//
//					QtJson::JsonObject nested = def.toMap();
//					LOG("%s", nested["id"].toString().toStdString().c_str() );
//
//					response += "\n" + nested["id"].toString();
//					response += "\n" + nested["word"].toString();
//					response += "\n";
//				}


//                bool ok;
//                QtJson::JsonObject result = QtJson::parse(json, ok).toMap();
//
//				foreach(QVariant def, result["definitions"].toList()) {
//
//					QtJson::JsonObject nested = def.toMap();
//					LOG("%s", nested["text"].toString().toStdString().c_str() );
//
//					response += "\n" + nested["text"].toString();
//					response += "\n" + nested["partOfSpeech"].toString();
//					response += "\n";
//				}
//
//                response += result["word"].toString();
//                response += " " + result.count();
//                //response = ok;
//
//                LOG("%i", ok );



                // json is a QString containing the JSON data
//                QtJson::JsonObject result = QtJson::parse(json, ok).toMap();
//                response += result["word"].toString();
//                response += " " + result.count();
//                //response = ok;
//
//                LOG("%i", ok );

                //LOG("%s", result["word"].toString().toStdString().c_str() );


//				foreach(QVariant word, result.values()) {
//
//					QtJson::JsonObject nested = word.toMap();
//					LOG("%s", nested["word"].toString().toStdString().c_str() );
//
//					response += "\n" + nested["word"].toString();
//					response += "\n";
//				}


//                foreach(QVariant def, result["definitions"].toList()) {
//
//                	QtJson::JsonObject nested = def.toMap();
//                	LOG("%s", nested["text"].toString().toStdString().c_str() );
//
//                	response += "\n" + nested["text"].toString();
//                	response += "\n" + nested["partOfSpeech"].toString();
//                	response += "\n";
//                }
//
//                foreach(QVariant ex, result["examples"].toList()) {
//
//                	QtJson::JsonObject nested = ex.toMap();
//
//                	response += "\n" + nested["text"].toString();
//                	response += "\n";
//                }
//
//                foreach(QVariant ex, result["contentProvider"].toList()) {
//
//                	QtJson::JsonObject nested = ex.toMap();
//
//                	response += "\n" + nested["name"].toString();
//                	response += "\n";
//                }

            }
        } else {
            // Get http status code
            const int httpStatus = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();

            // Do some error management
            response = tr("Http Error: %1").arg(httpStatus);
        }

        reply->deleteLater();
    }

    if (response.trimmed().isEmpty()) {
        response = tr("Unable to retrieve ip address");
    }

    emit complete(response);
}
//! [2]
