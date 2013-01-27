/****************************************************************************
** Meta object code from reading C++ file 'LocationDiagnostics.hpp'
**
** Created: Wed Jan 16 20:49:31 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/LocationDiagnostics.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'LocationDiagnostics.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_LocationDiagnostics[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       9,   69, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       9,       // signalCount

 // signals: signature, parameters, type, tag, flags
      21,   20,   20,   20, 0x05,
      45,   20,   20,   20, 0x05,
      69,   20,   20,   20, 0x05,
      85,   20,   20,   20, 0x05,
     101,   20,   20,   20, 0x05,
     116,   20,   20,   20, 0x05,
     134,   20,   20,   20, 0x05,
     153,   20,   20,   20, 0x05,
     171,   20,   20,   20, 0x05,

 // slots: signature, parameters, type, tag, flags
     195,   20,   20,   20, 0x08,

 // methods: signature, parameters, type, tag, flags
     240,  227,  210,   20, 0x02,

 // properties: name, type, flags
     276,  268, 0x0a495103,
     291,  268, 0x0a495103,
     306,  268, 0x0a495103,
     313,  268, 0x0a495103,
     320,  268, 0x0a495103,
     326,  268, 0x0a495103,
     339,  335, 0x02495103,
     354,  349, 0x01495103,
     363,  349, 0x01495103,

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

       0        // eod
};

static const char qt_meta_stringdata_LocationDiagnostics[] = {
    "LocationDiagnostics\0\0positionMethodChanged()\0"
    "assistanceModeChanged()\0pdeUrlChanged()\0"
    "slpUrlChanged()\0appIdChanged()\0"
    "passwordChanged()\0frequencyChanged()\0"
    "useSoundChanged()\0backgroundModeChanged()\0"
    "onManualExit()\0LocationSession*\0"
    "trackingMode\0createLocationSession(bool)\0"
    "QString\0positionMethod\0assistanceMode\0"
    "pdeUrl\0slpUrl\0appId\0password\0int\0"
    "frequency\0bool\0useSound\0backgroundMode\0"
};

void LocationDiagnostics::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LocationDiagnostics *_t = static_cast<LocationDiagnostics *>(_o);
        switch (_id) {
        case 0: _t->positionMethodChanged(); break;
        case 1: _t->assistanceModeChanged(); break;
        case 2: _t->pdeUrlChanged(); break;
        case 3: _t->slpUrlChanged(); break;
        case 4: _t->appIdChanged(); break;
        case 5: _t->passwordChanged(); break;
        case 6: _t->frequencyChanged(); break;
        case 7: _t->useSoundChanged(); break;
        case 8: _t->backgroundModeChanged(); break;
        case 9: _t->onManualExit(); break;
        case 10: { LocationSession* _r = _t->createLocationSession((*reinterpret_cast< bool(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< LocationSession**>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObjectExtraData LocationDiagnostics::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LocationDiagnostics::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_LocationDiagnostics,
      qt_meta_data_LocationDiagnostics, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LocationDiagnostics::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LocationDiagnostics::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LocationDiagnostics::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LocationDiagnostics))
        return static_cast<void*>(const_cast< LocationDiagnostics*>(this));
    return QObject::qt_metacast(_clname);
}

int LocationDiagnostics::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        case 0: *reinterpret_cast< QString*>(_v) = positionMethod(); break;
        case 1: *reinterpret_cast< QString*>(_v) = assistanceMode(); break;
        case 2: *reinterpret_cast< QString*>(_v) = pdeUrl(); break;
        case 3: *reinterpret_cast< QString*>(_v) = slpUrl(); break;
        case 4: *reinterpret_cast< QString*>(_v) = appId(); break;
        case 5: *reinterpret_cast< QString*>(_v) = password(); break;
        case 6: *reinterpret_cast< int*>(_v) = frequency(); break;
        case 7: *reinterpret_cast< bool*>(_v) = useSound(); break;
        case 8: *reinterpret_cast< bool*>(_v) = backgroundMode(); break;
        }
        _id -= 9;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setPositionMethod(*reinterpret_cast< QString*>(_v)); break;
        case 1: setAssistanceMode(*reinterpret_cast< QString*>(_v)); break;
        case 2: setPdeUrl(*reinterpret_cast< QString*>(_v)); break;
        case 3: setSlpUrl(*reinterpret_cast< QString*>(_v)); break;
        case 4: setAppId(*reinterpret_cast< QString*>(_v)); break;
        case 5: setPassword(*reinterpret_cast< QString*>(_v)); break;
        case 6: setFrequency(*reinterpret_cast< int*>(_v)); break;
        case 7: setUseSound(*reinterpret_cast< bool*>(_v)); break;
        case 8: setBackgroundMode(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 9;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 9;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void LocationDiagnostics::positionMethodChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void LocationDiagnostics::assistanceModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void LocationDiagnostics::pdeUrlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void LocationDiagnostics::slpUrlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void LocationDiagnostics::appIdChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void LocationDiagnostics::passwordChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void LocationDiagnostics::frequencyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void LocationDiagnostics::useSoundChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}

// SIGNAL 8
void LocationDiagnostics::backgroundModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, 0);
}
QT_END_MOC_NAMESPACE
