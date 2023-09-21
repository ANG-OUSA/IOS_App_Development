//
//  ProfileViewController.swift
//  Exam
//
//  Created by ANG OUSA on 18/9/23.
//

import UIKit

//protocol ProfileViewDelegate: AnyObject {
//    //func??
//    func openGoogleMaps()
//    func openFaceBook()
//}


class ProfileViewController: UIViewController {
    
    private var profileV: ProfileView!
    
    //weak var delegate: ProfileViewDelegate?
    
    init(){
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user 1"), tag: 1)
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        profileV = ProfileView()
        profileV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileV)
        
        profileV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        profileV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //profileView.frame = view.frame
        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        <key>kCFURLIsApplicationKey<key>

        // Do any additional setup after loading the view.
        profileV.delegate = self
    }
    @objc private func share() {
        
    }
    

}
extension ProfileViewController: ProfileViewDelegate {
    func openFaceBook() {
       if let url = URL(string: "comgooglemaps://") {
           
           if UIApplication.shared.canOpenURL(url) {
               UIApplication.shared.open(url)
           } else {
               UIApplication.shared.open(URL(string: "https://www.facebook.com/placeholder")!)
           }
       }

    }
    
    func openGoogleMaps() {
        let url = URL(string: "comgooglemaps://")!
        
        if UIApplication.shared.canOpenURL(url){
            print("My phone have App Google Maps")
        }else {
            let url = URL(string: "https://itunes.apple.com/us/app/google-maps-transit-food/id585027354")!
            UIApplication.shared.open(url)
        }
    }
    
    
}

//extension ProfileViewController: ProfileViewDelegate {
//    func openGoogleMaps() {
//        let url = URL(string: "comgooglemaps://")!
//
//        if UIApplication.shared.canOpenURL(url){
//            print("My phone have App Google Maps")
//        }else {
//            let url = URL(string: "https://itunes.apple.com/us/app/google-maps-transit-food/id585027354")!
//            UIApplication.shared.open(url)
//
//        }
//
//    }
//    func openFaceBook(){
//        let url = URL(string: "comgooglemaps://")!
//
//        if UIApplication.shared.canOpenURL(url){
//            print("My phone have App Google Maps")
//        }else {
//            let url = URL(string: "https://itunes.apple.com/us/app/google-maps-transit-food/id585027354")!
//            UIApplication.shared.open(url)
//
//        }
//
//
//    }
//}

//if let facebookPageId = facebookPageIdTextField.text {
//       let facebookHook = "fb://profile/" + facebookPageId
//       if let url = URL(string: "\(facebookHook)") {
//
//           if UIApplication.shared.canOpenURL(url) {
//               UIApplication.shared.open(url)
//           } else {
//               UIApplication.shared.open(URL(string: "https://www.facebook.com/placeholder")!)
//           }
//       }
//   }
