import UIKit

class LLNode{
    var key:Int!
    var nextNode:LLNode!
}


class LinkedList{
    
    var Head:LLNode!
    func insert(key:Int){
        if(Head == nil){
            Head = LLNode()
            Head.key = key
            Head.nextNode = nil
        }
        else{
            var current:LLNode! = Head
            while(current.nextNode != nil){
                current = current.nextNode
            }
            current.nextNode = LLNode()
            current.nextNode.key = key
            current.nextNode.nextNode = nil
        }
    }
    func last() -> LLNode?{
        var item : LLNode = self.Head
        while item != nil {
            if item.nextNode != nil {
                item = item.nextNode
            }else { break }
        }
        return item
    }
    
    func toArray() -> [LLNode] {
        var returnValue = [LLNode]()
        guard self.Head != nil else {
            return returnValue
        }
        var item : LLNode = self.Head
        while item != nil {
            returnValue.insert(item, at: returnValue.count)
            if item.nextNode != nil {
                item = item.nextNode
            }else { break }
        }
        return returnValue
    }
    
    func pennultimate() -> LLNode?{
        let items = self.toArray()
        if items.count == 0  { return nil }
            if items.count > 2 {
                return items[ items.count-2 ]
            } else {
               return items[ items.count-1 ]
            }
    }
    func toString() -> String {
        var values = ""
        for item in self.toArray() {
            values +=  "\(item.key!),"
        }
        return values
    }
    
    func subScript( index : Int) -> LLNode? {
        let items = self.toArray()
        if items.count > 0 {
            items.count < index
            if index > items.count  { return nil }
            return items[ index ]
        }
        return nil
    }
    func length() -> Int {
        return self.toArray().count
    }
    func reverse() -> LinkedList {
        let lista : LinkedList = LinkedList()
        for item in self.toArray().reversed() {
         lista.insert(key: item.key)
        }
        return lista
    }
    func isPalindrome() -> Bool {
        return self.toString() == self.reverse().toString()
    }
    //func compress() -> LinkedList {
        //let lista : LinkedList = LinkedList()
        //var items = self.toArray()
        //for item in items
        //{
            ////print (lista.last()! == nil )
           // //if lista.last() == nil { lista.insert(key:  item.key)}
        //}
        //return lista
    //}
    //P14 (*) Duplicate the elements of a linked list.
    func  duplicate() -> LinkedList {
        return duplicate(value: 2)
    }
    //P15 (**) Duplicate the elements of a linked list a given number of times.
    func  duplicate(value : Int) -> LinkedList {
        let returnValue : LinkedList = LinkedList()
        let items = self.toArray()
        guard items.count > 0 else {
            return returnValue
        }
        for item in items {
            for _ in 1...value{
                returnValue.insert(key: item.key)
            }
        }
        return returnValue
        
    }
    //P16 (**) Drop every Nth element from a linked list.
    func drop(index : Int) -> LinkedList {
        let returnValue : LinkedList = LinkedList()
        var items = self.toArray()
        guard items.count > index else {
            return returnValue
        }
        items.remove(at: index)
        for item in items {
            returnValue.insert(key: item.key)
        }
        return returnValue
    }
    func split(atIndex : Int) -> (left : LinkedList, right: LinkedList) {
        var left = LinkedList()
        var right = LinkedList()
        let items = self.toArray()
        guard items.count > atIndex else {
            return (left : left, right : right)
        }
        for index in 0...atIndex - 1 {
            left.insert(key: items [ index ].key )
        }
        for index in atIndex...items.count - 1 {
            right.insert(key: items [ index ].key )
        }
        
        return (left : left, right : right)
    }
    
    func slice(startIndex: Int, endIndex : Int) -> LinkedList {
        let returnValue : LinkedList = LinkedList()
        var items = self.toArray()
        guard items.count > startIndex && items.count > endIndex else {
            return returnValue
        }
        for index in startIndex...endIndex {
            returnValue.insert(key: items[ index].key )
        }
        return returnValue
    }
    
    func removeAt(index : Int) -> (rest : LinkedList, removed : Int) {
        var items = self.toArray()
        
        var newList = LinkedList()
        guard items.count > index else {
            return (rest : self, removed: 0)
        }
        let removedItem = items.remove(at: index)
        for item in items {
            newList.insert(key: item.key)
        }
        return (rest : newList, removed: removedItem.key)
    }
 
}

extension Array { //extende a classe array para o tipo array de LLNode

    func toLinkedList() -> LinkedList {
        let returnValue = LinkedList()
        
        if let x = self as? [LLNode] {
            for item in x {
                returnValue.insert(key: item.key )
            }
        }
        
        return returnValue
    }
}

//1 == 5 ?  "Estamos bem": "Ups, não exatamente"
var listaTeste : LinkedList = LinkedList()
listaTeste.insert(key: 0)
listaTeste.insert(key: 0)
listaTeste.insert(key: 1)
listaTeste.insert(key: 2)
listaTeste.insert(key: 3)
listaTeste.last()?.key

listaTeste.toArray()
listaTeste.pennultimate()?.key
listaTeste.toString()
listaTeste.subScript(index: 2)?.key
listaTeste.length()
listaTeste

listaTeste.isPalindrome()
//lista.compress()? //todo: verificar erro
listaTeste.duplicate().toString()
listaTeste.duplicate(value: 4).toString()
listaTeste.drop(index: 1).toString()
listaTeste.toString()
var split = listaTeste.split(atIndex: 4)
split.left.toString()
split.right.toString()

listaTeste.slice(startIndex: 0, endIndex: 1).toString()

listaTeste.toString()
var removed = listaTeste.removeAt(index: 3)
removed.rest.toString()
removed.rest.toArray().toLinkedList().toString() //
