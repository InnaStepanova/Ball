//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    
    private lazy var ballImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ball1")
        return image
    }()
    
    private lazy var askMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything..."
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.textColor = .white
        return label
    }()
    
    private lazy var askButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ask", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Helvetica-bold", size: 20)
        button.titleLabel?.textColor = .blue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addViews()
        layout()
    }
    @objc func askButtonPressed() {
        ballImage.image = ballArray.randomElement()
    }
}

extension ViewController {
    private func addViews() {
        view.addSubview(ballImage)
        view.addSubview(askButton)
        view.addSubview(askMeLabel)
    }
    
    private func layout() {
        ballImage.translatesAutoresizingMaskIntoConstraints = false
        askButton.translatesAutoresizingMaskIntoConstraints = false
        askMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ballImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ballImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            ballImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            askMeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            askMeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.topAnchor.constraint(equalTo: ballImage.bottomAnchor, constant: 50),
            askButton.heightAnchor.constraint(equalToConstant: 50),
            askButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
