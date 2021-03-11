//
//  AuthenticationViewModel.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 10/03/21.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct RegistrationViewModel {
    
}
