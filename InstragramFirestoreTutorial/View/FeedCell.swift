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
    
    // Defines post image
    private let postImageView: UIImageView = {
        let imagePost = UIImageView()
        // Image will fill all the container
        imagePost.contentMode = .scaleAspectFill
        imagePost.clipsToBounds = true
        imagePost.isUserInteractionEnabled = true
        imagePost.image = #imageLiteral(resourceName: "venom-7")
        
        return imagePost
    }()
    
    // Defines post button
    private lazy var likeButton: UIButton = {
        let buttonLike = UIButton(type: .system)
        buttonLike.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        buttonLike.tintColor = .black
        return buttonLike
    }()
    
    // Defines comment button
    private lazy var commentButton: UIButton = {
        let buttonComment = UIButton(type: .system)
        buttonComment.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        buttonComment.tintColor = .black
        return buttonComment
    }()
    
    // Defines share button
    private lazy var shareButton: UIButton = {
        let buttonShare = UIButton(type: .system)
        buttonShare.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        buttonShare.tintColor = .black
        return buttonShare
    }()
    
    // Defines likes counter
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "20 likes"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    // Defines caption label
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Alguma label de teste"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    // Defines publish date label
    private let publishTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 dias atrás"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
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
        
        // Center buttons alignment along with the user profile picture
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        // Adds post image
        addSubview(postImageView)
        
        // Set image position to start at the bottom of the profile container
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        
        // Defines post image height and width
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        // Adds button icons below the image post
        configureActionButtons()
        
        // Adds like counter label
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingLeft: 8)
        
        // Adds post title caption
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        // Adds post publish date
        addSubview(publishTimeLabel)
        publishTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
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
    
    // MARK: - Helpers
    
    // Configure a list of buttons alignment and positioning
    func configureActionButtons() {
        // Define button list below the image post
        let stackView = UIStackView(arrangedSubviews:  [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        // Adds buttons list to the post
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
    }
}
