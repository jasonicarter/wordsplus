/****************************************************************************
** Meta object code from reading C++ file 'WordsPlus.hpp'
**
** Created: Sat Nov 17 22:27:23 2012
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/WordsPlus.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'WordsPlus.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_WordsPlus[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      24,   14, // methods
      12,  134, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      12,       // signalCount

 // signals: signature, parameters, type, tag, flags
      11,   10,   10,   10, 0x05,
      36,   10,   10,   10, 0x05,
      64,   10,   10,   10, 0x05,
      78,   10,   10,   10, 0x05,
     103,   10,   10,   10, 0x05,
     118,   10,   10,   10, 0x05,
     133,   10,   10,   10, 0x05,
     153,   10,   10,   10, 0x05,
     182,   10,   10,   10, 0x05,
     197,   10,   10,   10, 0x05,
     218,   10,   10,   10, 0x05,
     243,   10,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
     269,  263,   10,   10, 0x08,
     308,   10,   10,   10, 0x08,
     317,   10,   10,   10, 0x08,
     331,   10,   10,   10, 0x08,

 // methods: signature, parameters, type, tag, flags
     346,   10,   10,   10, 0x02,
     366,   10,   10,   10, 0x02,
     387,   10,   10,   10, 0x02,
     410,   10,   10,   10, 0x02,
     423,   10,   10,   10, 0x02,
     435,   10,   10,   10, 0x02,
     454,  448,   10,   10, 0x02,
     478,  474,   10,   10, 0x02,

 // properties: name, type, flags
     505,  497, 0x0a495103,
     514,  497, 0x0a495103,
     526,  497, 0x0a495001,
     531,  497, 0x0a495001,
     552,  547, 0x01495003,
     560,  547, 0x01495003,
     568,  547, 0x01495003,
     581,  497, 0x0a495001,
     605,  601, 0x02495103,
     611,  601, 0x02495001,
     623,  497, 0x0a495103,
     639,  601, 0x02495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,
       8,
       9,
      10,
      11,

       0        // eod
};

static const char qt_meta_stringdata_WordsPlus[] = {
    "WordsPlus\0\0categoryChanged(QString)\0"
    "puzzleWordsChanged(QString)\0timeChanged()\0"
    "totalWordsFoundChanged()\0soundChanged()\0"
    "musicChanged()\0profileBoxChanged()\0"
    "puzzleCompletedTimeChanged()\0"
    "scoreChanged()\0gamesPlayedChanged()\0"
    "selectedLettersChanged()\0difficultyChanged()\0"
    "event\0onTileTouch(bb::cascades::TouchEvent*)\0"
    "onTick()\0onThumbnail()\0onFullscreen()\0"
    "intializePlayArea()\0InitializeHomePage()\0"
    "InitializePuzzlePage()\0startTimer()\0"
    "stopTimer()\0resetTimer()\0state\0"
    "ControlsForBBM(int)\0msg\0playSound(QString)\0"
    "QString\0category\0puzzleWords\0time\0"
    "totalWordsFound\0bool\0soundOn\0musicOn\0"
    "profileBoxOn\0puzzleCompletedTime\0int\0"
    "score\0gamesPlayed\0selectedLetters\0"
    "difficulty\0"
};

void WordsPlus::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        WordsPlus *_t = static_cast<WordsPlus *>(_o);
        switch (_id) {
        case 0: _t->categoryChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->puzzleWordsChanged((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->timeChanged(); break;
        case 3: _t->totalWordsFoundChanged(); break;
        case 4: _t->soundChanged(); break;
        case 5: _t->musicChanged(); break;
        case 6: _t->profileBoxChanged(); break;
        case 7: _t->puzzleCompletedTimeChanged(); break;
        case 8: _t->scoreChanged(); break;
        case 9: _t->gamesPlayedChanged(); break;
        case 10: _t->selectedLettersChanged(); break;
        case 11: _t->difficultyChanged(); break;
        case 12: _t->onTileTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        case 13: _t->onTick(); break;
        case 14: _t->onThumbnail(); break;
        case 15: _t->onFullscreen(); break;
        case 16: _t->intializePlayArea(); break;
        case 17: _t->InitializeHomePage(); break;
        case 18: _t->InitializePuzzlePage(); break;
        case 19: _t->startTimer(); break;
        case 20: _t->stopTimer(); break;
        case 21: _t->resetTimer(); break;
        case 22: _t->ControlsForBBM((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 23: _t->playSound((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData WordsPlus::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WordsPlus::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_WordsPlus,
      qt_meta_data_WordsPlus, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WordsPlus::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WordsPlus::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WordsPlus::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WordsPlus))
        return static_cast<void*>(const_cast< WordsPlus*>(this));
    return QObject::qt_metacast(_clname);
}

int WordsPlus::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 24)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 24;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getCategory(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getPuzzleWords(); break;
        case 2: *reinterpret_cast< QString*>(_v) = getTime(); break;
        case 3: *reinterpret_cast< QString*>(_v) = getTotalWordsFound(); break;
        case 4: *reinterpret_cast< bool*>(_v) = getSound(); break;
        case 5: *reinterpret_cast< bool*>(_v) = getMusic(); break;
        case 6: *reinterpret_cast< bool*>(_v) = getProfileBox(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getPuzzleCompletedTime(); break;
        case 8: *reinterpret_cast< int*>(_v) = getScore(); break;
        case 9: *reinterpret_cast< int*>(_v) = getGamesPlayed(); break;
        case 10: *reinterpret_cast< QString*>(_v) = getSelectedLetters(); break;
        case 11: *reinterpret_cast< int*>(_v) = getDifficulty(); break;
        }
        _id -= 12;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setCategory(*reinterpret_cast< QString*>(_v)); break;
        case 1: setPuzzleWords(*reinterpret_cast< QString*>(_v)); break;
        case 4: setSound(*reinterpret_cast< bool*>(_v)); break;
        case 5: setMusic(*reinterpret_cast< bool*>(_v)); break;
        case 6: setProfileBox(*reinterpret_cast< bool*>(_v)); break;
        case 8: setScore(*reinterpret_cast< int*>(_v)); break;
        case 10: setSelectedLetters(*reinterpret_cast< QString*>(_v)); break;
        case 11: setDifficulty(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 12;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 12;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 12;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void WordsPlus::categoryChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void WordsPlus::puzzleWordsChanged(const QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void WordsPlus::timeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void WordsPlus::totalWordsFoundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void WordsPlus::soundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void WordsPlus::musicChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void WordsPlus::profileBoxChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void WordsPlus::puzzleCompletedTimeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}

// SIGNAL 8
void WordsPlus::scoreChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, 0);
}

// SIGNAL 9
void WordsPlus::gamesPlayedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, 0);
}

// SIGNAL 10
void WordsPlus::selectedLettersChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, 0);
}

// SIGNAL 11
void WordsPlus::difficultyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, 0);
}
QT_END_MOC_NAMESPACE