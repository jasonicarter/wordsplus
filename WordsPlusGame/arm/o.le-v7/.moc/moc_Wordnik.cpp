/****************************************************************************
** Meta object code from reading C++ file 'Wordnik.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/Wordnik.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Wordnik.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Wordnik[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      14,    9,    8,    8, 0x05,
      41,    9,    8,    8, 0x05,

 // slots: signature, parameters, type, tag, flags
      72,    8,    8,    8, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_Wordnik[] = {
    "Wordnik\0\0info\0completedWordList(QString)\0"
    "completedWordOfTheDay(QString)\0"
    "onWordReply()\0"
};

void Wordnik::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Wordnik *_t = static_cast<Wordnik *>(_o);
        switch (_id) {
        case 0: _t->completedWordList((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->completedWordOfTheDay((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->onWordReply(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Wordnik::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Wordnik::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Wordnik,
      qt_meta_data_Wordnik, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Wordnik::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Wordnik::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Wordnik::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Wordnik))
        return static_cast<void*>(const_cast< Wordnik*>(this));
    return QObject::qt_metacast(_clname);
}

int Wordnik::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void Wordnik::completedWordList(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Wordnik::completedWordOfTheDay(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
