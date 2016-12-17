//
//  AnswerController.swift
//  iQuiz
//
//  Created by Daniel Gil Chávez on 12/16/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import Foundation
import UIKit

class AnswerController: UIViewController {
    var givenAnswer : String!
    var realAnswer : String!
    var correct : Int?
    var question: String!
    var type: String!
    var current : Int?
    var qLength : Int?
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var prompt: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prompt.text = question
        if (givenAnswer == realAnswer) {
            message.text = "You got it right!"
            correct! += 1
        } else {
            message.text = "Sorry, the right answer was \(realAnswer!)"
        }
        message.numberOfLines = 0
        message.lineBreakMode = NSLineBreakMode.byWordWrapping
        message.sizeToFit()
        message.textAlignment = NSTextAlignment.center
        current! += 1
        print("Current question: \(current!)")
        print("Score: \(correct!)")
        if (current == qLength) {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            label.text = "Score: \(correct!) out of \(current!)"
            self.view.addSubview(label)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : QuestionController = segue.destination as! QuestionController
        DestViewController.type = type
        DestViewController.current = current
        DestViewController.correct = correct
    }
}
