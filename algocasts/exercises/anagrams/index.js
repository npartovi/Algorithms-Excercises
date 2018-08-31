// --- Directions
// Check to see if two provided strings are anagrams of eachother.
// One string is an anagram of another if it uses the same characters
// in the same quantity. Only consider characters, not spaces
// or punctuation.  Consider capital letters to be the same as lower case
// --- Examples
//   anagrams('rail safety', 'fairy tales') --> True
//   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
//   anagrams('Hi there', 'Bye there') --> False

function anagrams(stringA, stringB) {

  //Solution #1
  // charMapA = charCounter(stringA)
  // charMapB = charCounter(stringB)

  // let charKeysA = Object.keys(charMapA)
  // let charKeysB = Object.keys(charMapB)

  // if(charKeysA.length === charKeysB.length){
  //   return charKeysA.every(key => charMapA[key] === charMapB[key])
  // }

  // return false

  stringA = stringA.replace(/[^\w]/g,"").toLowerCase().split("").sort().join("")
  stringB = stringB.replace(/[^\w]/g,"").toLowerCase().split("").sort().join("")

  return stringA === stringB

}


function charCounter(string){

  let charMap = {}
  const passChar = [" ","!",",",""]

  string.toLowerCase().split("").forEach(char => {
      if(!passChar.includes(char)){
          charMap[char] = charMap[char] + 1 || 1
      }
  })

    return charMap
}

module.exports = anagrams;
