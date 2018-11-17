//
//  ViewController.swift
//  RPS
//
//  Created by Hameed Abdullah on 11/12/18.
//  Copyright © 2018 Hameed Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       updateUI()
    }

    
    

    func updateUI() {
        appSign.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        playAgainButton.isHidden = true

        rockButton.isEnabled = true
        rockButton.isHidden = false
        
        paperButton.isEnabled = true
        paperButton.isHidden = false

       scissorsButton.isEnabled = true
       scissorsButton.isHidden = false

    }
   
    
    func play(player: Sign) {
        //first disable all buttons
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        //decied who won - get a random sign for the opponent - pass in the opponent then get a GameState
        let opponent = randomSign()
        
        //change appSign to the opponent random sign - using the calculated property
        appSign.text = opponent.emoji
        
        let result = player.turn(opponent: opponent)
        
        //switch against the result
        switch result {
        case .draw:
            gameStatus.text = "Draw"
        case .lose:
            gameStatus.text = "Lose"
        case .win:
            gameStatus.text = "Win"
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
        }
        
        //Hide rock, paper, scissors buttons except the one the player tapped. using switch statemnt against the player
        switch player {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }

    
    @IBAction func rockTapped(_ sender: Any) {
        play(player: .rock)
    }
    
    
    @IBAction func paperTapped(_ sender: Any) {
        play(player: .paper)
    }
    
    @IBAction func scissorsTapped(_ sender: Any) {
        play(player: .scissors)
    }
    
    
    @IBAction func playAgainTapped(_ sender: Any) {
        updateUI()
    }
    
}

