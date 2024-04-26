//
//  ViewController.swift
//  MinimumWageVote
//
//  Created by Brandon Fitz on 4/11/24.
//

import UIKit

class ViewController: UIViewController {

    enum election {
        case yes, no
    }
    
    
    
    //MARK: - IB Outlets
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var submitVoteButton: UIButton!
    
    @IBOutlet weak var voteResultLabel: UILabel!
    
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var totalButton: UIButton!
    
    
    @IBOutlet weak var checkButton: UIButton!
    
    //MARK: - Instance Properties
    var yesVotes = 0
    var noVotes = 0
    var yesState = false
    var noState = false
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(forState: .startVote)
        // Do any additional setup after loading the view.
    }

    //MARK: - IB Actions
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
    yesState = true
        noButton.isEnabled = false
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
    noState = true
        yesButton.isEnabled = false
    }
    
    @IBAction func submitVoteButtonTapped(_ sender: UIButton) {
        voteCast()
        updateUI(forState: .startVote)
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        updateUI(forState: .startVote)
        yesVotes = 0
        noVotes = 0
        yesState = false
        noState = false
    }
    
    @IBAction func totalButtonTapped(_ sender: UIButton) {
        tallyVotes(yesVotes: yesVotes, noVotes: noVotes)
        updateUI(forState: .total)
    }
    
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        updateUI(forState: .check)
        checkVotes(yesVotes: yesVotes, noVotes: noVotes)
    }
    //MARK: - Instance Methods
    
    
    func updateUI(forState state: VotingState) {
        
        switch state {
        case .startVote:
            voteResultLabel.isHidden = true
            resetButton.isHidden = true
            totalButton.isHidden = false
            resetButton.isEnabled = false
            totalButton.isEnabled = true
            yesButton.isEnabled = true
            noButton.isEnabled = true
            checkButton.isEnabled = true
            checkButton.isHidden = false
            
        case .check:
            voteResultLabel.isHidden = false
            submitVoteButton.isHidden = true
            submitVoteButton.isEnabled = false
            yesButton.isEnabled = false
            noButton.isEnabled = false
            totalButton.isEnabled = false
            totalButton.isHidden = true
            
        case .total:
            voteResultLabel.isHidden = false
            submitVoteButton.isHidden = true
            submitVoteButton.isEnabled = false
            yesButton.isEnabled = false
            noButton.isEnabled = false
            resetButton.isHidden = false
            resetButton.isEnabled = true
            checkButton.isEnabled = false
            checkButton.isHidden = true
            
        case .castVote:
            yesButton.isEnabled = false
            noButton.isEnabled = false
            voteResultLabel.isHidden = true
            
        //case .submitVote:
            
        }
    }
    
    func tallyVotes(yesVotes: Int, noVotes: Int) {
        if yesVotes > noVotes {
            voteResultLabel.text = "The votes to raise minimum wage have won with a vote of \(yesVotes) YES to \(noVotes) NO."
        } else if yesVotes < noVotes {
            voteResultLabel.text = "The votes to raise minimum wage have lost with a vote of \(noVotes) NO to \(yesVotes) YES."
        } else if yesVotes == noVotes {
            voteResultLabel.text = "It's a tie."
        }
    }
    
    func checkVotes(yesVotes: Int, noVotes: Int) {
        voteResultLabel.text = """
Yes votes = \(yesVotes)
No votes = \(noVotes)
"""
    }
    
    fileprivate func voteCast() {
        //TODO: add tally function to tally votes
        if yesState == true {
            yesVotes += 1
            print("Yes vote: \(yesVotes)")
            yesState = false
        }
        
        if noState == true {
            noVotes += 1
            print("No vote: \(noVotes)")
            noState = false
        }
    }
}

