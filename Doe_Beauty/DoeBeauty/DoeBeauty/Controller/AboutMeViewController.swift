//
//  AboutMeViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 16/08/2023.
//

import Foundation
import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Rounding the profile image
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
}
