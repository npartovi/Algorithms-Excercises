// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {
    // Solution #1
    // return str.split("").reverse().join("")

    // solution #2
    // let results = ""

    // for(let i = str.length - 1; i >= 0 ; i--){
    //     results += str[i]
    // }

    // return results

    //solution #3
    // const results = []

    // for(let i = 0; i < str.length; i++){
    //     results.unshift(str[i])
    // }

    // return results.join("")

    //soluton #4
    let reversed = ""

    for(let character of str){
        reversed = character + reversed
        
    }
    return reversed

    // solution #5
    // return str.split("").reduce((reversed, char) => {
    //     return char + reversed
    // }, "")

}

module.exports = reverse;
