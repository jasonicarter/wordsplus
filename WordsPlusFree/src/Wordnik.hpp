/*
 * Wordnik.hpp
 *
 *  Created on: 2013-07-07
 *      Author: Jason
 */

#ifndef WORDNIK_HPP_
#define WORDNIK_HPP_

#include <QtCore/QObject>

class QNetworkAccessManager;
//add QT += network to .pro file

class Wordnik : public QObject
{
    Q_OBJECT
public:
    Wordnik(QObject* parent = 0);
    void callWordnik(QString type);

Q_SIGNALS:
	void completedWordList(const QString &info);
	void completedWordOfTheDay(const QString &info);


private:
    QNetworkAccessManager* m_networkAccessManager;
    QString wordnikType;

private Q_SLOTS:
    void onWordReply();

};

#endif /* WORDNIK_HPP_ */
