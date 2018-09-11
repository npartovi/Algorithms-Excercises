// --- Directions
// Given a node, validate the binary search tree,
// ensuring that every node's left hand child is
// less than the parent node's value, and that
// every node's right hand child is greater than
// the parent

function validate(node, min = null, max = null) {

    if(max !== null && node.data > max){
        return false
    }

    if(min !== null && node.data < min){
        return false
        
    }

    if(node.left && !validate(node.left, min, node.data)){
        return false
    }

    if(node.right && !validate(node.right, node.data, max)){
        return false
    }

    return true


}

// alternative solution

// var isValidBST = function(root, min, max){
//     return isValidBSTHelper(root, -Infinity, Infinity);
// };

// let isValidBSTHelper = function(root, min, max){
//     if(root === null) return true;
//     if(root.val <= min || root.val >= max) return false;
//     return isValidBSTHelper(root.left, min, root.val) && isValidBSTHelper(root.right, root.val, max);
// }

module.exports = validate;
