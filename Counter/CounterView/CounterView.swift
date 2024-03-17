//
//  View.swift
//  Counter
//
//  Created by Roman Romanov on 17.03.2024.
//

import UIKit

final class CounterView: UIView {
    
    lazy var plusButton: UIButton = {
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
    
    lazy var minusButton: UIButton = {
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
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "arrow.circlepath")
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)
        button.tintColor = .gray

        return button
    }()
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 120, weight: .bold)
        
        return label
    }()
    
    lazy var historyTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .gray
        textView.text = "История изменений:"
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(resetButton)
        addSubview(counterLabel)
        addSubview(historyTextView)
        addSubview(plusButton)
        addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            historyTextView.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 10),
            historyTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            historyTextView.heightAnchor.constraint(equalToConstant: 200),
            historyTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            historyTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            resetButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            plusButton.topAnchor.constraint(equalTo: historyTextView.bottomAnchor, constant: 10),
            plusButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -60),
            plusButton.heightAnchor.constraint(equalToConstant: 70),
            plusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            minusButton.topAnchor.constraint(equalTo: historyTextView.bottomAnchor, constant: 10),
            minusButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            minusButton.heightAnchor.constraint(equalToConstant: 70),
            minusButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
        ])
    }
}
