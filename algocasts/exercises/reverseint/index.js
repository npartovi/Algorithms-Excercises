// --- Directions
// Given an integer, return an integer that is the reverse
// ordering of numbers.
// --- Examples
//   reverseInt(15) === 51
//   reverseInt(981) === 189
//   reverseInt(500) === 5
//   reverseInt(-15) === -51
//   reverseInt(-90) === -9

function reverseInt(n) {

    let reversed = (n).toString().split("").reverse().join("")
    //test

    //solution#1
    // if(Math.sign(n) === -1){
    //     return parseInt(reversed) * -1
    // }else{
    //     return parseInt(reversed)
    // }
    
    //solution#2
    return parseInt(reversed) * Math.sign(n)
}

module.exports = reverseInt;
