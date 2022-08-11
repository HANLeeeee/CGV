//
//  ViewController.swift
//  CGV
//
//  Created by 최하늘 on 2022/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionViewTopTab: UICollectionView!
    
    @IBOutlet weak var viewTab: UIView!
    var tabTitle = ["홈", "이벤트", "무비톡", "패스트오더", "기프트샵"]
    
    var gradient: CAGradientLayer!
    
    var currentIndex: Int = 0
    var pageViewController: PageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
//        setTopTab()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoPageViewController" {
            let pageVC = segue.destination as! PageViewController
            pageViewController = pageVC
            pageViewController.completeHandler = { (result) in
                self.currentIndex = result
            }
        }
    }
        
    func registerCollectionView() {
        let collectionCell = UINib(nibName: "TopTabCollectionViewCell", bundle: nil)
        collectionViewTopTab.register(collectionCell, forCellWithReuseIdentifier: "TopTabCollectionViewCell")
        
        collectionViewTopTab.delegate = self
        collectionViewTopTab.dataSource = self
    }
    
    func setTopTab() {
        
        gradient = CAGradientLayer()
        gradient.frame = viewTab.bounds
        let colors: [CGColor] = [
            UIColor.systemRed.cgColor, UIColor.systemPink.cgColor, UIColor.systemYellow.cgColor
        ]
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        viewTab.layer.addSublayer(gradient)

    }
}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewTopTab.dequeueReusableCell(withReuseIdentifier: "TopTabCollectionViewCell", for: indexPath) as! TopTabCollectionViewCell
        
        cell.labelTitle.text = tabTitle[indexPath.row]
        
        cell.config(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let labelTitle = UILabel()
        labelTitle.text = tabTitle[indexPath.item]
        labelTitle.sizeToFit()
        
        return CGSize(width: labelTitle.frame.width+20, height: 40)
    }
    
}

