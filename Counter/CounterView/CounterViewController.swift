//
//  CounterViewController.swift
//  Counter
//
//  Created by Roman Romanov on 17.03.2024.
//

import UIKit

final class CounterViewController: UIViewController {
    
    private let counterView = CounterView()
    
    private var isCounterReset: Bool = false
    
    private var counter: Int = 0 {
        didSet {
            var logText = "значение изменено на +1"
            
            if counter < 0 {
                counter = 0
                logText = "попытка уменьшить значение счётчика ниже 0"
            } else {
                if oldValue > counter {
                    logText = "значение изменено на -1"
                }
            }
            
            if isCounterReset {
                logText = "значение сброшено"
                isCounterReset = false
            }

            writeToLog(text: logText)
            setupCounterValue()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("launched")
        
        view = counterView
        
        setupCounterValue()
        setupButton()
    }
    
    private func setupButton() {
        counterView.plusButton.addTarget(self, action: #selector(tapPlusAction), for: .touchUpInside)
        counterView.minusButton.addTarget(self, action: #selector(tapMinusAction), for: .touchUpInside)
        counterView.resetButton.addTarget(self, action: #selector(tapResetButton), for: .touchUpInside)
    }

    private func setupCounterValue() {
        counterView.counterLabel.text = counter.formatted()
    }
    
    private func writeToLog(text logText: String) {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = "\(date.string(from: .now))"
        counterView.historyTextView.text += "\n[\(dateString)]: \(logText)"
        let range = NSMakeRange(counterView.historyTextView.text.count - 1, 0)
        counterView.historyTextView.scrollRangeToVisible(range)
    }

    @objc private func tapPlusAction() {
        counter += 1
    }
    
    @objc private func tapMinusAction() {
        counter -= 1
    }
    
    @objc private func tapResetButton() {
        isCounterReset = true
        counter = 0
    }

}
