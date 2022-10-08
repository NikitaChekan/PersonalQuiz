//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Chekan on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    // Передать массив с ответами на экран с результатами
    // Определить наиболее часто встречающийся тип животного
    // Отобразить результаты в соответствии с этим животным
    
//    [PersonalQuiz.Answer(title: "Стейк", animal: PersonalQuiz.Animal.dog),
//     PersonalQuiz.Answer(title: "Плавать", animal: PersonalQuiz.Animal.dog),
//     PersonalQuiz.Answer(title: "Ненавижу", animal: PersonalQuiz.Animal.cat)]
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)

    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print(answersChosen)
    }
//    deinit {
//        print("\(type(of: self)) has been deallocated")
//    }
    
}
