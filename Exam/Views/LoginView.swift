//
//  LoginView.swift
//  Exam
//
//  Created by ANG OUSA on 8/9/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func onLogin(_ username: String, _ password: String)
    func onSignup()
}
//protocol FormViewDelegate: AnyObject {
//    func login()
//    func signUp()
//
//}

class LoginView: UIView {
    
    private var imageView: UIImageView!
    private var welcomeLabel: UILabel!
    private var textName: UITextField!
    private var textPw: UITextField!
    private var button: UIButton!
    private var profile: UIImageView!
    private var appleLogo: UIImageView!
    private var passwordImg: UIImageView!
    private var signup_btn: UIButton!
//
//    private lazy var signUpButton: UIButton = {
//        let signup_btn = UIButton(type: .system)
//        signup_btn.translatesAutoresizingMaskIntoConstraints = false
//        signup_btn.setTitle("Sign up?", for: .normal)
//        signup_btn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
//        return signup_btn
//    }()
    
    
    weak var delegate: LoginViewDelegate?
    init() {
        super.init(frame: .zero)
        
        let borderName = UIView()
        borderName.translatesAutoresizingMaskIntoConstraints = false
        borderName.layer.borderWidth = 1
        borderName.layer.borderColor = UIColor.gray.cgColor
        borderName.layer.cornerRadius = 4
        
        let borderPw = UIView()
        borderPw.translatesAutoresizingMaskIntoConstraints = false
        borderPw.layer.borderWidth = 1
        borderPw.layer.borderColor = UIColor.gray.cgColor
        borderPw.layer.cornerRadius = 4
        
        profile = UIImageView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "user 1")
        
        appleLogo = UIImageView()
        appleLogo.translatesAutoresizingMaskIntoConstraints = false
        appleLogo.image = UIImage(named: "apple-logo")
        
        passwordImg = UIImageView()
        passwordImg.translatesAutoresizingMaskIntoConstraints = false
        passwordImg.image = UIImage(named: "key-chain")
              
        textName = UITextField()
        textName.translatesAutoresizingMaskIntoConstraints = false
        textName.placeholder = "Username"
        textName.font = UIFont.boldSystemFont(ofSize: 17)
               
        textPw = UITextField()
        textPw.translatesAutoresizingMaskIntoConstraints = false
        textPw.placeholder = "Password"
        textPw.isSecureTextEntry = true // hide password
        textPw.font = UIFont.boldSystemFont(ofSize: 17)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        

        signup_btn = UIButton(type: .system)
        signup_btn.setTitle("Sign up?", for: .normal)
        signup_btn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signup_btn.translatesAutoresizingMaskIntoConstraints = false
        signup_btn.setTitleColor(.blue, for: .normal)


     
        addSubview(imageView)
        addSubview(welcomeLabel)
        addSubview(borderPw)
        addSubview(borderName)
        addSubview(textPw)
        addSubview(textName)
        addSubview(button)
        addSubview(profile)
        borderName.addSubview(profile)
        addSubview(appleLogo)
        borderPw.addSubview(passwordImg)
        addSubview(signup_btn)
 
        NSLayoutConstraint.activate([
            appleLogo.trailingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor, constant: -10),
            appleLogo.widthAnchor.constraint(equalToConstant: 20),
            appleLogo.heightAnchor.constraint(equalToConstant: 20),
            appleLogo.bottomAnchor.constraint(equalTo: borderName.topAnchor, constant: -10)
        ])
                
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: borderName.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            borderPw.centerXAnchor.constraint(equalTo: centerXAnchor),
            borderPw.centerYAnchor.constraint(equalTo: centerYAnchor),
            borderPw.widthAnchor.constraint(equalToConstant: 200),
            borderPw.heightAnchor.constraint(equalToConstant: 45),
            borderPw.topAnchor.constraint(equalTo: borderName.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            borderName.centerXAnchor.constraint(equalTo: centerXAnchor),
            borderName.bottomAnchor.constraint(equalTo: borderPw.topAnchor, constant: -10),
            borderName.widthAnchor.constraint(equalToConstant: 200),
            borderName.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            textName.centerYAnchor.constraint(equalTo: profile.centerYAnchor),
            textName.bottomAnchor.constraint(equalTo: borderName.bottomAnchor),
            textName.topAnchor.constraint(equalTo: borderName.topAnchor),
            textName.widthAnchor.constraint(equalToConstant: 150),
            textName.heightAnchor.constraint(equalToConstant: 45),
            textName.leadingAnchor.constraint(equalTo: profile.leadingAnchor,constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: borderPw.bottomAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        NSLayoutConstraint.activate([
            signup_btn.centerXAnchor.constraint(equalTo: centerXAnchor),
            signup_btn.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            signup_btn.widthAnchor.constraint(equalToConstant: 150),
            signup_btn.heightAnchor.constraint(equalToConstant: 45),
        ])

        NSLayoutConstraint.activate([
            profile.leadingAnchor.constraint(equalTo: borderName.leadingAnchor, constant: 10),
            profile.centerYAnchor.constraint(equalTo: borderName.centerYAnchor),
            
            profile.widthAnchor.constraint(equalToConstant: 22),
            profile.heightAnchor.constraint(equalToConstant: 22),
        ])

        NSLayoutConstraint.activate([
            passwordImg.leadingAnchor.constraint(equalTo: borderPw.leadingAnchor, constant: 10),
            passwordImg.centerYAnchor.constraint(equalTo: borderPw.centerYAnchor),
            passwordImg.widthAnchor.constraint(equalToConstant: 22),
            passwordImg.heightAnchor.constraint(equalToConstant: 22),
        ])
              
        NSLayoutConstraint.activate([
            textPw.centerYAnchor.constraint(equalTo: passwordImg.centerYAnchor),
            textPw.bottomAnchor.constraint(equalTo: borderPw.bottomAnchor),
            textPw.topAnchor.constraint(equalTo: borderPw.topAnchor),

            textPw.widthAnchor.constraint(equalToConstant: 150),
            textPw.heightAnchor.constraint(equalToConstant: 45),
            textPw.leadingAnchor.constraint(equalTo: passwordImg.leadingAnchor,constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            borderPw.centerXAnchor.constraint(equalTo: centerXAnchor),
            borderPw.centerYAnchor.constraint(equalTo: centerYAnchor),
            borderPw.widthAnchor.constraint(equalToConstant: 200),
            borderPw.heightAnchor.constraint(equalToConstant: 45)
        ])
               
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    @objc private func login() {
        delegate?.onLogin(textName.text ?? "", textPw.text ?? "")
        
    }
    @objc private func signUp() {
        //delegate?.onLogin(textName.text ?? "", textPw.text ?? "")
        
    }
    
}

    

    



