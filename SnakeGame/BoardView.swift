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
        
        
        drawGrid()
        drawSnake()
        
    }
    
    func drawSnake(){
        UIColor.green.setFill()
        let cell = UIBezierPath(roundedRect: CGRect(x: originX, y: originY, width: cellSide, height: cellSide), cornerRadius: 5)
        cell.fill()
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
