//
//  LinkedList.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 7/8/23.
//

import Foundation

class Node {
    var value: User
    var next: Node?
    
    init(value: User) {
        self.value = value
        self.next = nil
    }
}

class WaitingList {
    private var head: Node?
    
    // Check if the linked list is empty
    var isEmpty: Bool {
        return head == nil
    }
    
    // Get the first node of the linked list
    var first: Node? {
        return head
    }
    
    // Append a value to the end of the linked list
    func append(value: User) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    // Insert a value at a specific position in the linked list
    func insert(value: User, at index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            var current = head
            var currentIndex = 0
            while current?.next != nil && currentIndex < index - 1 {
                current = current?.next
                currentIndex += 1
            }
            newNode.next = current?.next
            current?.next = newNode
        }
    }
    
    
    // Remove the first node of the linked list
    func removeFirstPlayer() -> Node? {
        if !isEmpty {
            let removedNode = head
            head = head?.next
            return removedNode
        }
        return nil
    }
    
    // Remove the last node of the linked list
    func removeLast() -> Node? {
        if !isEmpty {
            if head?.next == nil {
                let removedNode = head
                head = nil
                return removedNode
            } else {
                var current = head
                while current?.next?.next != nil {
                    current = current?.next
                }
                let removedNode = current?.next
                current?.next = nil
                return removedNode
            }
        }
        return nil
    }
    
    // Remove the node at a specific position in the linked list
    func removePlayer(at index: Int) -> Node? {
        if index == 0 {
            return removeFirstPlayer()
        } else {
            var current = head
            var currentIndex = 0
            while current?.next != nil && currentIndex < index - 1 {
                current = current?.next
                currentIndex += 1
            }
            let removedNode = current?.next
            current?.next = current?.next?.next
            return removedNode
        }
    }
    
    // Print the linked list
    func printList() {
        var current = head
        var listString = ""
        while current != nil {
            if let value = current?.value {
                listString += "\(value) -> "
            }
            current = current?.next
        }
        listString += "nil"
        print(listString)
    }
    
    func findOpponent() -> Node? {
        var opponents = [User]()
        let playerOne = head?.value
        var count = 0
        let windowSize = 5
        var current = head?.next
        var opponentIndex = 1
        
        while (current != nil && count <= windowSize) {
            if let opponentID = current?.value.id,
                !(playerOne?.tempOpponentSet.contains(opponentID) ?? false) {
                opponents.append(current!.value)
                count += 1
            }
            current = current?.next
            opponentIndex += 1
        }
        
        var minRatingDifference = Int.max
        var selectedOpponent: User?
        var selectedOpponentIndex: Int?
        
        for (index, opponent) in opponents.enumerated() {
            let ratingDifference = abs(playerOne?.rating ?? 0 - opponent.rating)
            if ratingDifference < minRatingDifference {
                minRatingDifference = ratingDifference
                selectedOpponent = opponent
                selectedOpponentIndex = index
            }
        }
        
        if let opponent = selectedOpponent, let index = selectedOpponentIndex {
            // Do something with the opponent with the smallest rating difference
            print("Selected opponent: \(opponent)")
            
             let opponentNodeIndex = opponentIndex - (count - index) // verify math
             return removePlayer(at: opponentNodeIndex)
        }
        
        return nil
    }

}
