const e = require('express');
const hobby = require('../models/hobby.js');

exports.createHobby = async(req, res) => {
    const { name, type, description, rating } = req.body;

    try {
        await hobby.create({
            name: name,
            type: type,
            description: description,
            rating: rating
        });
        res.status(201).json({ message: `Hobby created: \n{ name: ${name}, type: ${type}, description: ${description}, rating: ${rating} }` });
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.getHobbies = async(req, res) => {
    try {
        const hobbies = await hobby.findAll();
        res.status(200).json(hobbies);
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.getHobby = async(req, res) => {
    const id = req.params.id;

    try {
        const hobbyFound = await hobby.findByPk(id);
        res.status(200).json(hobbyFound);
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.updateHobby = async(req, res) => {
    const id = req.params.id;
    const { name, type, description, rating } = req.body;

    try {
        await hobby.update({
            name: name,
            type: type,
            description: description,
            rating: rating
        }, {
            where: {
                id: id
            }
        });
        res.status(200).json({ message: `Hobby updated: \n{ name: ${name}, type: ${type}, description: ${description}, rating: ${rating} }` });;
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.deleteHobby = async(req, res) => {
    const id = req.params.id;

    try {
        await hobby.destroy({
            where: {
                id: id
            }
        });
        res.status(200).json({ message: 'Hobby deleted' });
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.deleteHobbies = async(req, res) => {
    try {
        await hobby.destroy({
            where: {},
            truncate: true
        });
        res.status(200).json({ message: 'Hobbies deleted' });
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.getHobbiesByType = async(req, res) => {
    const type = req.params.type;

    try {
        const hobbies = await hobby.findAll({
            where: {
                type: type
            }
        });
        res.status(200).json(hobbies);
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}

exports.getHobbiesByName = async(req, res) => {
    const name = req.params.name;

    try {
        const hobbies = await hobby.findAll({
            where: {
                name: name
            }
        });
        res.status(200).json(hobbies);
    } catch (error) {
        res.status(500).json({ error });
        console.error(error);
    }
}
