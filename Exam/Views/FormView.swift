//
//  FormView.swift
//  Exam-Pro
//
//  Created by ANG OUSA on 20/9/23.
//

import UIKit

class FormView: UIView {
    
//protocol FormViewDelegate: AnyObject {
//    func submit()
//    func pickImage(rect: CGRect)
//    func pickCity()
//}
    
    class FormView: UIView {
        
        private var profile: UIImageView!
        private var camerImageV: UIImageView!
        private var control: UIControl!
        private var nameTextField: UITextField!
        
        private var cityNameLabel: UILabel!
        
        private var button: UIButton!
        
        //weak var delegate: FormViewDelegate?
        
        init() {
            super.init(frame: .zero)
            
            profile = UIImageView()
            profile.translatesAutoresizingMaskIntoConstraints = false
            profile.image = UIImage(named: "profile")
            
            camerImageV = UIImageView()
            camerImageV.translatesAutoresizingMaskIntoConstraints = false
            camerImageV.image = UIImage(named: "camera")
            
            control = UIControl()
            control.translatesAutoresizingMaskIntoConstraints = false
            //control.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            
            nameTextField = UITextField()
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameTextField.placeholder = "Name"
            
            let borderView = UIView()
            borderView.translatesAutoresizingMaskIntoConstraints = false
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = UIColor.black.cgColor
            borderView.layer.cornerRadius = 4
            
            
            addSubview(profile)
            addSubview(camerImageV)
            addSubview(control)
            
            profile.widthAnchor.constraint(equalToConstant: 150).isActive = true
            profile.heightAnchor.constraint(equalToConstant: 150).isActive = true
            profile.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            profile.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            camerImageV.widthAnchor.constraint(equalToConstant: 30).isActive = true
            camerImageV.heightAnchor.constraint(equalToConstant: 30).isActive = true
            camerImageV.centerXAnchor.constraint(equalTo: profile.centerXAnchor).isActive = true
            camerImageV.bottomAnchor.constraint(equalTo: profile.bottomAnchor, constant: -10).isActive = true
            
            control.topAnchor.constraint(equalTo: profile.topAnchor).isActive = true
            control.bottomAnchor.constraint(equalTo: profile.bottomAnchor).isActive = true
            control.leadingAnchor.constraint(equalTo: profile.leadingAnchor).isActive = true
            control.trailingAnchor.constraint(equalTo: profile.trailingAnchor).isActive = true
            
            button = UIButton(type: .system)
            button.setTitle("Submit", for: .normal)
            button.addTarget(self, action: #selector(submit), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 6
            
            addSubview(borderView)
            borderView.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 15).isActive = true
            borderView.heightAnchor.constraint(equalToConstant: 45).isActive = true
            borderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            borderView.widthAnchor.constraint(equalToConstant: 250).isActive = true
            borderView.addSubview(nameTextField)
            nameTextField.topAnchor.constraint(equalTo: borderView.topAnchor).isActive = true
            nameTextField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor).isActive = true
            nameTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10).isActive = true
            nameTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10).isActive = true
            
            let cityLabel = UILabel()
            cityLabel.translatesAutoresizingMaskIntoConstraints = false
            cityLabel.text = "City"
            cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            
            addSubview(cityLabel)
            cityLabel.topAnchor.constraint(equalTo: borderView.bottomAnchor, constant: 15).isActive = true
            cityLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor).isActive = true
            cityLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
            cityLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
            
            let control = UIControl()
            control.translatesAutoresizingMaskIntoConstraints = false
            //control.addTarget(self, action: #selector(pickCity), for: .touchUpInside)
            control.backgroundColor = .lightGray
            
            addSubview(control)
            control.topAnchor.constraint(equalTo: cityLabel.topAnchor).isActive = true
            control.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
            control.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 15).isActive = true
            control.trailingAnchor.constraint(equalTo: borderView.trailingAnchor).isActive = true
            
            cityNameLabel = UILabel()
            cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
            cityNameLabel.text = "Select City"
            cityNameLabel.textAlignment = .center
            
            control.addSubview(cityNameLabel)
            cityNameLabel.topAnchor.constraint(equalTo: control.topAnchor).isActive = true
            cityNameLabel.bottomAnchor.constraint(equalTo: control.bottomAnchor).isActive = true
            cityNameLabel.leadingAnchor.constraint(equalTo: control.leadingAnchor).isActive = true
            cityNameLabel.trailingAnchor.constraint(equalTo: control.trailingAnchor).isActive = true
            
            
            addSubview(button)
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 45).isActive = true
            button.widthAnchor.constraint(equalToConstant: 120).isActive = true
            
            profile.layer.masksToBounds = true
            
            control.layer.masksToBounds = true
            control.layer.cornerRadius = 4
            //        profile.layer.cornerRadius = 150 / 2
            //        control.layer.cornerRadius = 150 / 2
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            control.layer.masksToBounds = true
            profile.layer.cornerRadius = profile.frame.width / 2
            control.layer.cornerRadius = control.frame.width / 2
        }
        
        
        func setImage(_ image: UIImage) {
            profile.image = image
        }
        
        @objc private func submit() {
            
        }
        
//        @objc private func pickImage() {
//            delegate?.pickImage(rect: camerImageV.frame)
//        }
//
//        @objc private func pickCity() {
//            delegate?.pickCity()
//        }
    }
    
}
