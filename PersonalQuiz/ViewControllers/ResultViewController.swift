//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Chekan on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
}
