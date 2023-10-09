//
//  ViewController.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 05.08.23.
//

import UIKit


final class CalculatorViewController: UIViewController {
    //MARK: -  Definition of components
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.register(NumberTextView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NumberTextView.identifier)
        
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        
        return collectionView
    }()
    
    //MARK: - Calculator buttons
    
    let calculatorButtons: [CalculatorButton] = [
        .ac, .plusMinus, .percent, .divison, .number(7), .number(8), .number(9), .multiple, .number(4), .number(5), .number(6), .minus, .number(1), .number(2), .number(3), .plus, .number(0), .dot, .equal
    ]
    
    public let mathOperationLogicManager = MathOperationLogicManager()
    
    //MARK: - applicationMain
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupComponents()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - setup components
    
    private func setupComponents() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: CollectionView DelegateFlowLayout

extension CalculatorViewController: UICollectionViewDelegateFlowLayout {
    
}

//MARK: SendInformation

extension CalculatorViewController: SendCalculatorText {
    func sendInformation() {
        mathOperationLogicManager.swipeAction()
        collectionView.reloadData()
    }
}
