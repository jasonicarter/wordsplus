/****************************************************************************
** Meta object code from reading C++ file 'WordsPlusGame.hpp'
**
** Created: Sat Jan 26 20:30:10 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/WordsPlusGame.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'WordsPlusGame.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_WordsPlusGame[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      41,   14, // methods
      13,  219, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      17,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,
      51,   38,   14,   14, 0x05,
      79,   14,   14,   14, 0x05,
      97,   14,   14,   14, 0x05,
     122,   14,   14,   14, 0x05,
     150,   14,   14,   14, 0x05,
     164,   14,   14,   14, 0x05,
     189,   14,   14,   14, 0x05,
     204,   14,   14,   14, 0x05,
     219,   14,   14,   14, 0x05,
     239,   14,   14,   14, 0x05,
     268,   14,   14,   14, 0x05,
     292,   14,   14,   14, 0x05,
     307,   14,   14,   14, 0x05,
     328,   14,   14,   14, 0x05,
     353,   14,   14,   14, 0x05,
     373,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
     396,   14,   14,   14, 0x0a,
     408,  403,   14,   14, 0x0a,
     446,  436,   14,   14, 0x0a,
     483,   14,   14,   14, 0x0a,
     512,  506,   14,   14, 0x08,
     551,   14,   14,   14, 0x08,
     560,   14,   14,   14, 0x08,
     574,   14,   14,   14, 0x08,
     589,  403,   14,   14, 0x08,
     630,   14,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     648,   14,   14,   14, 0x02,
     668,   14,   14,   14, 0x02,
     689,   14,   14,   14, 0x02,
     718,  712,   14,   14, 0x02,
     752,  735,   14,   14, 0x02,
     774,   14,   14,   14, 0x02,
     807,   14,   14,   14, 0x02,
     835,   14,   14,   14, 0x02,
     877,   14,  860,   14, 0x02,
     889,   14,   14,   14, 0x02,
     902,   14,   14,   14, 0x02,
     914,   14,   14,   14, 0x02,
     933,  927,   14,   14, 0x02,
     957,  953,   14,   14, 0x02,

 // properties: name, type, flags
     984,  976, 0x0a495103,
     993,  976, 0x0a495001,
     998,  976, 0x0a495001,
    1019, 1014, 0x01495003,
    1027, 1014, 0x01495003,
    1035, 1014, 0x01495003,
    1048,  976, 0x0a495001,
    1068,  976, 0x0a495001,
     712, 1083, 0x02495103,
    1087, 1083, 0x02495001,
    1099,  976, 0x0a495103,
    1115, 1083, 0x02495103,
    1126, 1083, 0x02495001,

 // properties: notify_signal_id
       3,
       5,
       6,
       7,
       8,
       9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,

       0        // eod
};

static const char qt_meta_stringdata_WordsPlusGame[] = {
    "WordsPlusGame\0\0submitScoreCompleted()\0"
    "toastMessage\0mainSysToastSignal(QString)\0"
    "puzzleCompleted()\0categoryChanged(QString)\0"
    "puzzleWordsChanged(QString)\0timeChanged()\0"
    "totalWordsFoundChanged()\0soundChanged()\0"
    "musicChanged()\0profileBoxChanged()\0"
    "puzzleCompletedTimeChanged()\0"
    "lastPuzzleTimeChanged()\0scoreChanged()\0"
    "gamesPlayedChanged()\0selectedLettersChanged()\0"
    "difficultyChanged()\0achievedAwardChanged()\0"
    "show()\0data\0scoreLoopLoaded(AppData_t*)\0"
    "scoreData\0onSubmitScoreCompleted(ScoreData_t*)\0"
    "onOrientationChanged()\0event\0"
    "onTileTouch(bb::cascades::TouchEvent*)\0"
    "onTick()\0onThumbnail()\0onFullscreen()\0"
    "onLoadLeaderboardCompleted(QVariantList)\0"
    "onAchievedAward()\0intializePlayArea()\0"
    "InitializeHomePage()\0InitializePuzzlePage()\0"
    "score\0submitScore(int)\0includeBuddyList\0"
    "loadLeaderboard(bool)\0"
    "loadLeaderboardAroundLastScore()\0"
    "loadLeaderboardAroundUser()\0"
    "LoadAchievementsAwards()\0ScoreLoopThread*\0"
    "scoreLoop()\0startTimer()\0stopTimer()\0"
    "resetTimer()\0state\0ControlsForBBM(int)\0"
    "msg\0playSound(QString)\0QString\0category\0"
    "time\0totalWordsFound\0bool\0soundOn\0"
    "musicOn\0profileBoxOn\0puzzleCompletedTime\0"
    "lastPuzzleTime\0int\0gamesPlayed\0"
    "selectedLetters\0difficulty\0achievedAward\0"
};

void WordsPlusGame::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        WordsPlusGame *_t = static_cast<WordsPlusGame *>(_o);
        switch (_id) {
        case 0: _t->submitScoreCompleted(); break;
        case 1: _t->mainSysToastSignal((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->puzzleCompleted(); break;
        case 3: _t->categoryChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->puzzleWordsChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->timeChanged(); break;
        case 6: _t->totalWordsFoundChanged(); break;
        case 7: _t->soundChanged(); break;
        case 8: _t->musicChanged(); break;
        case 9: _t->profileBoxChanged(); break;
        case 10: _t->puzzleCompletedTimeChanged(); break;
        case 11: _t->lastPuzzleTimeChanged(); break;
        case 12: _t->scoreChanged(); break;
        case 13: _t->gamesPlayedChanged(); break;
        case 14: _t->selectedLettersChanged(); break;
        case 15: _t->difficultyChanged(); break;
        case 16: _t->achievedAwardChanged(); break;
        case 17: _t->show(); break;
        case 18: _t->scoreLoopLoaded((*reinterpret_cast< AppData_t*(*)>(_a[1]))); break;
        case 19: _t->onSubmitScoreCompleted((*reinterpret_cast< ScoreData_t*(*)>(_a[1]))); break;
        case 20: _t->onOrientationChanged(); break;
        case 21: _t->onTileTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        case 22: _t->onTick(); break;
        case 23: _t->onThumbnail(); break;
        case 24: _t->onFullscreen(); break;
        case 25: _t->onLoadLeaderboardCompleted((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 26: _t->onAchievedAward(); break;
        case 27: _t->intializePlayArea(); break;
        case 28: _t->InitializeHomePage(); break;
        case 29: _t->InitializePuzzlePage(); break;
        case 30: _t->submitScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 31: _t->loadLeaderboard((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 32: _t->loadLeaderboardAroundLastScore(); break;
        case 33: _t->loadLeaderboardAroundUser(); break;
        case 34: _t->LoadAchievementsAwards(); break;
        case 35: { ScoreLoopThread* _r = _t->scoreLoop();
            if (_a[0]) *reinterpret_cast< ScoreLoopThread**>(_a[0]) = _r; }  break;
        case 36: _t->startTimer(); break;
        case 37: _t->stopTimer(); break;
        case 38: _t->resetTimer(); break;
        case 39: _t->ControlsForBBM((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 40: _t->playSound((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData WordsPlusGame::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WordsPlusGame::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_WordsPlusGame,
      qt_meta_data_WordsPlusGame, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WordsPlusGame::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WordsPlusGame::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WordsPlusGame::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WordsPlusGame))
        return static_cast<void*>(const_cast< WordsPlusGame*>(this));
    return QObject::qt_metacast(_clname);
}

int WordsPlusGame::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 41)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 41;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getCategory(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getTime(); break;
        case 2: *reinterpret_cast< QString*>(_v) = getTotalWordsFound(); break;
        case 3: *reinterpret_cast< bool*>(_v) = getSound(); break;
        case 4: *reinterpret_cast< bool*>(_v) = getMusic(); break;
        case 5: *reinterpret_cast< bool*>(_v) = getProfileBox(); break;
        case 6: *reinterpret_cast< QString*>(_v) = getPuzzleCompletedTime(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getLastPuzzleTime(); break;
        case 8: *reinterpret_cast< int*>(_v) = getScore(); break;
        case 9: *reinterpret_cast< int*>(_v) = getGamesPlayed(); break;
        case 10: *reinterpret_cast< QString*>(_v) = getSelectedLetters(); break;
        case 11: *reinterpret_cast< int*>(_v) = getDifficulty(); break;
        case 12: *reinterpret_cast< int*>(_v) = getAchievedAward(); break;
        }
        _id -= 13;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setCategory(*reinterpret_cast< QString*>(_v)); break;
        case 3: setSound(*reinterpret_cast< bool*>(_v)); break;
        case 4: setMusic(*reinterpret_cast< bool*>(_v)); break;
        case 5: setProfileBox(*reinterpret_cast< bool*>(_v)); break;
        case 8: setScore(*reinterpret_cast< int*>(_v)); break;
        case 10: setSelectedLetters(*reinterpret_cast< QString*>(_v)); break;
        case 11: setDifficulty(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 13;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 13;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void WordsPlusGame::submitScoreCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void WordsPlusGame::mainSysToastSignal(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void WordsPlusGame::puzzleCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void WordsPlusGame::categoryChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void WordsPlusGame::puzzleWordsChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void WordsPlusGame::timeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void WordsPlusGame::totalWordsFoundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void WordsPlusGame::soundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}

// SIGNAL 8
void WordsPlusGame::musicChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, 0);
}

// SIGNAL 9
void WordsPlusGame::profileBoxChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, 0);
}

// SIGNAL 10
void WordsPlusGame::puzzleCompletedTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, 0);
}

// SIGNAL 11
void WordsPlusGame::lastPuzzleTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, 0);
}

// SIGNAL 12
void WordsPlusGame::scoreChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, 0);
}

// SIGNAL 13
void WordsPlusGame::gamesPlayedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, 0);
}

// SIGNAL 14
void WordsPlusGame::selectedLettersChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, 0);
}

// SIGNAL 15
void WordsPlusGame::difficultyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 15, 0);
}

// SIGNAL 16
void WordsPlusGame::achievedAwardChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 16, 0);
}
QT_END_MOC_NAMESPACE