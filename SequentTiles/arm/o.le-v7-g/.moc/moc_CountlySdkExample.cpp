/****************************************************************************
** Meta object code from reading C++ file 'CountlySdkExample.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/CountlySdkExample.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CountlySdkExample.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CountlySdkExample[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      31,   19,   18,   18, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_CountlySdkExample[] = {
    "CountlySdkExample\0\0key,segment\0"
    "eventFromCpp(QString,QString)\0"
};

void CountlySdkExample::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CountlySdkExample *_t = static_cast<CountlySdkExample *>(_o);
        switch (_id) {
        case 0: _t->eventFromCpp((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CountlySdkExample::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CountlySdkExample::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CountlySdkExample,
      qt_meta_data_CountlySdkExample, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CountlySdkExample::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CountlySdkExample::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CountlySdkExample::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CountlySdkExample))
        return static_cast<void*>(const_cast< CountlySdkExample*>(this));
    return QObject::qt_metacast(_clname);
}

int CountlySdkExample::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
