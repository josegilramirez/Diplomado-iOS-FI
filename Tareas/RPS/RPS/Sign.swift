//
//  Sign.swift
//  RPS
//
//  Created by José Gil Ramírez S on 11/08/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation
import GameplayKit

enum Sign {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case .rock: return "👊🏽"
        case .paper: return "✋🏽"
        case .scissors: return "✌🏽"
        }
    }
    
    func compare(_ otherSign: Sign) -> GameState {
        switch self {
        case .rock:
            if otherSign == .paper {
                return .lose
            }
            if otherSign == .scissors {
                return .win
            }
            else {
                return .draw
            }
            
        case .paper:
            if otherSign == .scissors {
                return .lose
            }
            if otherSign == .rock {
                return .win
            }
            else {
                return .draw
            }
            
        case .scissors:
            if otherSign == .rock {
                return .lose
            }
            if otherSign == .paper {
                return .win
            }
            else {
                return .draw
            }
        }
    }
}

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }
    else if sign == 1 {
        return .paper
    }
    else {
        return .scissors
    }
}

