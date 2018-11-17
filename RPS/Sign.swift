//
//  Sign.swift
//  RPS
//
//  Created by Hameed Abdullah on 11/12/18.
//  Copyright © 2018 Hameed Abdullah. All rights reserved.
//

import Foundation
import GameplayKit

//If you call the nextInt() method on randomChoice, the GKRandomDistribution instance will give you a random Int between ​ the two values specified in the initializer.
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
        
    } else if sign == 1 {
        return .paper
        
    } else {
        return .scissors
    }
    
}

enum Sign {
    case rock
    case paper
    case scissors
    
    //calculated property
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    
    //instance method will calulate the result
    func turn(opponent: Sign) -> GameState {  //opponent will be the app itself
        switch self {
        case .rock:          //Myself
            
            switch opponent { //checking against the opponent
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            }
    
        case .paper:            //Myself
            
            switch opponent { //checking against the opponent
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            }
            
        case .scissors:       //Myself
            
            switch opponent { //checking against the opponent
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            }
        }
       
    }
}
