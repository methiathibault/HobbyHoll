const Hobby = require('../models/hobby');
require('dotenv').config();

const launch = async () => {
    try {
        await Hobby.sync({ force: true });
        console.log('Table created');

        await Hobby.create({
            name: 'Harry Potter',
            type: 'Livre',
            description: 'Saga de romans fantastiques',
            rating: 4.2,
            release_date: '1997-06-26'
        });

        await Hobby.create({
            name: 'Le Seigneur des Anneaux',
            type: 'Livre',
            description: 'Saga de romans fantastiques',
            rating: 4.8,
            release_date: '1954-07-29'
        });

        await Hobby.create({
            name: 'Game of Thrones',
            type: 'Série',
            description: 'Série fantastique',
            rating: 4.5,
            release_date: '2011-04-17'
        });

        await Hobby.create({
            name: 'Truemanshow',
            type: 'Film',
            description: 'Film de science-fiction',
            rating: 4.7,
            release_date: '1998-06-24'
        });

        await Hobby.create({
            name: 'One Piece',
            type: 'Manga',
            description: 'Saga de mangas fantastiques',
            rating: 4.9,
            release_date: '1997-07-22'
        });

        await Hobby.create({
            name: 'Naruto',
            type: 'Manga',
            description: 'Saga de mangas fantastiques',
            rating: 4.6,
            release_date: '1999-09-21'
        });

        await Hobby.create({
            name: 'Les Légendaires',
            type: 'BD',
            description: 'Saga de bandes dessinées fantastiques',
            rating: 4.4,
            release_date: '2004-01-01'
        });

        await Hobby.create({
            name: 'Spiderman',
            type: 'Comics',
            description: 'Saga de comics fantastiques',
            rating: 4.3,
            release_date: '1962-08-01'
        });
        console.log('Data inserted');
        process.exit();
    } catch (error) {
        console.error('Unable to create table:', error);
        process.exit();
    }
}

launch();