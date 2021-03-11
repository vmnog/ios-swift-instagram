//
//  LoginController.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    private var viewModel = LoginViewModel()
    
    // Define Instagram logo
    private let iconImage: UIImageView = {
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        imageIcon.contentMode = .scaleAspectFill
        return imageIcon
    }()
    
    // Define email input
    private let emailTextField: CustomTextField = {
        let inputEmail = CustomTextField(placeholder: "E-mail")
        
        // Make the keyboard for email
        inputEmail.keyboardType = .emailAddress
        
        // Disable auto capitalize
        inputEmail.autocapitalizationType = .none;
        
        return inputEmail
    }()
    
    // Define password input
    private let passwordTextField: CustomTextField = {
        let inputPassword = CustomTextField(placeholder: "Senha")
        
        // Make characters typped hidden
        inputPassword.isSecureTextEntry = true
        
        return inputPassword
    }()
    
    // Define log in button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.styleAsAuthButton(label: "Entrar")
        
        return button
    }()
    
    // Define forgotPassword button
    private let forgotPassword: UIButton = {
        let button = UIButton(type: .system)
        
        // Uses UIButton created in Utils/Extensions
        button.attributedTitle(firstPart: "Esqueceu sua senha?", secondPart: "Clique aqui")
        
        return button
    }()
    
    // Define sign up button
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        // Uses UIButton created in Utils/Extensions
        button.attributedTitle(firstPart: "Não tem uma conta?", secondPart: "Registre-se")
        
        // addTarget(class that will handle the action, custom function handler, name of user event)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Actions
    
    @objc func handleShowSignUp() {
        // Create instance of Register Screen
        let registerScreen = RegistrationController()
        
        // Tells our navigationController to navigate to the Register Screen
        navigationController?.pushViewController(registerScreen, animated: true)
        
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
         
        if sender == passwordTextField {
            viewModel.password = sender.text
        }
        
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        // Creates gradient background
        configureGradientLayer()
        
        // Hide navigation top bar
        navigationController?.navigationBar.isHidden = true
        
        // Set status bar to white color
        navigationController?.navigationBar.barStyle = .black
        
        // Adds instagram logo
        view.addSubview(iconImage)
        
        // Center image vertically
        iconImage.centerX(inView: view)
        
        iconImage.setDimensions(height: 80, width: 120)
        
        // Set image to the top of the screen
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        // Creates a vertical stack
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPassword])
        
        // Makes stack vertical
        stack.axis = .vertical
        stack.spacing = 20
        
        // Adds input vertical stack
        view.addSubview(stack)
        
        // Align the stack below the instagram logo and centered
        stack.anchor(
            top: iconImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: 32
        )
        
        // Adds sign up button at the bottom screen centered
        view.addSubview(signUpButton)
        signUpButton.centerX(inView: view)
        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
     
    }
    
    func configureNotificationObservers() {
        
        // When email or password calls textDidChange
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

    }
}
