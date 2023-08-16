//
//  GalleryViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 16/08/2023.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    var imageViews: [UIImageView] = []
    var imageNames: [String] = ["nail1", "nail2", "nail3","nail4", "nail5", "nail6", "nail7", "nail8"] // Noms de vos images
    var currentPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

    // Reste du code...
}

extension GalleryViewController {
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false

        let imageSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height) // Taille fixe pour les images

        for (index, imageName) in imageNames.enumerated() {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.contentMode = .scaleAspectFill // Ajustez le mode de contenu en conséquence
            imageView.clipsToBounds = true // Pour éviter le débordement d'image
            imageView.frame = CGRect(origin: CGPoint(x: 0, y: CGFloat(index) * scrollView.frame.height), size: imageSize)
            scrollView.addSubview(imageView)
            imageViews.append(imageView)
        }

        scrollView.contentSize = CGSize(width: imageSize.width, height: scrollView.frame.height * CGFloat(imageNames.count))
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageHeight = scrollView.frame.height
        currentPage = Int((scrollView.contentOffset.y + pageHeight / 2) / pageHeight)
    }
}

