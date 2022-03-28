//
//  BoardView.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

//VIEW

import UIKit

class BoardView: UIView {

    let originX: CGFloat = 40
    let originY: CGFloat = 50
    let cellSide: CGFloat = 20
    
    var shadowSnake: [SnakeCell] = []
    
    var shadowFruitCol: Int = Int.min
    var shadowFruitRow: Int = Int.min
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        drawSnake()
        drawFruit()
    }
    
    func drawFruit(){
        
        UIColor.systemPink.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(shadowFruitCol) * cellSide, y: originY + CGFloat(shadowFruitRow) * cellSide, width: cellSide, height: cellSide), cornerRadius: 30).fill()
        
    }
    
    func drawSnake(){
    
        if shadowSnake.isEmpty {
            return
         }
        
        let snakeHead = shadowSnake.first!
        UIColor.black.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(snakeHead.col) * cellSide, y: originY + CGFloat(snakeHead.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 5).fill()
    
        UIColor.yellow.setFill()
        for i in 1..<shadowSnake.count {
            let cell = shadowSnake[i]
            UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(cell.col) * cellSide, y: originY + CGFloat(cell.row) * cellSide, width: cellSide, height: cellSide), cornerRadius: 0).fill()
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
