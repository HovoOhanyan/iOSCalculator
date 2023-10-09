//
//  CalculatorCollectionViewDataSourceExtension.swift
//  Calculator
//
//  Created by Hovo Ohanyan on 08.08.23.
//

import Foundation
import UIKit

extension CalculatorViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NumberTextView.identifier, for: indexPath) as? NumberTextView else { fatalError() }
        
        header.delegate = self
        header.configuare(upperCalculatorText: mathOperationLogicManager.calculatorText)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       
        return CGSize(width: view.frame.size.width,
                      height: 260
        )
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calculatorButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
        
        cell.configuration(calculatorButton: calculatorButtons[indexPath.row])
        cell.isHighlighted = true
        cell.isSelected = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch calculatorButtons[indexPath.row] {
        case .number(let int) where int == 0:
            return CGSize(width: (view.frame.self.width / 5) * 2 + ((view.frame.self.width / 5) / 3),
                          height: view.frame.size.width / 5)
        default:
            return CGSize(width: view.frame.size.width / 5,
                          height: view.frame.size.width / 5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch calculatorButtons[indexPath.row] {
        case .ac:
            mathOperationLogicManager.acButtonTapped()
            collectionView.reloadData()
        case .plusMinus:
            mathOperationLogicManager.plusMinusButtonTapped()
            collectionView.cellForItem(at: indexPath)?.isSelected = true
            collectionView.reloadData()
        case .percent:
            mathOperationLogicManager.percentButtonTapped()
            collectionView.reloadData()
        case .divison:
            mathOperationLogicManager.divisonButtonTapped()
            collectionView.reloadData()
        case .multiple:
            mathOperationLogicManager.multipleButtonTapped()
            collectionView.reloadData()
        case .minus:
            mathOperationLogicManager.minusButtonTapped()
            collectionView.reloadData()
        case .plus:
            mathOperationLogicManager.plusButtonTapped()
            collectionView.reloadData()
        case .number(let number):
            mathOperationLogicManager.numberButtonTaped(with: number)
            collectionView.reloadData()
        case .equal:
            mathOperationLogicManager.equalButtonTapped()
            collectionView.reloadData()
        case .dot:
            mathOperationLogicManager.dotButtonTaped()
            collectionView.reloadData()
        }
    }
}
