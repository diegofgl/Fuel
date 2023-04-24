//
//  CalculatorVC.swift
//  Fuel
//
//  Created by Diego Rodrigues on 25/03/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen: CalculatorScreen?
    var alert: Alert?
    
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        hidekeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextFields() -> Bool {
        
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false}
        guard let gasolinePrice = screen?.gasolinePriceTextField.text else { return false}
        
        if ethanolPrice.isEmpty && gasolinePrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do Alcool e da Gasolina")
            return false
        }else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do Alcool")
            return false
        }else if gasolinePrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do Gasolina")
            return false
            
        }
        return true
    }
    
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedcalculateButton() {


    if validateTextFields() {
           let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasolinePrice: Double = (formatter.number(from: screen?.gasolinePriceTextField.text ?? "0.0") as? Double) ?? 0.0

        var vc: ResultVC?
            if ethanolPrice / gasolinePrice > 0.7 {
                print("Melhor utilizar Gasolina")
                vc = ResultVC(bestFuel: .gasoline)
           }else{
                print("Melhor utilizar Alcool")
               vc = ResultVC(bestFuel: .etanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
