//
//  SnakeBoard.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

import Foundation


struct SnakeBoard: CustomStringConvertible {
    
    static let cols: Int = 9
    static let rows: Int = 7
    
    var description: String {
        var desc = ""
        
        for row in 0..<SnakeBoard.rows {
            for cols in 0..<SnakeBoard.cols {
                desc += " ."
            }
            desc += "\n"
        }
        return desc
    }
    
}
