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
    var current : Int?
    var correct : Int?
    var qLength : Int?
    
    @IBOutlet weak var exit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(current!)
        print(correct!)
        print("Got here")
        readQuestions()
        qLength = Questions.count
        print(qLength!)
        print(current!)
        if (qLength! == current!) {
            print("Got to segue thingy")
            //self.performSegue(withIdentifier: "finalSegue", sender: self)
            qLabel.text = "All questions complete! Hit exit!"

        } else {
            let currentQuestion = Questions[current!]
            print("Question: \(currentQuestion.question!), Answers: \(currentQuestion.answers!), Real Answer:\(currentQuestion.answer!)")
            makeQuestions()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // pass an int to select question
    func makeQuestions() {
        qLabel.text = "\(Questions[current!].question!)"
        print(qLabel.text!)
        var y = 80
        for answer in Questions[current!].answers {
            let button = UIButton(frame: CGRect(x: 120, y: y, width: 150, height: 50))
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
    
    func readQuestions() {
        let mainPath = Bundle.main.path(forResource: "/\(type!)", ofType: "txt")
        print(mainPath!)
        do {
            let data = try String(contentsOfFile: mainPath!, encoding: .utf8)
            let myStrings = data.components(separatedBy: .newlines)
            print(myStrings)
            var i = 0
            while (i < myStrings.count - 1) {
                let prompt = myStrings[i]
                i += 1
                let numQ = Int(myStrings[i])!
                i += 1
                var qList = [String]()
                for index in i...(i + numQ - 1) {
                    qList.append(myStrings[index])
                }
                i += numQ
                let answer = Int(myStrings[i])
                print(prompt)
                print(qList)
                print(answer!)
                Questions.append(Question(question: prompt, answers: qList, answer: answer))
                i += 1
            }
        } catch {
            print(error)
        }
    }
    
    @IBOutlet weak var qLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "exitSegue" || segue.identifier == "finalSegue") {
            let DestViewController : FinishedController = segue.destination as! FinishedController
            DestViewController.current = current!
            DestViewController.correct = correct!
        } else {
            let DestViewController : AnswerController = segue.destination as! AnswerController
            DestViewController.givenAnswer = selectedAnswer
            DestViewController.realAnswer = Questions[current!].answers[Questions[current!].answer]
            DestViewController.type = type
            DestViewController.current = current!
            DestViewController.correct = correct!
            DestViewController.qLength = qLength!
        }
    }
}

