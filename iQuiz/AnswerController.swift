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
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (givenAnswer == realAnswer) {
            message.text = "You got it right!"
        } else {
            message.text = "Sorry, the right answer was \(realAnswer!)"
        }
        message.numberOfLines = 0
        message.lineBreakMode = NSLineBreakMode.byWordWrapping
        message.sizeToFit()
        message.textAlignment = NSTextAlignment.center
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
