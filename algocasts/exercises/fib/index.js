// --- Directions
// Print out the n-th entry in the fibonacci series.
// The fibonacci series is an ordering of numbers where
// each number is the sum of the preceeding two.
// For example, the sequence
//  [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
// forms the first ten entries of the fibonacci series.
// Example:
//   fib(4) === 3

function fib(n) {

    // Solution #1 Iterative
    // const fibs = [0,1]


    // while(fibs.length <= n  ){
    //     let nextItem = fibs[fibs.length - 1] + fibs[fibs.length - 2]
    //     fibs.push(nextItem)
    // }

    // console.log(fibs)
    // return fibs[n]

    // Solution #2 Recursion
    // if(n < 2){
    //     return n
    // }

    // return fib(n - 1) + fib(n - 2)

    //Solution #3 Memoization
    

}

module.exports = fib;
