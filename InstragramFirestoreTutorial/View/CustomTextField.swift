//
//  CustomTextField.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 05/03/21.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        borderStyle = .none
        textColor = .white
        
        // Set keyboard dark style
        keyboardAppearance = .dark
        
        // Let input a little transparent
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        setHeight(50)
        layer.cornerRadius = 5
    
        // Let input placeholder a little transparent
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        // Placeholder e input value paddingLeft 20
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 20)
        leftView = spacer
        leftViewMode = .always
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
