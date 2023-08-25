//
//  GalleryViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 16/08/2023.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!


    var imageNames: [String] = ["nail1", "nail2", "nail3","nail4", "nail5", "nail6", "nail7", "nail8"] // Noms de vos images
    var currentImageIndex = 0
    var currentPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageNames[currentImageIndex])
                
                // Configurer le geste de balayage
                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                swipeLeft.direction = .left
                view.addGestureRecognizer(swipeLeft)
                
                let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                swipeRight.direction = .right
                view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
          if gesture.direction == .left {
              currentImageIndex += 1
              if currentImageIndex >= imageNames.count {
                  currentImageIndex = 0
              }
          } else if gesture.direction == .right {
              currentImageIndex -= 1
              if currentImageIndex < 0 {
                  currentImageIndex = imageNames.count - 1
              }
          }
          
          imageView.image = UIImage(named: imageNames[currentImageIndex])
      }

    // Reste du code...
}

