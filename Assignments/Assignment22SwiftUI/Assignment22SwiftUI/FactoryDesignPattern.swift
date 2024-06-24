//
//  FactoryDesignPattern.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/23/24.
//

import Foundation



protocol Player {
    
    func play()
}



class BasketballPlayer: Player {
    func play() {
        print("This is a basketball player")
    }
}


class SoccerPlayer: Player {
    func play() {
        print("This is a soccer player")
    }
}


enum PlayerType {
    case basketball
    case soccer
}



class PlayerFactory {
    
    func createPlayer(type: PlayerType) -> Player {
        switch type {
        case .basketball:
            return BasketballPlayer()
        case .soccer:
            return SoccerPlayer()
        }
    }
}


