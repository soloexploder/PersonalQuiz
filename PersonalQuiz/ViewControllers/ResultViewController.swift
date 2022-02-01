//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Даниил Хантуров on 29.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var discriptionAnimalLabel: UILabel!
    
    var answersChoosen: [Answer]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResults()
    }
}

extension ResultViewController {
    
    private func updateResults() {
        
        var frequencyAnimal: [AnimalType: Int] = [:]
        let animals = answersChoosen.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyAnimal[animal] {
                frequencyAnimal.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyAnimal[animal] = 1
            }
        }
        
        let sortedFrequencyAnimal = frequencyAnimal.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyAnimal.first?.key else {return}
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        discriptionAnimalLabel.text = "\(animal.definition)"
    }
}
