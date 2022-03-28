//
//  ViewController.swift
//  SnakeGame
//
//  Created by Leonardo Mello on 27/03/22.
//

import UIKit

//MVC DESIGN PATTERN
// M: MODEL
// V: VIEW
// C: CONTROLLER

class ViewController: UIViewController {
    
    var board: SnakeBoard = SnakeBoard() //model
    
    @IBOutlet weak var boardView: BoardView! //view

    var direction: MoveingDirection = .down
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.snake.append(SnakeCell(col: 2, row: 1))
        board.snake.append(SnakeCell(col: 2, row: 2))
        
        boardView.shadowSnake = board.snake
        updateUI()
     
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            
            switch self.direction {
            case .left:
                self.board.moveLeft()
            case .up:
                self.board.moveUp()
            case .right:
                self.board.moveRight()
            case .down:
                self.board.moveDown()
            }
            
            self.board.moveDown()
            self.updateUI()
        }
    
    }

    @IBAction func left(_ sender: Any) {
        direction = .left
    }
    
    @IBAction func up(_ sender: Any) {
        direction = .up
    }
    
    @IBAction func right(_ sender: Any) {
        direction = .right
    }
    
    @IBAction func down(_ sender: Any) {
        direction = .down
    }
    
    private func updateUI(){
        boardView.shadowSnake = board.snake
        boardView.shadowFruitCol = board.fruitCol
        boardView.shadowFruitRow = board.fruitRow
        boardView.setNeedsDisplay()
    }
}

