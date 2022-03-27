//
//  BoardView.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

import UIKit

class BoardView: UIView {

    let cols: Int = 9
    let rows: Int = 7
    
    let originX: CGFloat = 40
    let originY: CGFloat = 50
    let cellSide: CGFloat = 20
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        
    }

    func drawGrid(){
        let gridPath = UIBezierPath()
        
        for i in 0...rows {
            gridPath.move(to: CGPoint(x: originX, y: originY))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(cols) * cellSide, y: originY))
        }
        
        gridPath.stroke()
    }
    
}
