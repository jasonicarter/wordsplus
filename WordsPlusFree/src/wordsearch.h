/*
 * wordsearch.h
 *
 *  Created on: 2012-10-14
 *      Author: Jason
 */

#ifndef WORDSEARCH_H_
#define WORDSEARCH_H_

#include <QList>
#include <QMap>

char** createNewPuzzle(char *str = "weather.txt", int difficulity = 8, bool isRandomPuzzle = false);
QList<char*> returnPuzzleWords();
QMap<QString, int> returnPuzzleIndex();
int returnNumberOfPuzzleWords();



#endif /* WORDSEARCH_H_ */
