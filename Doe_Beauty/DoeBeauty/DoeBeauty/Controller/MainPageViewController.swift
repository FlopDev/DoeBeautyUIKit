//
//  MainPageViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 12/07/2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    
    @IBOutlet var burgerMainView: UIView!
    @IBOutlet weak var burgerView: UIView!
    @IBOutlet weak var leadingHamburgerView: NSLayoutConstraint!
    @IBOutlet weak var backViewHamburgerView: UIView!
    var swipeGestureRecognizer: UISwipeGestureRecognizer!
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var hamburgerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //backViewHamburgerView.isHidden = true
        leadingHamburgerView.constant = -300
        
        // Créez et configurez le geste de balayage
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGestureRecognizer.direction = .left
        
        // Ajoutez le geste de tap
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backViewHamburgerView.addGestureRecognizer(tapGestureRecognizer)
        
        
        // Ajoutez le geste à votre vue du menu
        burgerMainView.addGestureRecognizer(swipeGestureRecognizer)
        
        // Assurez-vous que les deux gestes peuvent coexister
        swipeGestureRecognizer.require(toFail: tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pressedHamburgerButton(_ sender: Any) {
        //self.backViewHamburgerView.isHidden = false
        leadingHamburgerView.constant = 0
    }
    
    // Fonction appelée lorsque le balayage est détecté
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            // Code pour faire disparaître la vue du menu
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.leadingHamburgerView.constant = -300
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // Code pour gérer le tap sur la vue
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.leadingHamburgerView.constant = -300
            self.view.layoutIfNeeded()
        })
    }
}
