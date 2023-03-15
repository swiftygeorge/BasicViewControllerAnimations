//
//  ViewController.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func showResults(_ sender: UIButton) {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }

}

