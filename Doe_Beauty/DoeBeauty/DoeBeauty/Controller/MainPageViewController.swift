//
//  MainPageViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 12/07/2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var leadingHamburgerView: NSLayoutConstraint!
    @IBOutlet weak var backViewHamburgerView: UIView!
    var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    @IBOutlet weak var hamburgerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //backViewHamburgerView.isHidden = true
        leadingHamburgerView.constant = -300
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pressedHamburgerButton(_ sender: Any) {
        //self.backViewHamburgerView.isHidden = false
        leadingHamburgerView.constant = 0
    }
}
