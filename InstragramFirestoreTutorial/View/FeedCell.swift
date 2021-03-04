//
//  FeedCell.swift
//  InstragramFirestoreTutorial
//
//  Created by Victor Nogueira on 04/03/21.
//

import UIKit

class FeedCell: UICollectionViewCell {
    // MARK: - Properties
    
    // Defines posts users picture properties
    private let profileImageView: UIImageView = {
        let userProfilePicture = UIImageView();
        userProfilePicture.contentMode = .scaleAspectFill
        userProfilePicture.clipsToBounds = true
        userProfilePicture.isUserInteractionEnabled = true
        userProfilePicture.image = #imageLiteral(resourceName: "venom-7")
        return userProfilePicture
    }()
    
    
    // Defines username button
    private lazy var usernameButton: UIButton = {
        let profileButton = UIButton(type: .system)
        
        // Post username
        profileButton.setTitle("venom", for: .normal)
        profileButton.setTitleColor(.black, for: .normal)
        profileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        // Press event calls didTapUsername handler function
        profileButton.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return profileButton
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // Adds image to the post
        addSubview(profileImageView)
        
        // Image aligment
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        // Image size
        profileImageView.setDimensions(height: 40, width: 40)
        
        // Make image a circle
        profileImageView.layer.cornerRadius = 40 / 2
        
        // Adds username button to the post
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
    }
    
    // Required default constructor
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    // Handler -> When user clicks posts owner username
    @objc func didTapUsername() {
        print("clicou")
    }
}
