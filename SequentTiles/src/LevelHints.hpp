/*
 * LevelHints.hpp
 *
 *  Created on: 2013-04-28
 *      Author: Jason
 */

#ifndef LEVELHINTS_HPP_
#define LEVELHINTS_HPP_

#include <bb/cascades/Application>

class LevelHints: public QObject
{
	Q_OBJECT

public:
	LevelHints();
	~LevelHints();

	QString getHint(int level);

private:
	QHash<int,QString> levelHint;
};

#endif /* LEVELHINTS_HPP_ */
