//: Playground - noun: a place where people can play

import UIKit

enum WagonType{
    case people
    case goods
    case restaurant
    case machine
}

class Wagon{
    var number: Int
    let type: WagonType
    var next: Wagon?
    
    init(number: Int, type: WagonType){
        self.number = number
        self.type = type
    }
}

extension Wagon: CustomStringConvertible{
    public var description: String{
        return "(Num: \(number), transporting: \(type))"
    }
}

class Train{
    var head: Wagon?
    
    init(head: Wagon){
        self.head =  head
    }
    
    func append(_ wagon: Wagon){
        
        guard head != nil else {
            head = wagon
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        
        current?.next = wagon
    }
    
    func getWagon(atPosition position: Int) -> Wagon?{
        guard position > 0 else{
            return nil
        }
        
        var current = head
        var counter = 1
        
        while counter <= position && current != nil{
            if counter == position{
                return current
            }
            counter += 1
            current = current?.next
        }
        
        return nil
        
    }
    
    func insertWagon(_ wagon: Wagon, at position: Int){
        
    }
    
    //Delete first wagon with the specified value
    func detachWagon(withNumber: Int){
        
    }
    
    func detachWagon(withType: WagonType){
        
    }
}

extension Train: CustomStringConvertible{
    public var description: String{
        
        guard head != nil else {
            return ""
        }
        
        var current = head
        var text = "[\(current!.description)->"
        
        while let _ = current?.next {
            current = current?.next
            text += current!.description
            if current?.next != nil {
                text += "->"
            }
        }
        
        text += "]"
        return text
    }
}

// TESTS
let machine = Wagon(number: 1, type: .machine)
let train = Train(head: machine)

let wagon1 = Wagon(number: 2, type: .people)
let wagon2 = Wagon(number: 3, type: .people)
let wagon3 = Wagon(number: 4, type: .restaurant)
let wagon4 = Wagon(number: 5, type: .goods)
train.append(wagon1)
print(train)

train.append(wagon2)
print(train)

train.append(wagon3)
print(train)

train.append(wagon4)
print(train)
train.getWagon(atPosition: 2)
print("Wagon at position 1 \(train.getWagon(atPosition: 1)!)")



