//
//  SplitViewController.swift
//  Exam
//
//  Created by ANG OUSA on 15/9/23.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        // Do any additional setup after loading the view.
    }
    

   

}

extension SplitViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
