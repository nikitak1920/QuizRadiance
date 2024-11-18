//
//  Question1ViewController.swift
//  QuizRadiance
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class Question1ViewController: UIViewController {

        // Define buttons
        var maleButton: UIButton!
        var femaleButton: UIButton!
        
        // Define custom pink color
        let customPink = UIColor(red: 0.93, green: 0.52, blue: 0.58, alpha: 1.0)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize and configure buttons
            maleButton = createButton(withTitle: "Male", icon: "male_icon")
            femaleButton = createButton(withTitle: "Female", icon: "female_icon")
            
            // Add buttons to the view and set up layout
            setupButtons()
        }
        
        // Function to create a button with a title and icon
        func createButton(withTitle title: String, icon iconName: String) -> UIButton {
            let button = UIButton(type: .system)
            
            // Set title and color
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 2
            button.layer.borderColor = customPink.cgColor
            button.backgroundColor = .white
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            
            // Set icon image for button
            if let icon = UIImage(named: iconName) {
                button.setImage(icon, for: .normal)
                button.imageView?.contentMode = .scaleAspectFit
                button.tintColor = .black
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            }
            
            return button
        }
        
        func setupButtons() {
            // Layout for maleButton
            maleButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(maleButton)
            
            // Layout for femaleButton
            femaleButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(femaleButton)
            
            // Adjust the positioning of buttons under the "Gender" label
            NSLayoutConstraint.activate([
                maleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                maleButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
                maleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 345), // Adjust this constant to place under "Gender"
                maleButton.heightAnchor.constraint(equalToConstant: 60),
                
                femaleButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
                femaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                femaleButton.topAnchor.constraint(equalTo: maleButton.topAnchor),
                femaleButton.heightAnchor.constraint(equalTo: maleButton.heightAnchor)
            ])
            
            // Add actions for button taps
            maleButton.addTarget(self, action: #selector(maleButtonTapped), for: .touchUpInside)
            femaleButton.addTarget(self, action: #selector(femaleButtonTapped), for: .touchUpInside)
            
            // Set initial styles
            styleButton(maleButton, isSelected: false)
            styleButton(femaleButton, isSelected: false)
        }
        
        func styleButton(_ button: UIButton, isSelected: Bool) {
            if isSelected {
                // Set custom pink color for selected button
                button.backgroundColor = customPink
                button.setTitleColor(.white, for: .normal)
            } else {
                // Set custom pink border for unselected button
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
                button.layer.borderColor = customPink.cgColor
            }
        }
        
        // Button tap actions
        @objc func maleButtonTapped() {
            styleButton(maleButton, isSelected: true)
            styleButton(femaleButton, isSelected: false)
        }
        
        @objc func femaleButtonTapped() {
            styleButton(maleButton, isSelected: false)
            styleButton(femaleButton, isSelected: true)
        }
    }
