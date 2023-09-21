//
//  ViewController.swift
//  Exam
//
//  Created by ANG OUSA on 8/9/23.
//

import UIKit
import Photos


class LoginViewController: UIViewController {

    private var loginView: LoginView!

    override func loadView() {
        super.loadView()
        loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)

        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginView.delegate = self
    }

    @objc private func login() {

    }

}

extension LoginViewController: LoginViewDelegate {
    func onLogin(_ username: String, _ password: String) {
        print(username)
        print(password)
        
        let tabVC = UITabBarController()
        
        let splitVC = SplitViewController()
        splitVC.preferredDisplayMode = .oneBesideSecondary
        splitVC.tabBarItem = UITabBarItem(title: "Apple", image: UIImage(named: "apple"), tag: 1)
        

        
        let primaryVC = WelcomeViewController()
        let nvc = UINavigationController(rootViewController: primaryVC)
        
        let secondaryVC = UIViewController()
        splitVC.viewControllers = [nvc, secondaryVC]
        
        
        
        let tab2 = HomeViewController()
        tab2.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        tab2.view?.backgroundColor = .white
        
        let tab3 = ProfileViewController()
        tab3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user 1"), tag: 1)
        tab3.view?.backgroundColor = .white
        
        tabVC.viewControllers = [splitVC, tab2, tab3]
        UIApplication.shared.keyWindow?.rootViewController = tabVC
        
    }
    
    func onSignup() {
        
        
    }
    
    
}
//import UIKit
//import Photos
//
//class FormViewController: UIViewController {
//
//    private var formView: FormView!
//
//    override func loadView() {
//        super.loadView()
//        formView = FormView()
//        formView.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(formView)
//        formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        formView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        formView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        formView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
////        formView.frame = view.frame
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        formView.delegate = self
//
//        let infoBtn = UIBarButtonItem(image: UIImage(named: "info"), style: .plain, target: self, action: #selector(showInfo))
//
//        let shareBtn = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(share))
//
//        navigationItem.rightBarButtonItems = [shareBtn, infoBtn]
//
////        navigationItem.leftBarButtonItems = []
//    }
//
//
//    @objc private func showInfo() {
//
//    }
//
//    @objc private func share() {
//
//    }
//
//    private func openPhotoAlbume() {
//
//        switch PHPhotoLibrary.authorizationStatus() {
//            case .restricted, .denied, .notDetermined:
//                let isRequested = Variable.shared.isReqestedPhotos
//                if isRequested {
//                    let alert = UIAlertController(title: "Photos permission", message: nil, preferredStyle: .alert)
//
//                    let noButton = UIAlertAction(title: "No", style: .cancel)
//                    let yesButton = UIAlertAction(title: "Yes", style: .default) { _ in
//                        if let url = URL(string:UIApplication.openSettingsURLString) {
//                            UIApplication.shared.open(url)
//                        }
//                    }
//                    alert.addAction(noButton)
//                    alert.addAction(yesButton)
//
//                    present(alert, animated: true)
//
//                }else  {
//                    PHPhotoLibrary.requestAuthorization() { status in
//                        if status == .authorized {
//                            Variable.shared.isReqestedPhotos = true
//                            DispatchQueue.main.async {
//                                self.showPickPhotos()
//                            }
//                        }
//                    }
//                }
//
//                return
//            default:
//                showPickPhotos()
//        }
//
//    }
//
//    private func showPickPhotos() {
//        let imagePicker = UIImagePickerController()
//
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
//
//        present(imagePicker, animated: true)
//    }
//
//    private func openCamera() {
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//            case .denied, .notDetermined:
//
//                AVCaptureDevice.requestAccess(for: .video) { allowed in
//                    if allowed {
//                        DispatchQueue.main.async {
//                            self.showCamera()
//                        }
//                    }
//                }
//                break
//            default:
//                showCamera()
//        }
//
//
//    }
//
//    private func showCamera() {
//        let imagePicker = UIImagePickerController()
//
//        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
//
//        present(imagePicker, animated: true)
//    }
//
//}
//
//// MARK: - Image picker delegate
//extension FormViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        picker.dismiss(animated: true, completion: nil)
//
//        guard let image = info[.originalImage] as? UIImage else { return }
//
//        formView.setImage(image)
//    }
//}
//
//// MARK: - Form view delegate
//extension FormViewController: FormViewDelegate {
//
//    func pickCity() {
//
//    }
//
//    func pickImage(rect: CGRect) {
//        // open action
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
//            self.openCamera()
//        }
//        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
//            self.openPhotoAlbume()
//        }
//
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//
//        actionSheet.addAction(camera)
//        actionSheet.addAction(photo)
//        actionSheet.addAction(cancel)
//
//        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
//
//        if isiPad {
//            actionSheet.popoverPresentationController?.sourceView = view
//            let readRect = CGRect(x: rect.minX, y: rect.minY + view.safeAreaInsets.top, width: rect.width, height: rect.height)
//
//            actionSheet.popoverPresentationController?.sourceRect = readRect
//        }
//
//        present(actionSheet, animated: true)
//    }
//
//    func submit() {
//
//    }
//
//}
