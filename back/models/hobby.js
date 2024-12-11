const sequelize = require('../database/database.js');
const { DataTypes } = require('sequelize');

const hobby = sequelize.define('hobby', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    type: {
        type: DataTypes.ENUM,
        values: ['Manga', 'Film', 'Série', 'BD', 'Comics', 'Livre'],
        allowNull: false
    },
    description: {
        type: DataTypes.STRING,
        allowNull: false
    },
    rating: {
        type: DataTypes.FLOAT,
        allowNull: false
    },
    release_date: {
        type: DataTypes.DATE,
        allowNull: true
    }
}, {
    sequelize,
    freezeTableName: true,
});

module.exports = hobby;