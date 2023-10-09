//
//  ButtonCell.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 05.08.23.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    static let identifier = "ButtonCell"
    
    public var calculatorButton: CalculatorButton!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = calculatorButton.selectedColor
            } else {
                self.backgroundColor = calculatorButton.color
            }
        }
    }
    
    private let buttonTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .regular)
        
        return label
    }()
    
    public func configuration(calculatorButton: CalculatorButton) {
        self.calculatorButton = calculatorButton
        
        self.buttonTitle.text = calculatorButton.title
        self.backgroundColor = calculatorButton.color
        
        self.buttonTitle.textColor = calculatorButton.textColor
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(buttonTitle)
        
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        switch self.calculatorButton {
        case .number(let int) where int == 0:
            self.layer.cornerRadius = 36
            
            NSLayoutConstraint.activate([
                buttonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                buttonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                buttonTitle.heightAnchor.constraint(equalToConstant: self.frame.height),
                buttonTitle.widthAnchor.constraint(equalToConstant: self.frame.width),
                buttonTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                buttonTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        default:
            self.layer.cornerRadius = self.bounds.width / 2
            
            NSLayoutConstraint.activate([
                buttonTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                buttonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                buttonTitle.heightAnchor.constraint(equalTo: self.heightAnchor),
                buttonTitle.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
        }
    }
}
