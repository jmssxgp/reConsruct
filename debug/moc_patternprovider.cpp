/****************************************************************************
** Meta object code from reading C++ file 'patternprovider.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../patternprovider.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'patternprovider.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.10.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_PatternProvider_t {
    QByteArrayData data[13];
    char stringdata0[79];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_PatternProvider_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_PatternProvider_t qt_meta_stringdata_PatternProvider = {
    {
QT_MOC_LITERAL(0, 0, 15), // "PatternProvider"
QT_MOC_LITERAL(1, 16, 7), // "aidStar"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 1), // "X"
QT_MOC_LITERAL(4, 27, 1), // "Y"
QT_MOC_LITERAL(5, 29, 1), // "N"
QT_MOC_LITERAL(6, 31, 1), // "K"
QT_MOC_LITERAL(7, 33, 10), // "aidRosette"
QT_MOC_LITERAL(8, 44, 1), // "G"
QT_MOC_LITERAL(9, 46, 5), // "clear"
QT_MOC_LITERAL(10, 52, 4), // "save"
QT_MOC_LITERAL(11, 57, 4), // "path"
QT_MOC_LITERAL(12, 62, 16) // "patternEmbedding"

    },
    "PatternProvider\0aidStar\0\0X\0Y\0N\0K\0"
    "aidRosette\0G\0clear\0save\0path\0"
    "patternEmbedding"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_PatternProvider[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    4,   39,    2, 0x02 /* Public */,
       7,    5,   48,    2, 0x02 /* Public */,
       9,    0,   59,    2, 0x02 /* Public */,
      10,    1,   60,    2, 0x02 /* Public */,
      12,    4,   63,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Double, QMetaType::Double, QMetaType::Double, QMetaType::Double,    3,    4,    5,    6,
    QMetaType::Void, QMetaType::Double, QMetaType::Double, QMetaType::Double, QMetaType::Double, QMetaType::Double,    3,    4,    5,    8,    6,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::Double, QMetaType::Double, QMetaType::Double, QMetaType::Double,    3,    4,    8,    5,

       0        // eod
};

void PatternProvider::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        PatternProvider *_t = static_cast<PatternProvider *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->aidStar((*reinterpret_cast< double(*)>(_a[1])),(*reinterpret_cast< double(*)>(_a[2])),(*reinterpret_cast< double(*)>(_a[3])),(*reinterpret_cast< double(*)>(_a[4]))); break;
        case 1: _t->aidRosette((*reinterpret_cast< double(*)>(_a[1])),(*reinterpret_cast< double(*)>(_a[2])),(*reinterpret_cast< double(*)>(_a[3])),(*reinterpret_cast< double(*)>(_a[4])),(*reinterpret_cast< double(*)>(_a[5]))); break;
        case 2: _t->clear(); break;
        case 3: _t->save((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->patternEmbedding((*reinterpret_cast< double(*)>(_a[1])),(*reinterpret_cast< double(*)>(_a[2])),(*reinterpret_cast< double(*)>(_a[3])),(*reinterpret_cast< double(*)>(_a[4]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject PatternProvider::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_PatternProvider.data,
      qt_meta_data_PatternProvider,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *PatternProvider::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *PatternProvider::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_PatternProvider.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int PatternProvider::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
