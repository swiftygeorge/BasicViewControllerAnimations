//
//  SecondViewController.swift
//  BasicCustomVCAnimation
//
//  Created by George Mapaya on 2023-03-15.
//

import UIKit

class SecondViewController: UIViewController {
    
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "face.smiling")
        imageView.image = image
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }

}
