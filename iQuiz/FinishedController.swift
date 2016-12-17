//
//  FinishedController.swift
//  iQuiz
//
//  Created by Daniel Gil Chávez on 12/17/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import Foundation
import UIKit

class FinishedController: UIViewController {
    var current : Int?
    var correct : Int?
    
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(current!)
        print(correct!)
        Score.text = "You got \(correct!) out of \(current!)"
        let percent = Double(correct!) / Double (current!) * 100
        if percent == 100 {
            Message.text = "Amazing"
        } else if percent > 80 {
            Message.text = "Great"
        } else if percent > 60 {
            Message.text = "Good"
        } else {
            Message.text = "You can do better..."
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
