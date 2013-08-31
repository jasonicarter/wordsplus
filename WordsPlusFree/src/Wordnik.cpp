/*
 * Wordnik.cpp
 *
 *  Created on: 2013-07-07
 *      Author: Jason
 */

#include "Wordnik.hpp"
#include "QtObjectFormatter.hpp"


#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QSettings>
#include <QSslConfiguration>
#include <QUrl>
#include <bb/data/JsonDataAccess>


using namespace bb::data;

#define LOG(fmt, args...)   do { fprintf(stdout, "[QtJson ] " fmt "\n", ##args); fflush(stdout); } while (0);


Wordnik::Wordnik(QObject* parent)
    : QObject(parent)
    , m_networkAccessManager(new QNetworkAccessManager(this))
{
}


void Wordnik::callWordnik(QString type){

	wordnikType.clear();
	wordnikType = type.toLower();

	if(wordnikType == "wordoftheday"){
		const QUrl url("http://api.wordnik.com/v4/words.json/wordOfTheDay?api_key=ddf8d3e28266772522105018b8307cc64aa976d8f76f90ac8");
		QNetworkRequest request(url);
		QNetworkReply* reply = m_networkAccessManager->get(request);
		connect(reply, SIGNAL(finished()), this, SLOT(onWordReply()));
	}else if (wordnikType == "wordlist") {
		const QUrl url("http://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=false&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=11&limit=20&api_key=ddf8d3e28266772522105018b8307cc64aa976d8f76f90ac8");
		QNetworkRequest request(url);
		QNetworkReply* reply = m_networkAccessManager->get(request);
		connect(reply, SIGNAL(finished()), this, SLOT(onWordReply()));
	}

}

void Wordnik::onWordReply(){

	//LOG("Made it: onWordReply");
	QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());

	    QString response;
	    if (reply) {
	        if (reply->error() == QNetworkReply::NoError)
	        {
	            const int available = reply->bytesAvailable();
	            if (available > 0) {
	            	//LOG("Made it: Reply Available");
	                const QByteArray buffer(reply->readAll());

	                QString json(buffer);

	                JsonDataAccess jda;
	                QVariant qtData = jda.loadFromBuffer(json);
	                if (jda.hasError()) {
	                	response = "fail"; //error message to user
	                	//LOG("Made it: jda has error");
	                } else {
	                	//LOG("Made it: jda has no error");
	                	const QtObjectFormatter fmt;

	                	if(wordnikType == "wordlist"){
	                		response = fmt.wordList(qtData);
	                	}else if (wordnikType == "wordoftheday"){
	                		//LOG("Made it: Before formatter");
	                		//LOG("%s", qtData.toString().toStdString().c_str() );
	                		response = fmt.wordOfTheDay(qtData);
	                	}
	                	//LOG("%s", response.toStdString().c_str() );
	                }
	            } // data available
	        } else { // network error
	        	//LOG("Made it: network reply error");
	            // Get http status code
	            const int httpStatus = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
	            // Do some error management
	            response = tr("Http Error: %1").arg(httpStatus); //do something alittle better
	        }

	        reply->deleteLater();
	    }

	    if (response.trimmed().isEmpty()) {
	        response = tr("Unable to retrieve data"); //if response is empty or reply is false
	        //LOG("Made it: empty response");
	    }

	    //emit complete(response);

    	if(wordnikType == "wordlist"){
    		emit completedWordList(response);
    	}else if (wordnikType == "wordoftheday"){
    		emit completedWordOfTheDay(response);
    	}

    	//LOG("%s", response.toStdString().c_str() );
}

