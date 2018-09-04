// --- Directions
// Given the root node of a tree, return
// an array where each element is the width
// of the tree at each level.
// --- Example
// Given:
//     0
//   / |  \
// 1   2   3
// |       |
// 4       5
// Answer: [1, 3, 2]

function levelWidth(root) {

    let counter = 0
    const arr = [root, "stop"]
    const results = []

    while(arr.length > 1){

        const node = arr.shift()

        if(node === "stop"){
            results.push(counter)
            counter = 0
            arr.push('stop')
        }else{
            arr.push(...node.children)
            counter += 1
        }
    }

    results.push(counter)
    return results

}

module.exports = levelWidth;
