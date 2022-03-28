//
//  SnakeBoard.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

//MODEL

import Foundation

struct SnakeBoard: CustomStringConvertible {
    
    static let cols: Int = 17
    static let rows: Int = 15
    
    var fruitCol: Int = 1
    var fruitRow: Int = 3
    
    var snake: [SnakeCell] = []
    
    mutating func randomizeFruit(){
        fruitCol = Int(arc4random()) % SnakeBoard.cols
        fruitRow = Int(arc4random()) % SnakeBoard.rows
        
        while isOnSnake(col: fruitCol, row: fruitRow) {
            fruitCol = Int(arc4random()) % SnakeBoard.cols
            fruitRow = Int(arc4random()) % SnakeBoard.rows
        }
        
    }
    
    mutating func moveLeft(){
      updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col - 1, row: snake[0].row))
    }

    mutating func moveUp(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col, row: snake[0].row - 1))
    }
    
    mutating func moveRight(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0].row))
    }
    
    mutating func moveDown(){
        updateSnakeAndFruit(newHead: SnakeCell(col: snake[0].col, row: snake[0].row + 1))
    }
    
    mutating func updateSnakeAndFruit(newHead: SnakeCell){
        var newSnake: [SnakeCell] = []
        newSnake.append(newHead)
        for i in 0..<snake.count - 1 {
            newSnake.append(snake[i])
        }
        let oldTail = snake[snake.count - 1]
        if(snake[0].col == fruitCol && snake[0].row == fruitRow){
            newSnake.append(oldTail)
            randomizeFruit()
        }
        snake = newSnake
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
