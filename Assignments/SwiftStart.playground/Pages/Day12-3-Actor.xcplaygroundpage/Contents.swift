//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
    Actor - iOS 13, Swift 5.5 (2019)
    Similar like class, meaning it's a reference type, but it's thread safe,
    it gives access to its properties, methods in a thread safe manner
    Actors don't support inheritance
 
 */


actor User {
    var games: [String] = []
    var name:String
    
    init(name: String) {
        self.name = name
    }
    
    func storeGame(newGame: String) async {
        games.append(newGame)
    }
    
    func getGame() async -> String  {
        return games.first
    }
}


let actorUser = User(name: "Bob")

actorUser.storeGame(newGame: "1st game")
actorUser.getGame()


let actorUser2 = actorUser

