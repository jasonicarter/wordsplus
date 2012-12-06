/****************************************************************************
** Meta object code from reading C++ file 'RegistrationHandler.hpp'
**
** Created: Wed Dec 5 22:52:03 2012
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/RegistrationHandler.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'RegistrationHandler.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_RegistrationHandler[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      21,   20,   20,   20, 0x0a,
      41,   35,   20,   20, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_RegistrationHandler[] = {
    "RegistrationHandler\0\0appRegister()\0"
    "state\0"
    "registrationStatus(bb::platform::bbm::RegistrationState::Type)\0"
};

void RegistrationHandler::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        RegistrationHandler *_t = static_cast<RegistrationHandler *>(_o);
        switch (_id) {
        case 0: _t->appRegister(); break;
        case 1: _t->registrationStatus((*reinterpret_cast< bb::platform::bbm::RegistrationState::Type(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData RegistrationHandler::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RegistrationHandler::staticMetaObject = {
    { &bb::cascades::Page::staticMetaObject, qt_meta_stringdata_RegistrationHandler,
      qt_meta_data_RegistrationHandler, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RegistrationHandler::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RegistrationHandler::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RegistrationHandler::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RegistrationHandler))
        return static_cast<void*>(const_cast< RegistrationHandler*>(this));
    typedef bb::cascades::Page QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int RegistrationHandler::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef bb::cascades::Page QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
