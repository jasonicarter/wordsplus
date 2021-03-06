/****************************************************************************
 **
 ** Portions Copyright (C) 2012 Research In Motion Limited.
 ** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
 ** All rights reserved.
 ** Contact: Research In Motion Ltd. (http://www.rim.com/company/contact/)
 ** Contact: Nokia Corporation (qt-info@nokia.com)
 **
 ** This file is part of the examples of the BB10 Platform and is derived
 ** from a similar file that is part of the Qt Toolkit.
 **
 ** You may use this file under the terms of the BSD license as follows:
 **
 ** "Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions are
 ** met:
 **   * Redistributions of source code must retain the above copyright
 **     notice, this list of conditions and the following disclaimer.
 **   * Redistributions in binary form must reproduce the above copyright
 **     notice, this list of conditions and the following disclaimer in
 **     the documentation and/or other materials provided with the
 **     distribution.
 **   * Neither the name of Research In Motion, nor the name of Nokia
 **     Corporation and its Subsidiary(-ies), nor the names of its
 **     contributors may be used to endorse or promote products
 **     derived from this software without specific prior written
 **     permission.
 **
 ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
 **
 ****************************************************************************/

#include "QtObjectFormatter.hpp"

#include <iostream>
#include <stdarg.h>

#include <QtCore/QDebug>
#include <QtCore/QMetaType>
#include <QStringList>

Q_DECLARE_METATYPE(QList<QVariantMap>)

#define LOG(fmt, args...)   do { fprintf(stdout, "[QtJson ] " fmt "\n", ##args); fflush(stdout); } while (0);

QtObjectFormatter::QtObjectFormatter()
{
}

void QtObjectFormatter::traverseWord(const QVariant &value, QString &out) const
{
    switch (value.type()) {
        case QVariant::Map:
            {
                const QVariantMap object = value.value<QVariantMap>();
                QMapIterator<QString, QVariant> it(object);
                while(it.hasNext()) {
                    it.next();
                    //definitions: [ pofs, text, source ]
                    if(it.key() != "definitions"){
                    	out += it.key();
                    	out += ": ";
                    }
                    traverseWord(it.value(), out);
                    out += "\n";
                }
            }
            break;
        case QVariant::List:
            {
                const QVariantList list = value.value<QVariantList>();
                QListIterator<QVariant> it(list);
                while(it.hasNext()) {
                    QVariant value = it.next();
                    traverseWord(value, out);
                }
                out += "~\n";
            }
            break;
        case QVariant::String:
            {
                out += value.toString();
                out += "|";
            }
            break;
        default:
            if (value.canConvert< QList<QVariantMap> >())
            {
                const QList<QVariantMap> list = value.value< QList<QVariantMap> >();
                QListIterator<QVariantMap> it(list);
                while(it.hasNext()) {
                    QVariant value = it.next();
                    traverseWord(value, out);
                }
                break;
            }
            qWarning() << "Unsupported property type: " << value.typeName();
            break;
    }
}


void QtObjectFormatter::traverseList(const QVariant &value, QString &out) const
{
    switch (value.type()) {
        case QVariant::Map:
            {
                const QVariantMap object = value.value<QVariantMap>();
                QMapIterator<QString, QVariant> it(object);
                while(it.hasNext()) {
                    it.next();
                    traverseList(it.value(), out);
                }
            }
            break;
        case QVariant::List:
            {
                const QVariantList list = value.value<QVariantList>();
                QListIterator<QVariant> it(list);
                while(it.hasNext()) {
                    QVariant value = it.next();
                    traverseList(value, out);
                }
            }
            break;
        case QVariant::String:
            {
                out += value.toString();
                out += ",";
            }
            break;
        default:
            if (value.canConvert< QList<QVariantMap> >())
            {
                const QList<QVariantMap> list = value.value< QList<QVariantMap> >();
                QListIterator<QVariantMap> it(list);
                while(it.hasNext()) {
                    QVariant value = it.next();
                    traverseList(value, out);
                }
                out += ",";
                break;
            }
            qWarning() << "Unsupported property type: " << value.typeName();
            break;
    }
}


QString QtObjectFormatter::wordList(const QVariant &value) const
{
    QString out;
    out.reserve(200);
    traverseList(value, out);
    return out;
}

QString QtObjectFormatter::wordOfTheDay(const QVariant &value) const
{
    QString out;
    out.reserve(200);
    //LOG("Made it: Before traverseWord");
    traverseWord(value, out);
    //LOG("Made it: Before splitter");
    splitter(out);
    return out;
}

void QtObjectFormatter::splitter(QString &out) const
{
	//LOG("Splitter1: %s", out.toStdString().c_str() );
	QStringList tmpSplit = out.split("~");

	//partOfSpeech and definition
	QStringList tmpList = tmpSplit[0].split("|");
	//LOG("Splitter2Before: %s", tmpList[0].toStdString().c_str());


	QString partOfSpeech;
	QString definition;
	QString word;
	 for (QStringList::iterator it = tmpList.begin(); it != tmpList.end(); ++it)
	 {
		QString tmpString = *it;
		if(tmpString.contains("partOfSpeech:", Qt::CaseInsensitive)){
			QStringList tmp = tmpString.trimmed().split(":");
			partOfSpeech = tmp[1];
			//LOG("partOfSpeech: %s", tmp[1].toStdString().c_str());
			break;
		}
	}

	 for (QStringList::iterator it = tmpList.begin(); it != tmpList.end(); ++it)
	 {
		QString tmpString = *it;
		if(tmpString.contains("text:", Qt::CaseInsensitive)){
			QStringList tmp = tmpString.trimmed().split(":");
			definition = tmp[1];
			//LOG("definition: %s",  tmp[1].toStdString().c_str());
			break;
		}
	}

	QStringList tmpWord = tmpSplit[2].split("|");
	//LOG("Splitter3Before: %s", tmpSplit[2].toStdString().c_str());
	for (QStringList::iterator it = tmpWord.begin(); it != tmpWord.end(); ++it)
	{
		QString tmpString = *it;
		if(tmpString.contains("word:", Qt::CaseInsensitive)){
			QStringList tmp = tmpString.split(":");
			word = tmp[1];
			//LOG("word: %s", tmp[1].toStdString().c_str());
			break;
		}
	}

	 out = word + "|" + definition + "|" + partOfSpeech;
	 //LOG("%s",out.toStdString().c_str());

}
