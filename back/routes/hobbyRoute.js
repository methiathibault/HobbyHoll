const express = require('express');
const router = express.Router();

const hobbyController = require('../controllers/hobbyController');

router.post('/', hobbyController.createHobby);
router.get('/', hobbyController.getHobbies);
router.get('/:id', hobbyController.getHobby);
router.get('/search/:type', hobbyController.getHobbiesByType);
router.get('/search/:name', hobbyController.getHobbiesByName);
router.put('/:id', hobbyController.updateHobby);
router.delete('/:id', hobbyController.deleteHobby);
router.delete('/', hobbyController.deleteHobbies);

module.exports = router;