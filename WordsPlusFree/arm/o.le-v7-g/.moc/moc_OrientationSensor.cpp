/****************************************************************************
** Meta object code from reading C++ file 'OrientationSensor.hpp'
**
** Created: Tue Mar 5 19:28:25 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/OrientationSensor.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'OrientationSensor.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_OrientationSensor[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       1,   19, // properties
       1,   23, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      19,   18,   18,   18, 0x05,

 // properties: name, type, flags
      52,   40, 0x00495009,

 // properties: notify_signal_id
       0,

 // enums: name, flags, count, data
      40, 0x0,    7,   27,

 // enum data: key, value
      64, uint(OrientationSensor::Undefined),
      74, uint(OrientationSensor::TopUp),
      80, uint(OrientationSensor::TopDown),
      88, uint(OrientationSensor::LeftUp),
      95, uint(OrientationSensor::RightUp),
     103, uint(OrientationSensor::FaceUp),
     110, uint(OrientationSensor::FaceDown),

       0        // eod
};

static const char qt_meta_stringdata_OrientationSensor[] = {
    "OrientationSensor\0\0orientationChanged()\0"
    "Orientation\0orientation\0Undefined\0"
    "TopUp\0TopDown\0LeftUp\0RightUp\0FaceUp\0"
    "FaceDown\0"
};

void OrientationSensor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        OrientationSensor *_t = static_cast<OrientationSensor *>(_o);
        switch (_id) {
        case 0: _t->orientationChanged(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData OrientationSensor::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject OrientationSensor::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_OrientationSensor,
      qt_meta_data_OrientationSensor, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &OrientationSensor::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *OrientationSensor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *OrientationSensor::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_OrientationSensor))
        return static_cast<void*>(const_cast< OrientationSensor*>(this));
    if (!strcmp(_clname, "QOrientationFilter"))
        return static_cast< QOrientationFilter*>(const_cast< OrientationSensor*>(this));
    return QObject::qt_metacast(_clname);
}

int OrientationSensor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< Orientation*>(_v) = orientation(); break;
        }
        _id -= 1;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 1;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void OrientationSensor::orientationChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
