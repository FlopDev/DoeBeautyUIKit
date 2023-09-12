//
//  ImageViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 27/08/2023.
//

import UIKit

class ImageViewController: UIViewController {

    var pageIndex: Int = 0
    var imageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: imageName)
        view.addSubview(imageView)
    }
}

