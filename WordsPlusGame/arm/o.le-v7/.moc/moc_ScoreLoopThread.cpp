/****************************************************************************
** Meta object code from reading C++ file 'ScoreLoopThread.hpp'
**
** Created: Wed Jan 23 20:32:03 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/ScoreLoopThread.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ScoreLoopThread.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ScoreLoopThread[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       9,       // signalCount

 // signals: signature, parameters, type, tag, flags
      21,   17,   16,   16, 0x05,
      61,   52,   16,   16, 0x05,
     101,   91,   16,   16, 0x05,
     152,  136,   16,   16, 0x05,
     207,  191,   16,   16, 0x05,
     247,   16,   16,   16, 0x05,
     271,   16,   16,   16, 0x05,
     298,   16,   16,   16, 0x05,
     338,  325,   16,   16, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_ScoreLoopThread[] = {
    "ScoreLoopThread\0\0app\0"
    "ScoreLoopUserReady(AppData_t*)\0username\0"
    "RequestUserCompleted(QString)\0scoreData\0"
    "SubmitScoreCompleted(ScoreData_t*)\0"
    "leaderboardData\0LoadLeaderboardCompleted(QVariantList)\0"
    "achievementData\0LoadAchievementsCompleted(QVariantList)\0"
    "AchieveAwardCompleted()\0"
    "AcceptChallengeCompleted()\0"
    "SubmitChallengeCompleted()\0toastMessage\0"
    "ConnectionError(QString)\0"
};

void ScoreLoopThread::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ScoreLoopThread *_t = static_cast<ScoreLoopThread *>(_o);
        switch (_id) {
        case 0: _t->ScoreLoopUserReady((*reinterpret_cast< AppData_t*(*)>(_a[1]))); break;
        case 1: _t->RequestUserCompleted((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->SubmitScoreCompleted((*reinterpret_cast< ScoreData_t*(*)>(_a[1]))); break;
        case 3: _t->LoadLeaderboardCompleted((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 4: _t->LoadAchievementsCompleted((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 5: _t->AchieveAwardCompleted(); break;
        case 6: _t->AcceptChallengeCompleted(); break;
        case 7: _t->SubmitChallengeCompleted(); break;
        case 8: _t->ConnectionError((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ScoreLoopThread::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ScoreLoopThread::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_ScoreLoopThread,
      qt_meta_data_ScoreLoopThread, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ScoreLoopThread::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ScoreLoopThread::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ScoreLoopThread::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ScoreLoopThread))
        return static_cast<void*>(const_cast< ScoreLoopThread*>(this));
    return QThread::qt_metacast(_clname);
}

int ScoreLoopThread::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void ScoreLoopThread::ScoreLoopUserReady(AppData_t * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ScoreLoopThread::RequestUserCompleted(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ScoreLoopThread::SubmitScoreCompleted(ScoreData_t * _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void ScoreLoopThread::LoadLeaderboardCompleted(QVariantList _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void ScoreLoopThread::LoadAchievementsCompleted(QVariantList _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void ScoreLoopThread::AchieveAwardCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void ScoreLoopThread::AcceptChallengeCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void ScoreLoopThread::SubmitChallengeCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}

// SIGNAL 8
void ScoreLoopThread::ConnectionError(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 8, _a);
}
QT_END_MOC_NAMESPACE
