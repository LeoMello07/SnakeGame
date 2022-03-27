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
    
    var snake: [SnakeCell] = []
    
    
    func isOnSnake(col: Int, row: Int) -> Bool{
        for cell in snake {
            if cell.row == col && cell.row == row{
                return true
            }
        }
        
        return false
    }
    
    var description: String {
        var desc = " "
        
        for i in 0..<SnakeBoard.cols {
            desc += "\(i)"
        }
        
        
        for row in 0..<SnakeBoard.rows {
            desc += "\(row)"
            
            for col in 0..<SnakeBoard.cols {
                if isOnSnake(col: col, row: row){
                    desc += "o"
                } else { desc += "." }
            }
            desc += "\n"
        }
        return desc
    }
    
}
