#include "helpbtn.h"

HelpBtn::HelpBtn(QObject *parent)
    : QAbstractItemModel(parent)
{
}

QVariant HelpBtn::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

QModelIndex HelpBtn::index(int row, int column, const QModelIndex &parent) const
{
    // FIXME: Implement me!
}

QModelIndex HelpBtn::parent(const QModelIndex &index) const
{
    // FIXME: Implement me!
}

int HelpBtn::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int HelpBtn::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant HelpBtn::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}
