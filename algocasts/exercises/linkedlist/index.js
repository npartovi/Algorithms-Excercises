// --- Directions
// Implement classes Node and Linked Lists
// See 'directions' document

class Node {
    constructor(data, next = null){
        this.data = data
        this.next = next
    }
}

class LinkedList {
    constructor(){
        this.head = null
        
    }

    insertFirst(data){
        this.head = new Node(data, this.head)
    }

    size(){
        let counter = 0
        let currentNode = this.head

        while(currentNode){
            counter += 1
            currentNode = currentNode.next
        }

        return counter
    }

    getFirst(){
        return this.head
    }

    getLast(){

        let currentNode = this.head

        while(currentNode.next !== null){
            currentNode = currentNode.next
        }

        return currentNode
    }

    clear(){
        this.head = null
    }

    removeFirst(){
        if(!this.head){
            return
        }
        this.head = this.head.next
    }

    removeLast(){
    
        if(!this.head){
            return
        }

        if(!this.head.next){
            this.head = null
            return
        }

        let previous = this.head
        let nextNode = this.head.next

        while(nextNode.next){
            previous = nextNode
            nextNode = nextNode.next
        }

        previous.next = null       
    }

    insertLast(data){
        
        if(!this.head){
            this.head = new Node(data, this.head)
        }

        let currentNode = this.head

        while(currentNode.next){
            currentNode = currentNode.next
        }

        currentNode.next = new Node(data)
    }

    getAt(index){

        if(!this.head){
            return null
        }

        let counter = 0
        let currentNode = this.head.next

        while(counter !== index){
            currentNode = currentNode.next
            counter += 1
        }

        return currentNode

    }

    removeAt(index){

        let size = this.size()

        if(index > size - 1){
            return 
        }

        let node = this.getAt(index)

        let previous = this.head
        let currentNode = this.head.next

        while(currentNode !== node){
            previous = currentNode
            currentNode = currentNode.next
        }

        previous.next = currentNode.next
    }


    insertAt(data, index){
        
        let newNode = new Node(data)

        if(!this.head){
            this.head = newNode
            return
        }

        let size = this.size()

        if(index > size){
            let last = this.getLast()
            last.next = newNode
            return
        }

        let previous = this.head
        let currentNode = this.head.next
        let counter = 0

        while(counter !== index){
            previous = currentNode
            currentNode = currentNode.next
            counter += 1
        }

        previous.next = newNode
        newNode.next = currentNode
    }

    forEach(prc){
        
        let currentNode = this.head
        
        while(currentNode){
            prc(currentNode)
            currentNode = currentNode.next
        }
    }

    *[Symbol.iterator](){
        let node = this.head
        while(node){
            yield node
            node = node.next
        }
    }



}

module.exports = { Node, LinkedList };
