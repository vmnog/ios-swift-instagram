//
//  RegistrationController.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties
    
    private var viewModel = RegistrationViewModel()
    
    // Define add photo button
    private let plushPhotoButton: UIButton = {
        let button = UIButton(type: .system)
       
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.setDimensions(height: 140, width: 140)
        button.addTarget(self, action: #selector(addUserPhoto), for: .touchUpInside)

        
        return button
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
    
    // Define fullname input
    private let fullnameTextField = CustomTextField(placeholder: "Nome completo")
    
    // Define username input
    private let usernameTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Usuário")
        
        tf.autocapitalizationType = .none;
        
        return tf
    }()
    
    // Define log in button
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.styleAsAuthButton(label: "Continuar")
        
        return button
    }()
    
    // Define back to login button
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.attributedTitle(firstPart: "Já possui uma conta ?", secondPart: "Clique aqui")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Actions
    
    // When pressed it removes the top layer navigation (goBack)
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
         
        if sender == passwordTextField {
            viewModel.password = sender.text
        }
        
        if sender == usernameTextField {
            viewModel.username = sender.text
        }
        
        if sender == fullnameTextField {
            viewModel.fullname = sender.text
        }
        
        updateForm()
        
    }
    
    @objc func addUserPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        // Creates gradient background
        configureGradientLayer()
                
        // Hide navigation top bar
        navigationController?.navigationBar.isHidden = true
        
        // Set status bar to white color
        navigationController?.navigationBar.barStyle = .black
        
        // Adds User's picture add button
        view.addSubview(plushPhotoButton)
        plushPhotoButton.centerX(inView: view)
        plushPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        // Creates a vertical stack
        let stack = UIStackView(
                arrangedSubviews: [
                    emailTextField,
                    passwordTextField,
                    usernameTextField,
                    fullnameTextField,
                    signUpButton
                ])
        
        // Makes stack vertical
        stack.axis = .vertical
        stack.spacing = 20
        
        // Adds input vertical stack
        view.addSubview(stack)
        
        // Align the stack below the instagram logo and centered
        stack.anchor(
            top: plushPhotoButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: 32
        )
        
        // Adds alreadyHaveAccountButton
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }
    
    func configureNotificationObservers() {
        
        // When user changes inputs -> textDidChange
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

    }
}

// MARK: - FormViewModel

extension RegistrationController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Handling when user finishs selecting photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Getting the selectedImage from imagePicker
        guard let selectedImage = info[.editedImage] as? UIImage else { return  }
        
        // Making button rounded
        plushPhotoButton.layer.cornerRadius = plushPhotoButton.frame.width / 2
        
        // Limits sublayers from button to not overlay the button size
        plushPhotoButton.layer.masksToBounds = true
        
        // Change borderColor
        plushPhotoButton.layer.borderColor = UIColor.white.cgColor
        
        // Change borderWidth
        plushPhotoButton.layer.borderWidth = 2
        
        // Putting image above button without modifying its dimensions
        plushPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)

        // Closes image picker
        self.dismiss(animated: true, completion: nil)
    }
}
