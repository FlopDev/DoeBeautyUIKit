//
//  ImagePageViewViewController.swift
//  DoeBeauty
//
//  Created by Florian Peyrony on 25/08/2023.
//
import UIKit

class ImagePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var imageNames: [String] = [] // Noms de vos images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = viewControllerAtIndex(0) {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        guard index >= 0 && index < imageNames.count else {
            return nil
        }
        
        let imageViewController = UIViewController()
        let imageView = UIImageView(image: UIImage(named: imageNames[index]))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = view.bounds
        imageViewController.view.addSubview(imageView)
        
        return imageViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? ImagePageViewController, let index = imageNames.firstIndex(of: viewController.imageNames.first ?? ""), index > 0 {
            return viewControllerAtIndex(index - 1)
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? ImagePageViewController, let index = imageNames.firstIndex(of: viewController.imageNames.first ?? ""), index < imageNames.count - 1 {
            return viewControllerAtIndex(index + 1)
        }
        return nil
    }
}
