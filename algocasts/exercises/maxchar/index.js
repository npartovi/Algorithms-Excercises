// --- Directions
// Given a string, return the character that is most
// commonly used in the string.
// --- Examples
// maxChar("abcccccccd") === "c"
// maxChar("apple 1231111") === "1"

function maxChar(str) {

    const charMap = {}

    for(let i = 0; i < str.length; i++){
        charMap[str[i]] = charMap[str[i]] + 1 || 1
    }

    let keys = Object.keys(charMap)
    let number = 0
    let letter;

    keys.forEach((key) => {
        if(charMap[key] > number){
            number = charMap[key]
            letter = key
        }
    })

    return letter


}

module.exports = maxChar;
