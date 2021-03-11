//
//  AuthenticationViewModel.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 10/03/21.
//

import UIKit

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.4374820559, green: 0.2786109558, blue: 0.770463198, alpha: 0.5977632705) : #colorLiteral(red: 0.4374820559, green: 0.2786109558, blue: 0.770463198, alpha: 0.1479826627)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.5)
    }
}

struct RegistrationViewModel {
    
}
