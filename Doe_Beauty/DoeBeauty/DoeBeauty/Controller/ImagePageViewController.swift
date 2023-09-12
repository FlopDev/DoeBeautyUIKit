//
//  ImagePageViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 27/08/2023.
//

import UIKit

class ImagePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var imageNames: [String] = ["nail1", "nail2", "nail3","nail4", "nail5", "nail6", "nail7", "nail8"] // Noms de vos images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setupPageControl()
        
        if let initialViewController = viewControllerAtIndex(0) {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // ... (Le reste de vos fonctions et délégués)

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageNames.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.darkGray
        appearance.currentPageIndicatorTintColor = UIColor.red
        appearance.backgroundColor = UIColor.black
    }
}

