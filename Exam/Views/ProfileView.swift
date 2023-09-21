//
//  ProfileView.swift
//  Exam
//
//  Created by ANG OUSA on 18/9/23.
//

import UIKit


protocol ProfileViewDelegate: AnyObject {
    //func??
    func openGoogleMaps()
    func openFaceBook()
}

class ProfileView: UIView {
    
    private lazy var profileImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "man")
        return img
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "Username"
        return label
    }()
    
    private lazy var fbButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "facebook"), for: .normal)
        btn.setTitle("FaceBook", for: .normal)
        btn.addTarget(self, action: #selector(clickedFaceBook), for: .touchUpInside)
        return btn
    }()
    
    private lazy var googleMapsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "map"), for: .normal)
        btn.setTitle("Google Maps", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(clickedGoogle), for: .touchUpInside)
        return btn
    }()
    weak var delegate: ProfileViewDelegate?
    
    init() {
        super.init(frame: .zero)
        
     
        
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

        ])
        
        
        addSubview(profileImg)
        NSLayoutConstraint.activate([
            profileImg.widthAnchor.constraint(equalToConstant: 150),
            profileImg.heightAnchor.constraint(equalTo: profileImg.widthAnchor),
            profileImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImg.bottomAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: -20)
        ])
        
        let stackV = UIStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.axis = .vertical
        stackV.spacing = 8
        stackV.distribution = .fillEqually
        stackV.addArrangedSubview(fbButton)
        stackV.addArrangedSubview(googleMapsButton)
        addSubview(stackV)
//
        NSLayoutConstraint.activate([
            //googleMapsButton.widthAnchor.constraint(equalToConstant: 40),
            //googleMapsButton.heightAnchor.constraint(equalToConstant: 40),
            stackV.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 40),
            stackV.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func clickedGoogle() {
        delegate?.openGoogleMaps()
    }
    @objc private func clickedFaceBook() {
        delegate?.openFaceBook()
    }
}
