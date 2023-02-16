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
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    private lazy var ballImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ball1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var askMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything..."
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.textColor = .white
        return label
    }()
    
    private var buttonView: UIView = {
        let view = UIView()
        return view
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
        print("Tapped")
    }
}

extension ViewController {
    private func addViews() {
        view.addSubview(stackView)
        buttonView.addSubview(askButton)
        stackView.addArrangedSubview(askMeLabel)
        stackView.addArrangedSubview(ballImage)
        stackView.addArrangedSubview(buttonView)
        
    }
    
    private func layout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        askButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            
            buttonView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            askButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            askButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            askButton.heightAnchor.constraint(equalToConstant: 50),
            askButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

