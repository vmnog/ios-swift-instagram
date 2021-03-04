//
//  LoginController.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let imageIcon = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        imageIcon.contentMode = .scaleAspectFill
        return imageIcon
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
        
        // Starts gradient from the top to the bottom
        gradient.locations = [0, 1]
        
        // Adds the gradient above the main layer
        view.layer.addSublayer(gradient)
        
        // Setting gradient dimensions to fill whole screen
        gradient.frame = view.frame
        
        
        // Adds instagram logo
        view.addSubview(iconImage)
        
        // Center image vertically
        iconImage.centerX(inView: view)
        
        iconImage.setDimensions(height: 80, width: 120)
        
        // Set image to the top of the screen
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
    }
}
