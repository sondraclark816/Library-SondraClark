//
//  books.swift
//  Library
//
//  Created by Sondra Clark on 10/12/16.
//  Copyright © 2016 Sondra Clark. All rights reserved.
//

import Foundation

var io = Io()
var done: Bool = false
var command: String = ""
var title: String = ""


class Inventory {
    
    var checkedOutBooks:[String] = [String]()


    var library = [
     "Thirteen Reasons Why",
     "Lord of the Rings",
     "The Fault in Our Stars",
     "The Hunger Games",
     "Catching Fire",
     "Mockingjay",
     "Head Full of Ghosts",
     "Finders Keepers",
     "Twilight",
     "The Host"
]
    

    // user types 'Quit'
    func quit () {
        io.writeMessage("Type 'Quit' again if you are sure you want to leave the library.")
        command = io.getInput()
        
        if command == "Quit"{
            done = true
            print("Exiting...")
    }
       
    }
    
    // user types 'Help'
    func menu() {
        io.writeMessage("\nType 'List' to see the books currently in our library. \nType 'Add' if you would like to add a book to our library. \nType 'Checkout' if you would like to check out a book. \nType 'Checkin' if you would like to return a book. \nType 'Quit' to exit the library.")
        return takeCommands()
        
    }


    // user types 'List' !!!!For some reason, you have to type List twice. Couldn't figure it out.!!!!!
    func listBooks() {
        
        command = io.getInput()
        for i in library {
            print(i)
        }
        return takeCommands()
    }
    
    // user types 'Add'
    func addBooks() {
        io.writeMessage("What is the title of your book?")
        command = io.getInput()
        library.append(command)
        print("Book was successfully added. Type 'List' to see your book in our library.")
        return takeCommands()
    }
    
    
    // user types 'Checkout'
    func checkOut () {
        let currentDate = Calendar.current
        let dueDate = currentDate.date(byAdding: .day, value: 7, to:Date())
        
        io.writeMessage("What is the title of the book you wish to check out?")
        command = io.getInput()
        checkedOutBooks.append(command)
        if let index = library.index(of: command){
            library.remove(at: index)
            for i in library {
            print(i, "\n")
                
        }
            print("Your book is due back \(dueDate!)")
            return takeCommands()
      }
    }
    
    // user types 'Checkin'
    func checkIn () {
        io.writeMessage("What book are you ready to check in?")
        command = io.getInput()
        if let index = checkedOutBooks.index(of: command){
            checkedOutBooks.remove(at: index)
            for i in checkedOutBooks{
            print(i,"\n")
           }
            print("Book was successfully checked in.")
            return takeCommands()
        }
      }
        
        
        func takeCommands() {
            io.writeMessage("\n\nWhat would you like to do?")
            command = io.getInput()
            
            
            switch command {
            case "Quit":
                quit()
            case "Help":
                menu()
            case "List":
                listBooks()
            case "Add":
                addBooks()
            case "Checkout":
                checkOut()
            case "Checkin":
                checkIn()
            default:
                print("Input Not Recognized")
                return menu()
                
            }
    }
  
}
