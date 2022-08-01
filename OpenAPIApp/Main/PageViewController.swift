//
//  PageViewController.swift
//  OpenAPIApp
//
//  Created by 최하늘 on 2022/08/01.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var completeHandler: ((Int)->())?
    let pageVCs: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeView = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
        let eventView = storyBoard.instantiateViewController(withIdentifier: "EventViewController")
        let movieView = storyBoard.instantiateViewController(withIdentifier: "MovieTalkViewController")
        let GiftView = storyBoard.instantiateViewController(withIdentifier: "GiftShopViewController")
        let FastView = storyBoard.instantiateViewController(withIdentifier: "FastOrderViewController")
        
        return [homeView, eventView, movieView, GiftView, FastView]
    }()
    
    var currentIndex: Int {
        guard let page = viewControllers?.first else {
            return 0
        }
        return pageVCs.firstIndex(of: page) ?? 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    //MARK: 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPageController()
    }
    
    func initPageController() {
        self.dataSource = self
        self.delegate = self
        
        if let firstPage = pageVCs.first {
            self.setViewControllers([firstPage], direction: .forward, animated: false)
        }
    }
}


extension PageViewController: UIPageViewControllerDataSource , UIPageViewControllerDelegate {
    func setViewControllersIndex(index: Int) {
        if index < 0 && index >= pageVCs.count {
            return
        }
        self.setViewControllers([pageVCs[index]], direction: .forward, animated: false, completion: nil)
        completeHandler?(currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            completeHandler?(currentIndex)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCs.firstIndex(of: viewController) else {
            return nil
        }
        
        let preIndex = index-1
        if preIndex < 0 {
            return nil
        }
        
        return pageVCs[preIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCs.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = index+1
        if nextIndex == pageVCs.count {
            return nil
        }
        
        return pageVCs[nextIndex]
    }
}
