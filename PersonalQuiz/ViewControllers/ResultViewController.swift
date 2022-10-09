//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Chekan on 06.10.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        
        identifiesTheAnimal()
        identifiesDefinitionForAnimal()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func identifiesTheAnimal() {
        let animals = answersChosen.map { String($0.animal.rawValue) }
        print(animals)
        
        let countedSet = NSCountedSet(array: animals)
        
        let resultAnimal = countedSet.max { countedSet.count(for: $0) < countedSet.count(for: $1) }
        resultAnimalLabel.text = "Вы - \(resultAnimal ?? "")"
    }
    
    private func identifiesDefinitionForAnimal() {
        let difenittion = answersChosen.map { $0.animal.definition }
        print(difenittion)
        
        let sumto = NSCountedSet(array: difenittion)
        
        let resultDifenittion = sumto.max { sumto.count(for: $0) < sumto.count(for: $1) }
        resultDefinitionLabel.text = (resultDifenittion as? String)
    }

}
