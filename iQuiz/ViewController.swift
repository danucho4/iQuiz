//
//  ViewController.swift
//  iQuiz
//
//  Created by Daniel Gil Chávez on 11/3/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton();
        button.setTitle("Settings", for: .normal)
        self.view.addSubview(button)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : QuestionController = segue.destination as! QuestionController
        DestViewController.type = segue.identifier!
        //print(segue.identifier!)
    }
}

