//
//  ResultVCViewController.swift
//  Fuel
//
//  Created by Diego Rodrigues on 13/04/23.
//

import UIKit

enum BestFuel: String {
    case gasoline = "Gasolina"
    case etanol = "Alcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    var bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue

    }
    
    func popViewControler() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultVC: ResultScreenDelegate {
    func tappedBackButton() {
        popViewControler()
    }
    
    func tappedCalculateButton() {
        popViewControler()

    }
}
