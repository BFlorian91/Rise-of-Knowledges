import ScoreBoard from '../modele/ScoreBoard';
import mongoose from 'mongoose';

const defineScore = (datas) => {
    const score = [];

    datas.map(value => {
console.log(value)
        if (value.answer === value.userAnswer) {
            if (value.difficulty === '0') {
                score.push(2);
            }
            return value.difficulty === '1' ? score.push(5) : score.push(15);
        }
    })
console.log(score)
    return score !== [] ? score.reduce((a, b) => { return a + b}) : 0;
}

const getScore = async (req, res) => {
    const getAllScore = await ScoreBoard.find().sort({score: -1})
console.log(getAllScore)
    return !getAllScore ? res.status(500).json({error: 'cannot get All score did you fetch the table ?'})
    : res.status(200).json(getAllScore);
}

const PostScore = async (req, res) => {
console.log("Bonjour")
    const {name, datas} = req.body;
    const userScore = defineScore(datas);
    const isAlreadyAdded = await ScoreBoard.findOne({name: name});
console.log(userScore)
    if (!isAlreadyAdded) {
        const addScore = await new ScoreBoard({name: name, score: userScore});
        addScore.save()
        .then(resolve => { return res.status(200).json({message: 'users : ' +  name + ' score successfully added ' + resolve})})
        .catch((err) => { return res.status(500).json({error : err})});
    }
    return isAlreadyAdded && isAlreadyAdded.update({score: userScore}, (err, result) => {
        if (err || !result) return res.status(500).json({error: 'cannot update user score'});
        return res.status(200).json({message: 'updating successfully the user score'});
    });
}

module.exports = {getScore, PostScore};
