// --- Directions
// Implement bubbleSort, selectionSort, and mergeSort

function bubbleSort(arr) {

    let notSorted = true

    while(notSorted){
        notSorted = false

        for(let i = 0; i < arr.length; i++){
            if(arr[i] === arr.length - 1) continue
            if(arr[i] > arr[i + 1]){
                let temp = arr[i + 1]
                arr[i + 1] = arr[i]
                arr[i] = temp
                notSorted = true
            }
        }
    }

    return arr

}

function selectionSort(arr) {



    for(let i =0; i < arr.length; i++){
        let indexofMin = i
        for(let j = i + 1; j < arr.length; j++){
            if(arr[j] < arr[indexofMin]){
                indexofMin = j
            }
        }

        let temp = arr[i]
        arr[i] = arr[indexofMin]
        arr[indexofMin] = temp

    }

    return arr
}

function mergeSort(arr) {

    if(arr.length <= 1){
        return arr
    }

    let midpoint = Math.floor(arr.length / 2)

    let left = mergeSort(arr.slice(0,midpoint))
    let right = mergeSort(arr.slice(midpoint))

    return merge(left, right)

}

function merge(left, right) {

    const prc = (x,y) => {
        if(x < y) return -1
        if(x > y) return 1
        if(x === y) return 0
    }

    const results = []

    while(left.length && right.length){
        switch(prc(left[0], right[0])){
            case -1:
                results.push(left.shift())
                break
            case 0:
                results.push(left.shift())
                results.push(right.shift())
                break
            case 1:
                results.push(right.shift())
                break
        }
    }

    return [...results, ...left, ...right]

}

module.exports = { bubbleSort, selectionSort, mergeSort };
