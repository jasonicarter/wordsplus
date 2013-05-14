/****************************************************************************
** Meta object code from reading C++ file 'applicationui.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/applicationui.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationui.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      47,   14, // methods
      15,  249, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      19,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,
      51,   38,   14,   14, 0x05,
      79,   14,   14,   14, 0x05,
      97,   14,   14,   14, 0x05,
     112,   14,   14,   14, 0x05,
     137,   14,   14,   14, 0x05,
     165,   14,   14,   14, 0x05,
     179,   14,   14,   14, 0x05,
     204,   14,   14,   14, 0x05,
     219,   14,   14,   14, 0x05,
     234,   14,   14,   14, 0x05,
     254,   14,   14,   14, 0x05,
     283,   14,   14,   14, 0x05,
     307,   14,   14,   14, 0x05,
     322,   14,   14,   14, 0x05,
     343,   14,   14,   14, 0x05,
     368,   14,   14,   14, 0x05,
     388,   14,   14,   14, 0x05,
     411,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
     436,   14,   14,   14, 0x0a,
     448,  443,   14,   14, 0x0a,
     486,  476,   14,   14, 0x0a,
     523,   14,   14,   14, 0x0a,
     552,  546,   14,   14, 0x08,
     591,   14,   14,   14, 0x08,
     600,   14,   14,   14, 0x08,
     614,   14,   14,   14, 0x08,
     629,  443,   14,   14, 0x08,
     670,   14,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     688,   14,   14,   14, 0x02,
     708,   14,   14,   14, 0x02,
     729,   14,   14,   14, 0x02,
     758,  752,   14,   14, 0x02,
     792,  775,   14,   14, 0x02,
     814,   14,   14,   14, 0x02,
     847,   14,   14,   14, 0x02,
     875,   14,   14,   14, 0x02,
     917,   14,  900,   14, 0x02,
     929,   14,   14,   14, 0x02,
     942,   14,   14,   14, 0x02,
     954,   14,   14,   14, 0x02,
     973,  967,   14,   14, 0x02,
     997,  993,   14,   14, 0x02,
    1016,   14,   14,   14, 0x02,
    1044, 1033,   14,   14, 0x02,
    1080, 1075,   14,   14, 0x02,
    1106, 1075,   14,   14, 0x02,

 // properties: name, type, flags
    1135, 1127, 0x0a495103,
    1141, 1127, 0x0a495103,
    1150, 1127, 0x0a495001,
    1155, 1127, 0x0a495001,
    1176, 1171, 0x01495003,
    1184, 1171, 0x01495003,
    1192, 1171, 0x01495003,
    1205, 1127, 0x0a495001,
    1225, 1127, 0x0a495001,
     752, 1240, 0x02495103,
    1244, 1240, 0x02495001,
    1256, 1127, 0x0a495103,
    1272, 1240, 0x02495103,
    1283, 1240, 0x02495001,
    1297, 1171, 0x01495103,

 // properties: notify_signal_id
       3,
       4,
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
      17,
      18,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0submitScoreCompleted()\0"
    "toastMessage\0mainSysToastSignal(QString)\0"
    "puzzleCompleted()\0themeChanged()\0"
    "categoryChanged(QString)\0"
    "puzzleWordsChanged(QString)\0timeChanged()\0"
    "totalWordsFoundChanged()\0soundChanged()\0"
    "musicChanged()\0profileBoxChanged()\0"
    "puzzleCompletedTimeChanged()\0"
    "lastPuzzleTimeChanged()\0scoreChanged()\0"
    "gamesPlayedChanged()\0selectedLettersChanged()\0"
    "difficultyChanged()\0achievedAwardChanged()\0"
    "isFirstTimeUserChanged()\0show()\0data\0"
    "scoreLoopLoaded(AppData_t*)\0scoreData\0"
    "onSubmitScoreCompleted(ScoreData_t*)\0"
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
    "msg\0playSound(QString)\0invokeFacebook()\0"
    "name,level\0cntlyCategory(QString,QString)\0"
    "name\0cntlyMenuOptions(QString)\0"
    "cntlySocial(QString)\0QString\0theme\0"
    "category\0time\0totalWordsFound\0bool\0"
    "soundOn\0musicOn\0profileBoxOn\0"
    "puzzleCompletedTime\0lastPuzzleTime\0"
    "int\0gamesPlayed\0selectedLetters\0"
    "difficulty\0achievedAward\0isFirstTimeUser\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->submitScoreCompleted(); break;
        case 1: _t->mainSysToastSignal((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->puzzleCompleted(); break;
        case 3: _t->themeChanged(); break;
        case 4: _t->categoryChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->puzzleWordsChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->timeChanged(); break;
        case 7: _t->totalWordsFoundChanged(); break;
        case 8: _t->soundChanged(); break;
        case 9: _t->musicChanged(); break;
        case 10: _t->profileBoxChanged(); break;
        case 11: _t->puzzleCompletedTimeChanged(); break;
        case 12: _t->lastPuzzleTimeChanged(); break;
        case 13: _t->scoreChanged(); break;
        case 14: _t->gamesPlayedChanged(); break;
        case 15: _t->selectedLettersChanged(); break;
        case 16: _t->difficultyChanged(); break;
        case 17: _t->achievedAwardChanged(); break;
        case 18: _t->isFirstTimeUserChanged(); break;
        case 19: _t->show(); break;
        case 20: _t->scoreLoopLoaded((*reinterpret_cast< AppData_t*(*)>(_a[1]))); break;
        case 21: _t->onSubmitScoreCompleted((*reinterpret_cast< ScoreData_t*(*)>(_a[1]))); break;
        case 22: _t->onOrientationChanged(); break;
        case 23: _t->onTileTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        case 24: _t->onTick(); break;
        case 25: _t->onThumbnail(); break;
        case 26: _t->onFullscreen(); break;
        case 27: _t->onLoadLeaderboardCompleted((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 28: _t->onAchievedAward(); break;
        case 29: _t->intializePlayArea(); break;
        case 30: _t->InitializeHomePage(); break;
        case 31: _t->InitializePuzzlePage(); break;
        case 32: _t->submitScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 33: _t->loadLeaderboard((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 34: _t->loadLeaderboardAroundLastScore(); break;
        case 35: _t->loadLeaderboardAroundUser(); break;
        case 36: _t->LoadAchievementsAwards(); break;
        case 37: { ScoreLoopThread* _r = _t->scoreLoop();
            if (_a[0]) *reinterpret_cast< ScoreLoopThread**>(_a[0]) = _r; }  break;
        case 38: _t->startTimer(); break;
        case 39: _t->stopTimer(); break;
        case 40: _t->resetTimer(); break;
        case 41: _t->ControlsForBBM((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 42: _t->playSound((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 43: _t->invokeFacebook(); break;
        case 44: _t->cntlyCategory((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 45: _t->cntlyMenuOptions((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 46: _t->cntlySocial((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ApplicationUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ApplicationUI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationUI,
      qt_meta_data_ApplicationUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationUI))
        return static_cast<void*>(const_cast< ApplicationUI*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 47)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 47;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getTheme(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getCategory(); break;
        case 2: *reinterpret_cast< QString*>(_v) = getTime(); break;
        case 3: *reinterpret_cast< QString*>(_v) = getTotalWordsFound(); break;
        case 4: *reinterpret_cast< bool*>(_v) = getSound(); break;
        case 5: *reinterpret_cast< bool*>(_v) = getMusic(); break;
        case 6: *reinterpret_cast< bool*>(_v) = getProfileBox(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getPuzzleCompletedTime(); break;
        case 8: *reinterpret_cast< QString*>(_v) = getLastPuzzleTime(); break;
        case 9: *reinterpret_cast< int*>(_v) = getScore(); break;
        case 10: *reinterpret_cast< int*>(_v) = getGamesPlayed(); break;
        case 11: *reinterpret_cast< QString*>(_v) = getSelectedLetters(); break;
        case 12: *reinterpret_cast< int*>(_v) = getDifficulty(); break;
        case 13: *reinterpret_cast< int*>(_v) = getAchievedAward(); break;
        case 14: *reinterpret_cast< bool*>(_v) = getIsFirstTimeUser(); break;
        }
        _id -= 15;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setTheme(*reinterpret_cast< QString*>(_v)); break;
        case 1: setCategory(*reinterpret_cast< QString*>(_v)); break;
        case 4: setSound(*reinterpret_cast< bool*>(_v)); break;
        case 5: setMusic(*reinterpret_cast< bool*>(_v)); break;
        case 6: setProfileBox(*reinterpret_cast< bool*>(_v)); break;
        case 9: setScore(*reinterpret_cast< int*>(_v)); break;
        case 11: setSelectedLetters(*reinterpret_cast< QString*>(_v)); break;
        case 12: setDifficulty(*reinterpret_cast< int*>(_v)); break;
        case 14: setIsFirstTimeUser(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 15;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 15;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ApplicationUI::submitScoreCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void ApplicationUI::mainSysToastSignal(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ApplicationUI::puzzleCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void ApplicationUI::themeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void ApplicationUI::categoryChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ApplicationUI::puzzleWordsChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void ApplicationUI::timeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void ApplicationUI::totalWordsFoundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}

// SIGNAL 8
void ApplicationUI::soundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, 0);
}

// SIGNAL 9
void ApplicationUI::musicChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, 0);
}

// SIGNAL 10
void ApplicationUI::profileBoxChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, 0);
}

// SIGNAL 11
void ApplicationUI::puzzleCompletedTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, 0);
}

// SIGNAL 12
void ApplicationUI::lastPuzzleTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, 0);
}

// SIGNAL 13
void ApplicationUI::scoreChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, 0);
}

// SIGNAL 14
void ApplicationUI::gamesPlayedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, 0);
}

// SIGNAL 15
void ApplicationUI::selectedLettersChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 15, 0);
}

// SIGNAL 16
void ApplicationUI::difficultyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 16, 0);
}

// SIGNAL 17
void ApplicationUI::achievedAwardChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 17, 0);
}

// SIGNAL 18
void ApplicationUI::isFirstTimeUserChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 18, 0);
}
QT_END_MOC_NAMESPACE
