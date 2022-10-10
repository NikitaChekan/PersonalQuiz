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
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // Мой вариант неправильный но рабочий
//    private func identifiesTheAnimal() {
//        let animals = answersChosen.map { String($0.animal.rawValue) }
//        let countedSet = NSCountedSet(array: animals)
//
//        let resultAnimal = countedSet.max {
//            countedSet.count(for: $0) < countedSet.count(for: $1)
//        }
//        resultAnimalLabel.text = "Вы - \(resultAnimal ?? "")"
//    }
//
//    private func identifiesDefinitionForAnimal() {
//        let definitions = answersChosen.map { $0.animal.definition }
//        let countedSet = NSCountedSet(array: definitions)
//
//        let resultDifenittion = countedSet.max {
//            countedSet.count(for: $0) < countedSet.count(for: $1)
//        }
//        resultDefinitionLabel.text = (resultDifenittion as? String)
//    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        // Вариант 1
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        // Вариант 2
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//        }
        
        // Вариант 3
//        for animal in animals {
//            frequencyOfAnimals[animal, default: 0] += 1
//        }
        
        // Вариант 4 весь метод в одну строку без создания массивов и сортировки. Все это делается тут
//        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal }
//            .sorted { $0.value.count > $1.value.count }
//            .first?.key
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)"
        resultDefinitionLabel.text = animal.definition
    }
}
