//
//  Question3ViewController.swift
//  QuizRadiance
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class Question3ViewController: UIViewController {

        // Define button titles for skin types
        let skinTypes = ["Normal", "Dry", "Oily", "Sensitive", "Combination"]
        
        // Define custom pink color
        let customPink = UIColor(red: 0.93, green: 0.52, blue: 0.58, alpha: 1.0)

        override func viewDidLoad() {
            super.viewDidLoad()

            // Set the background color of the view
            view.backgroundColor = .white

            // Create and configure the heading label
            let headingLabel = UILabel()
            
            // Add the heading label to the main view
            view.addSubview(headingLabel)

            // Create and configure the vertical stack view for buttons
            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.alignment = .fill
            verticalStackView.distribution = .fillEqually
            verticalStackView.spacing = 20 
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false

            // Add the vertical stack view to the main view
            view.addSubview(verticalStackView)

            // Set constraints for the heading label
            NSLayoutConstraint.activate([
                headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])

            // Set constraints for the vertical stack view
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 215),
                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ])

            // Loop through skin types to create buttons
            for skinType in skinTypes {
                // Create a button for each skin type
                let button = UIButton(type: .system)
                button.setTitle(skinType, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.borderWidth = 1.5
                button.layer.borderColor = customPink.cgColor
                button.layer.cornerRadius = 15
                button.backgroundColor = .white
                button.titleLabel?.font = UIFont.systemFont(ofSize: 17)

                // Add an action to handle button taps
                button.addTarget(self, action: #selector(skinTypeButtonTapped(_:)), for: .touchUpInside)
                
                // Set button height
                button.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
                // Add the button to the vertical stack view
                verticalStackView.addArrangedSubview(button)
            }
        }

        // Action for button tap to toggle selection state
        @objc func skinTypeButtonTapped(_ sender: UIButton) {
            if sender.backgroundColor == customPink {
                // Deselect the button (change to white background)
                sender.backgroundColor = .white
                sender.setTitleColor(.black, for: .normal)
            } else {
                // Select the button (change to pink background)
                sender.backgroundColor = customPink
                sender.setTitleColor(.white, for: .normal)
            }
        }
    }
