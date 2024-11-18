//
//  Question4ViewController.swift
//  QuizRadiance
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class Question4ViewController: UIViewController {

    let skinGoal = ["Hydration", "Acne Free", "Anti-Aging", "Sun Protection", "Even Skin Tone", "Face Glow"]
    
    // Define custom pink color
    let customPink = UIColor(red: 0.93, green: 0.52, blue: 0.58, alpha: 1.0) // Customize this color as needed

        override func viewDidLoad() {
            super.viewDidLoad()

            // Create and configure the heading label
            let headingLabel = UILabel()
            // Add the heading label to the main view
            view.addSubview(headingLabel)

            // Create and configure the vertical stack view
            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.alignment = .fill
            verticalStackView.distribution = .fillEqually
            verticalStackView.spacing = 15 // Increase spacing between rows
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false

            // Add the vertical stack view to the main view
            view.addSubview(verticalStackView)

            // Set constraints for the heading label
            NSLayoutConstraint.activate([
                headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])

            // Set constraints for the vertical stack view to place it 30 points below the heading label
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 215),
                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])

            // Define the number of buttons per row
            let buttonsPerRow = 2
            var currentHorizontalStackView: UIStackView?

            // Loop through the skin concerns and create buttons
            for (index, concern) in skinGoal.enumerated() {
                
                if index % buttonsPerRow == 0 {
                    currentHorizontalStackView = UIStackView()
                    currentHorizontalStackView?.axis = .horizontal
                    currentHorizontalStackView?.alignment = .fill
                    currentHorizontalStackView?.distribution = .fillEqually
                    currentHorizontalStackView?.spacing = 10
                    
                    // Add the new horizontal stack to the vertical stack
                    if let horizontalStack = currentHorizontalStackView {
                        verticalStackView.addArrangedSubview(horizontalStack)
                    }
                }
                
                
                let button = UIButton(type: .system)
                button.setTitle(concern, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.borderWidth = 1.5
                button.layer.borderColor = customPink.cgColor
                button.layer.cornerRadius = 15
                button.backgroundColor = .white
                
                // Set font size to 17
                button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
                
                // Set button height to make it bigger
                button.heightAnchor.constraint(equalToConstant: 60).isActive = true 

                // Add an action to handle button tap
                button.addTarget(self, action: #selector(concernButtonTapped(_:)), for: .touchUpInside)

                // Add the button to the current horizontal stack view
                currentHorizontalStackView?.addArrangedSubview(button)
            }
        }

        // Action for button tap to toggle selection color
        @objc func concernButtonTapped(_ sender: UIButton) {
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

