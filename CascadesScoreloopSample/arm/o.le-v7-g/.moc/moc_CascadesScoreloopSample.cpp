/****************************************************************************
** Meta object code from reading C++ file 'CascadesScoreloopSample.hpp'
**
** Created: Sat Nov 24 14:55:17 2012
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/CascadesScoreloopSample.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CascadesScoreloopSample.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CascadesScoreloopSample[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      25,   24,   24,   24, 0x05,

 // slots: signature, parameters, type, tag, flags
      53,   48,   24,   24, 0x0a,
      91,   81,   24,   24, 0x0a,

 // methods: signature, parameters, type, tag, flags
     134,  128,   24,   24, 0x02,
     151,   24,   24,   24, 0x02,
     169,   24,   24,   24, 0x02,
     219,   24,  202,   24, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_CascadesScoreloopSample[] = {
    "CascadesScoreloopSample\0\0"
    "submitScoreCompleted()\0data\0"
    "scoreLoopLoaded(AppData_t*)\0scoreData\0"
    "onSubmitScoreCompleted(ScoreData_t*)\0"
    "score\0submitScore(int)\0loadLeaderboard()\0"
    "loadLeaderboardAroundLastScore()\0"
    "ScoreLoopThread*\0scoreLoop()\0"
};

void CascadesScoreloopSample::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CascadesScoreloopSample *_t = static_cast<CascadesScoreloopSample *>(_o);
        switch (_id) {
        case 0: _t->submitScoreCompleted(); break;
        case 1: _t->scoreLoopLoaded((*reinterpret_cast< AppData_t*(*)>(_a[1]))); break;
        case 2: _t->onSubmitScoreCompleted((*reinterpret_cast< ScoreData_t*(*)>(_a[1]))); break;
        case 3: _t->submitScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->loadLeaderboard(); break;
        case 5: _t->loadLeaderboardAroundLastScore(); break;
        case 6: { ScoreLoopThread* _r = _t->scoreLoop();
            if (_a[0]) *reinterpret_cast< ScoreLoopThread**>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CascadesScoreloopSample::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CascadesScoreloopSample::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_CascadesScoreloopSample,
      qt_meta_data_CascadesScoreloopSample, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CascadesScoreloopSample::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CascadesScoreloopSample::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CascadesScoreloopSample::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CascadesScoreloopSample))
        return static_cast<void*>(const_cast< CascadesScoreloopSample*>(this));
    return QObject::qt_metacast(_clname);
}

int CascadesScoreloopSample::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void CascadesScoreloopSample::submitScoreCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
