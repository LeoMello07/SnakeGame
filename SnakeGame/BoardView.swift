//
//  BoardView.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

import UIKit

class BoardView: UIView {

 
    
    let originX: CGFloat = 40
    let originY: CGFloat = 50
    let cellSide: CGFloat = 20
    var board = SnakeBoard() //temporario
    
    override func draw(_ rect: CGRect) {
       
        board.snake.append(SnakeCell(col: 2, row: 1))
        board.snake.append(SnakeCell(col: 2, row: 2))
        board.snake.append(SnakeCell(col: 2, row: 3))
        board.snake.append(SnakeCell(col: 2, row: 4))
        
//        board.moveLeft()
//        board.moveLeft()
//        board.moveUp()
        board.moveRight()
        board.moveRight()
//        board.moveDown()
//        board.moveLeft()
//        board.moveFoward()
//        board.moveFoward()
//        board.moveFoward()
        
        drawGrid()
        drawSnake()
        
    }
    
    func drawSnake(){
        
        
        if board.snake.isEmpty {
            return
         }
        
        let snakeHead = board.snake.first!
        UIColor.black.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(snakeHead.col) * cellSide, y: originY + CGFloat(snakeHead.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 5).fill()
    
        UIColor.yellow.setFill()
        for i in 1..<board.snake.count {
            let cell = board.snake[i]
            UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(cell.col) * cellSide, y: originY + CGFloat(cell.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 5).fill()
        }
        
        
    }

    func drawGrid(){
        let gridPath = UIBezierPath()
        
        for i in 0...SnakeBoard.rows {
            gridPath.move(to: CGPoint(x: originX, y: originY + CGFloat(i) * cellSide))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(SnakeBoard.cols) * cellSide, y: originY + CGFloat(i) * cellSide))
        }
        
        for i in 0...SnakeBoard.cols{
            gridPath.move(to: CGPoint(x: originX + CGFloat(i) * cellSide, y: originY))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(i) * cellSide, y: originY + CGFloat(SnakeBoard.rows) * cellSide))
        }
        UIColor.lightGray.setStroke()
        gridPath.stroke()
    }
    
}
