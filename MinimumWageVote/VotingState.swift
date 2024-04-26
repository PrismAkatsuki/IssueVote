//
//  VotingState.swift
//  MinimumWageVote
//
//  Created by Brandon Fitz on 4/11/24.
//

import Foundation

enum VotingState {
    
    case startVote, check, total, castVote //submitVote
    
    var status: String {
        switch self {
        case .startVote, .castVote:
            return "Please vote for increasing the minimum wage"
        case .check:
            return "Here is the total vote so far"
        case .total:
            return "Here is the final vote tally"
        }
    }
    
}
