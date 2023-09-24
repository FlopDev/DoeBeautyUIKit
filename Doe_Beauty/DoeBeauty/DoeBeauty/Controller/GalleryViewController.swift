import UIKit

class GalleryViewController: UIViewController, UIPageViewControllerDataSource {
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var imageNames: [String] = ["nail1", "nail2", "nail3", "nail4", "nail5", "nail6", "nail7", "nail8"]
    var pageViewController: UIPageViewController!
    var currentIndex: Int = 0
    
    var pageViewControllerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageControl()
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        
        if let initialViewController = viewControllerAtIndex(currentIndex) {
            pageViewController.setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewControllerHeightConstraint = pageViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7) // multiplicateur taille
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 30), // décalage supérieur
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewControllerHeightConstraint
        ])
        
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if index >= 0 && index < imageNames.count {
            let viewController = UIViewController()
            let imageView = UIImageView(frame: viewController.view.bounds)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: imageNames[index])
            viewController.view.tag = index
            viewController.view.addSubview(imageView)
            return viewController
        }
        return nil
    }

    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? UIViewController)?.view.tag, index > 0 {
            return viewControllerAtIndex(index-1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? UIViewController)?.view.tag, index < imageNames.count - 1 {
            return viewControllerAtIndex(index+1)
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageNames.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.darkGray
        appearance.currentPageIndicatorTintColor = UIColor.red
        appearance.backgroundColor = UIColor.black
    }
}
