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
    
    mutating func moveLeft(){
       snake = updateSnake(newHead: SnakeCell(col: snake[0].col - 1, row: snake[0].row))
        
    }
    
    mutating func moveUp(){
        snake = updateSnake(newHead: SnakeCell(col: snake[0].col, row: snake[0].row - 1))
        
    }
    
    mutating func moveRight(){
        snake = updateSnake(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0].row))
    }
    
    mutating func moveDown(){
        snake = updateSnake(newHead: SnakeCell(col: snake[0].col, row: snake[0].row + 1))
    }
    
//    mutating func moveFoward(){
//        snake = updateSnake(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0].row))
//    }
    
    func updateSnake(newHead: SnakeCell) -> [SnakeCell]{
        var newSnake: [SnakeCell] = []
        newSnake.append(newHead)
        for i in 0..<snake.count - 1 {
            newSnake.append(snake[i])
        }
        return newSnake
    }
    
    
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
                    let snakeHead = snake[0]
                    if snake[0].col == col && snake[0].row == row{
                        desc += "x"
                    } else { desc += "o" }
                } else { desc += "." }
            }
            desc += "\n"
        }
        return desc
    }
    
}
