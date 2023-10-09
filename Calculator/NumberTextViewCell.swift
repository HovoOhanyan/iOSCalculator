//
//  NumberTextViewCell.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 07.08.23.
//

import Foundation
import UIKit

final class NumberTextView: UICollectionReusableView {
    static let identifier = "NumberTextView"
    var delegate: SendCalculatorText!
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.text = "0"
        label.font = .systemFont(ofSize: 72)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public func configuare(upperCalculatorText: String) {
        label.text = upperCalculatorText
    }
    
    private func setupUI() {
        self.backgroundColor = .black
        self.addSubview(label)
        
        let leadingSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleLeadingSwipe))
        leadingSwipeGestureRecognizer.direction = .right
        self.addGestureRecognizer(leadingSwipeGestureRecognizer)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    @objc private func handleLeadingSwipe() {
        print("remove")

        delegate?.sendInformation()
    }
}
