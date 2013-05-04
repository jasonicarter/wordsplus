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
      13,   14, // methods
       5,   79, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,
      33,   14,   14,   14, 0x05,
      52,   14,   14,   14, 0x05,
      71,   14,   14,   14, 0x05,
      90,   14,   14,   14, 0x05,
     109,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
     137,  131,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     176,   14,   14,   14, 0x02,
     188,   14,   14,   14, 0x02,
     199,   14,   14,   14, 0x02,
     210,   14,   14,   14, 0x02,
     221,   14,   14,   14, 0x02,
     228,   14,   14,   14, 0x02,

 // properties: name, type, flags
     242,  237, 0x01495103,
     251,  237, 0x01495103,
     265,  261, 0x02495103,
     275,  237, 0x01495103,
     293,  285, 0x0a495001,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0showNextChanged()\0"
    "ShowRetryChanged()\0coinCountChanged()\0"
    "hintShownChanged()\0levelHintChanged()\0"
    "gameCompletedSignal()\0event\0"
    "onTileTouch(bb::cascades::TouchEvent*)\0"
    "StartGame()\0NextGame()\0RedoGame()\0"
    "ResetAll()\0Home()\0Submit()\0bool\0"
    "showNext\0showRetry\0int\0coinCount\0"
    "hintShown\0QString\0levelHint\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->showNextChanged(); break;
        case 1: _t->ShowRetryChanged(); break;
        case 2: _t->coinCountChanged(); break;
        case 3: _t->hintShownChanged(); break;
        case 4: _t->levelHintChanged(); break;
        case 5: _t->gameCompletedSignal(); break;
        case 6: _t->onTileTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        case 7: _t->StartGame(); break;
        case 8: _t->NextGame(); break;
        case 9: _t->RedoGame(); break;
        case 10: _t->ResetAll(); break;
        case 11: _t->Home(); break;
        case 12: _t->Submit(); break;
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
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = getShowNext(); break;
        case 1: *reinterpret_cast< bool*>(_v) = getShowRetry(); break;
        case 2: *reinterpret_cast< int*>(_v) = getCoinCount(); break;
        case 3: *reinterpret_cast< bool*>(_v) = getHintShown(); break;
        case 4: *reinterpret_cast< QString*>(_v) = getLevelHint(); break;
        }
        _id -= 5;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setShowNext(*reinterpret_cast< bool*>(_v)); break;
        case 1: setShowRetry(*reinterpret_cast< bool*>(_v)); break;
        case 2: setCoinCount(*reinterpret_cast< int*>(_v)); break;
        case 3: setHintShown(*reinterpret_cast< bool*>(_v)); break;
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
void ApplicationUI::showNextChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void ApplicationUI::ShowRetryChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void ApplicationUI::coinCountChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void ApplicationUI::hintShownChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void ApplicationUI::levelHintChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void ApplicationUI::gameCompletedSignal()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}
QT_END_MOC_NAMESPACE
