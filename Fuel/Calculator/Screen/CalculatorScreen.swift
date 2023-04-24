//
//  CalculatorScreen.swift
//  Fuel
//
//  Created by Diego Rodrigues on 25/03/23.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedcalculateButton()
    func tappedBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    
    public func delegate(delegate: CalculatorScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroudImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
       return image
    }()
    
    lazy var logoAppImageView:  UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var ethanolPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do Alcool"
        textField.textColor = .darkGray
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var gasolinePriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do Gasolina"
        textField.textColor = .darkGray
        textField.addDoneButtonOnKeyboard()
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedcalculateButton()
    }
    
    lazy var backButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
       return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroudImage)
        addSubview(logoAppImageView)
        addSubview(ethanolPriceTextField)
        addSubview(gasolinePriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            backgroudImage.topAnchor.constraint(equalTo: topAnchor),
            backgroudImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroudImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroudImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            ethanolPriceTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 134),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasolinePriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant: 16),
            gasolinePriceTextField.leadingAnchor.constraint(equalTo: ethanolPriceTextField.leadingAnchor),
            gasolinePriceTextField.trailingAnchor.constraint(equalTo: ethanolPriceTextField.trailingAnchor),
            gasolinePriceTextField.heightAnchor.constraint(equalTo: ethanolPriceTextField.heightAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),

            

        ])
        
        
    }
   
}
