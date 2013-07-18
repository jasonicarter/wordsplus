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
    QList<QString> getWordOfTheDay(QString date);
    QList<QString> getWordList(int size);


private:
    QNetworkAccessManager* m_networkAccessManager;

private Q_SLOTS:
    void onWordOfTheReply();
    void onWordList();

};

#endif /* WORDNIK_HPP_ */
