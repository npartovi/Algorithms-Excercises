// function transposeArray(array, arrayLength){
//     var newArray = [];
//     for(var i = 0; i < array.length; i++){
//         newArray.push([]);
//     };

//     for(var i = 0; i < array.length; i++){
//         for(var j = 0; j < arrayLength; j++){
//             newArray[j].push(array[i][j]);
//         };
//     };

//     return newArray;
// }



// console.log(transposeArray(my_array, 3))


// // [1, 4, 7]
// // [2, 5, 8]
// // [3, 6, 9]

// const flipMatrix = matrix => (
//     matrix[0].map((column, index) => (
//       matrix.map(row => row[index])
//     ))
//   );


// my_array = [
//     [1, 2, 3], 
//     [4, 5, 6], 
//     [7, 8, 9]
// ]

// console.log(flipMatrix(my_array).reverse())


var rotate = function(matrix) {
    // reverse the rows
    console.log(matrix)
     matrix = matrix.reverse();

     console.log(matrix)
     
     // swap the symmetric elements
     for (var i = 0; i < matrix.length; i++) {
       for (var j = 0; j < i; j++) {
         var temp = matrix[i][j];
         matrix[i][j] = matrix[j][i];
         matrix[j][i] = temp;
       }
     }
};

arr = [
    ['a', 'b'],
    ['c', 'd']
]

rotate(arr)




// url shortener
// parse a json object and find anything that had name in the key and replace with redacted
// 

// var rotateClockwise = function(matrix) {
//     // reverse the rows
//     matrix = matrix.reverse();
//     // swap the symmetric elements
//     for (var i = 0; i < matrix.length; i++) {
//       for (var j = 0; j < i; j++) {
//         var temp = matrix[i][j];
//         matrix[i][j] = matrix[j][i];
//         matrix[j][i] = temp;
//       }
//     }
//   };

//   var rotateCounterClockwise = function(matrix) {
//     // reverse the individual rows
//     matrix = matrix.map(function(row) {
//       return row.reverse();
//     });
//     // swap the symmetric elements
//     for (var i = 0; i < matrix.length; i++) {
//       for (var j = 0; j < i; j++) {
//         var temp = matrix[i][j];
//         matrix[i][j] = matrix[j][i];
//         matrix[j][i] = temp;
//       }
//     }
//   };
  
//   var original = [
//     [1, 2, 3],
//     [4, 5, 6],
//     [7, 8, 9]
//   ];
  
//   var clockwise = JSON.parse(JSON.stringify(original)); // deep-copy the original array
//   rotateClockwise(clockwise);
  
//   var counterClockwise = JSON.parse(JSON.stringify(original)); // deep-copy the original array
//   rotateCounterClockwise(counterClockwise);
  
//   document.querySelector('#output').textContent =
//     'Original:\n\n' + original.join('\n') + '\n\n' +
//     'Clockwise:\n\n' + clockwise.join('\n') + '\n\n' +
//     'Counter-clockwise:\n\n' + counterClockwise.join('\n');
  