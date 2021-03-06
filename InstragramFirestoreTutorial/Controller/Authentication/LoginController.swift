//
//  LoginController.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    // Define Instagram logo
    private let iconImage: UIImageView = {
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        imageIcon.contentMode = .scaleAspectFill
        return imageIcon
    }()
    
    // Define email input
    private let emailTextField: UITextField = {
        let inputEmail = CustomTextField(placeholder: "E-mail")
        
        // Make the keyboard for email
        inputEmail.keyboardType = .emailAddress
        
        // Set keyboard to email type
        inputEmail.keyboardType = .emailAddress
        
        // Disable auto capitalize
        inputEmail.autocapitalizationType = .none;
        
        return inputEmail
    }()
    
    // Define password input
    private let passwordTextField: UITextField = {
        let inputPassword = CustomTextField(placeholder: "Password")
        
        // Make characters typped hidden
        inputPassword.isSecureTextEntry = true
        
        return inputPassword
    }()
    
    // Define log in button
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4374820559, green: 0.2786109558, blue: 0.770463198, alpha: 0.5977632705)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    // Define sign up button
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
        
        let attributedTitle = NSMutableAttributedString(string: "Não tem uma conta?  ", attributes: attrs)
        
        let boldAttrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        attributedTitle.append(NSAttributedString(string: "Registre-se", attributes: boldAttrs))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    // Define forgotPassword button
    private let forgotPassword: UIButton = {
        let button = UIButton(type: .system)
        
        let attrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
        
        let attributedTitle = NSMutableAttributedString(string: "Esqueceu sua senha?  ", attributes: attrs)
        
        let boldAttrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        attributedTitle.append(NSAttributedString(string: "Clique aqui", attributes: boldAttrs))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        // Hide navigation top bar
        navigationController?.navigationBar.isHidden = true
        
        // Set status bar to white color
        navigationController?.navigationBar.barStyle = .black
        
        // Creates gradient background
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        
        // Adds the gradient above the main layer
        view.layer.addSublayer(gradient)
        
        // Setting gradient dimensions to fill whole screen
        gradient.frame = view.frame
        
        // Setting gradient to be half page down
        gradient.locations = [0, 2]
        
        
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
}
