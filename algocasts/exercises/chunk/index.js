// --- Directions
// Given an array and chunk size, divide the array into many subarrays
// where each subarray is of length size
// --- Examples
// chunk([1, 2, 3, 4], 2) --> [[ 1, 2], [3, 4]]
// chunk([1, 2, 3, 4, 5], 2) --> [[ 1, 2], [3, 4], [5]]
// chunk([1, 2, 3, 4, 5, 6, 7, 8], 3) --> [[ 1, 2, 3], [4, 5, 6], [7, 8]]
// chunk([1, 2, 3, 4, 5], 4) --> [[ 1, 2, 3, 4], [5]]
// chunk([1, 2, 3, 4, 5], 10) --> [[ 1, 2, 3, 4, 5]]

function chunk(array, size) {

    //solution #1
    // let results = []
    // let sub = []

    // for(let i = 0; i < array.length; i++){
    //     if(sub.length === size){
    //       results.push(sub)
    //       sub = []
    //     }
    //     sub.push(array[i])
    // }

    // if (sub){
    //   results.push(sub)
    //   return results
    // }else {
    //   return results
    // }

    //solution #2
    const chunked = []
    let index = 0

    while(index < array.length){
        let sliced = array.slice(index, size + index)
        chunked.push(sliced)
        index += size
    }
    return chunked

}

module.exports = chunk;
