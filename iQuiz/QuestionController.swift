//
//  ViewController.swift
//  iQuiz
//
//  Created by Daniel Gil Chávez on 11/3/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import UIKit
struct Question {
    let question : String!
    let answers : [String]!
    let answer : Int!
}

class QuestionController: UIViewController {
    var Questions = [Question]()
    var selectedAnswer: String!
    var type : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Got here")
        print(type)
        Questions = [Question(question: "3 + 5 = ?", answers: ["2", "3", "8", "9"], answer: 2)]
        let currentQuestion = Questions[0]
        print("Question: \(currentQuestion.question!), Answers: \(currentQuestion.answers!), Real Answer:\(currentQuestion.answer!)")
        makeQuestions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // pass an int to select question
    func makeQuestions() {
        qLabel.text = "\(Questions[0].question!)"
        print(qLabel.text!)
        var y = 80
        for answer in Questions[0].answers {
            let button = UIButton(frame: CGRect(x: 130, y: y, width: 100, height: 50))
            button.backgroundColor = .blue
            button.setTitle("\(answer)", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            y += 70
        }
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        selectedAnswer = sender.titleLabel!.text!
        print(selectedAnswer)
    }
    
    @IBOutlet weak var qLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : AnswerController = segue.destination as! AnswerController
        DestViewController.givenAnswer = selectedAnswer
        DestViewController.realAnswer = Questions[0].answers[Questions[0].answer]
        print(DestViewController.givenAnswer)
        print(DestViewController.realAnswer)
    }
}

