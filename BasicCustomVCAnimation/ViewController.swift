//
//  ViewController.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-15.
//

import UIKit

class ViewController: UIViewController {
    
    var navControllerDelegate: NavControllerDelegate?
    
    fileprivate let resultsButton: UIButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.configuration?.title = "VIEW RESULTS"
        button.configuration?.buttonSize = .large
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        resultsButton.addTarget(self, action: #selector(showResults(_:)), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(resultsButton)
        NSLayoutConstraint.activate([
            resultsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultsButton.heightAnchor.constraint(equalToConstant: 50),
            resultsButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navControllerDelegate = navigationController?.delegate as? NavControllerDelegate
    }

    @objc fileprivate func showResults(_ sender: UIButton) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

}

