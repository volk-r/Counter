//
//  ViewController.swift
//  Counter
//
//  Created by Roman Romanov on 17.03.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var counter: Int = 0 {
        didSet {
            if counter < 0 {
                counter = 0
            }
        }
    }
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 20
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 20
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "arrow.circlepath")
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)
        button.tintColor = .gray

        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 120, weight: .bold)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("launched")
        
        setupCounterValue()
        setupButton()
        layout()
    }
    
    private func setupButton() {
        plusButton.addTarget(self, action: #selector(tapPlusAction), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(tapMinusAction), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(tapResetButton), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(resetButton)
        view.addSubview(counterLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            
            resetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            plusButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 5),
            plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            plusButton.heightAnchor.constraint(equalToConstant: 70),
            plusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            minusButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 5),
            minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60),
            minusButton.heightAnchor.constraint(equalToConstant: 70),
            minusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
        ])
    }

    private func setupCounterValue() {
        counterLabel.text = counter.formatted()
    }

    @objc private func tapPlusAction() {
        counter += 1
        setupCounterValue()
    }
    
    @objc private func tapMinusAction() {
        counter -= 1
        setupCounterValue()
    }
    
    @objc private func tapResetButton() {
        print("reset counter")
        counter = 0
        setupCounterValue()
    }


}
