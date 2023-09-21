//
//  HomeViewController.swift
//  Exam
//
//  Created by ANG OUSA on 15/9/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Congratulation"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .orange
        return label
        
    }()
    
    //
    override func loadView() {
        super.loadView()
        view.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.addSubview(welcomeLabel)
        
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 20)
    }
    

    

    
    
   
    
    
    

  

}



    
    


