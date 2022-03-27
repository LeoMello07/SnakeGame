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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.snake.append(SnakeCell(col: 2, row: 1))
        board.snake.append(SnakeCell(col: 2, row: 2))
        board.snake.append(SnakeCell(col: 2, row: 3))
        board.snake.append(SnakeCell(col: 2, row: 4))
        
        boardView.shadowSnake = board.snake
        
    }

    @IBAction func left(_ sender: Any) {
        board.moveLeft()
        boardView.shadowSnake = board.snake
        boardView.setNeedsDisplay()
    }
    
    @IBAction func up(_ sender: Any) {
        board.moveUp()
        boardView.shadowSnake = board.snake
        boardView.setNeedsDisplay()
    }
    
    @IBAction func right(_ sender: Any) {
        board.moveRight()
        boardView.shadowSnake = board.snake
        boardView.setNeedsDisplay()
    }
    
    @IBAction func down(_ sender: Any) {
        board.moveDown()
        boardView.shadowSnake = board.snake
        boardView.setNeedsDisplay()
    }
}

