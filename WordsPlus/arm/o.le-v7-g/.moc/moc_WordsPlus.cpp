/****************************************************************************
** Meta object code from reading C++ file 'WordsPlus.hpp'
**
** Created: Fri Nov 2 23:50:33 2012
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
      11,   14, // methods
       5,   69, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: signature, parameters, type, tag, flags
      11,   10,   10,   10, 0x05,
      36,   10,   10,   10, 0x05,
      64,   10,   10,   10, 0x05,
      78,   10,   10,   10, 0x05,
     103,   10,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
     124,  118,   10,   10, 0x08,
     163,   10,   10,   10, 0x08,

 // methods: signature, parameters, type, tag, flags
     172,   10,   10,   10, 0x02,
     192,   10,   10,   10, 0x02,
     205,   10,   10,   10, 0x02,
     217,   10,   10,   10, 0x02,

 // properties: name, type, flags
     238,  230, 0x0a495103,
     247,  230, 0x0a495103,
     259,  230, 0x0a495001,
     264,  230, 0x0a495001,
     285,  280, 0x01495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,

       0        // eod
};

static const char qt_meta_stringdata_WordsPlus[] = {
    "WordsPlus\0\0categoryChanged(QString)\0"
    "puzzleWordsChanged(QString)\0timeChanged()\0"
    "totalWordsFoundChanged()\0soundChanged()\0"
    "event\0onTileTouch(bb::cascades::TouchEvent*)\0"
    "onTick()\0intializePlayArea()\0startTimer()\0"
    "stopTimer()\0resetTimer()\0QString\0"
    "category\0puzzleWords\0time\0totalWordsFound\0"
    "bool\0sound\0"
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
        case 5: _t->onTileTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        case 6: _t->onTick(); break;
        case 7: _t->intializePlayArea(); break;
        case 8: _t->startTimer(); break;
        case 9: _t->stopTimer(); break;
        case 10: _t->resetTimer(); break;
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
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
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
        }
        _id -= 5;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setCategory(*reinterpret_cast< QString*>(_v)); break;
        case 1: setPuzzleWords(*reinterpret_cast< QString*>(_v)); break;
        case 4: setSound(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 5;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
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
QT_END_MOC_NAMESPACE
