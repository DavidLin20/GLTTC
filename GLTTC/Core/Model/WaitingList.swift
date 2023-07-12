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
    func removeFirst() {
        if !isEmpty {
            head = head?.next
        }
    }
    
    // Remove the last node of the linked list
    func removeLast() {
        if !isEmpty {
            if head?.next == nil {
                head = nil
            } else {
                var current = head
                while current?.next?.next != nil {
                    current = current?.next
                }
                current?.next = nil
            }
        }
    }
    
    // Remove the node at a specific position in the linked list
    func remove(at index: Int) {
        if index == 0 {
            removeFirst()
        } else {
            var current = head
            var currentIndex = 0
            while current?.next != nil && currentIndex < index - 1 {
                current = current?.next
                currentIndex += 1
            }
            current?.next = current?.next?.next
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
    
//    func findOpponent(user: User) {
//        var count = 0
//        let windowSize = 5
//        var current = head
//        while (current != nil && count <= windowSize) {
//            if (
//        }
//    }
}
