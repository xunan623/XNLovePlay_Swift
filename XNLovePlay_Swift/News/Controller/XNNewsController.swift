//
//  XNNewsController.swift
//  XNLovePlay_Swift
//
//  Created by xunan on 2017/4/12.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNewsController: XNBaseController {
    
    fileprivate lazy var topView: XNNewsTopView = { [weak self] in
        let titles = ["头条","网游","手游","主机","电竞","暴雪"]
        let titleFrame = CGRect(x: 0, y: 0, width: Int(kScreenW), height: Int(kNavigationBarAndStatusBarH))
        let topView = XNNewsTopView(frame: titleFrame, titleArray: titles)
        topView.delegate = self
        return topView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize.init(width: kScreenW, height: CGFloat(Float(kScreenH) - Float(kNavigationBarAndStatusBarH) - Float(kTabBarH)))
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let frame = CGRect.init(x: 0, y: 64, width: kScreenW, height: kScreenH - 64 - 49)
        let collectionView = UICollectionView.init(frame: frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.register(XNNewsVCCell.self, forCellWithReuseIdentifier: "XNNewsVCCell")
        return collectionView
    }()
    
    fileprivate var vcArray: [UIViewController] = {
        
        let netVC = XNNetGaemController()
        netVC.paramsStr = "T1461396384709"
        
        let handGameVC = XNHandGameController()
        handGameVC.paramsStr = "T1461396358842"
        
        let mechineVC = XNMechineController()
        mechineVC.paramsStr = "T1461396291717"
        
        let ecVC = XNECController()
        ecVC.paramsStr = "T1461396413033"
        
        let stormVC = XNStormController()
        stormVC.paramsStr = "T1461396489605"
        
        let vcArray: [UIViewController] = [XNHeadlineController(), netVC, handGameVC, mechineVC, ecVC, stormVC]
        return vcArray;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.white
        view.addSubview(topView)
        
        view.addSubview(self.collectionView)
        
        
        
        for vc: UIViewController in self.vcArray {
            self.addChildViewController(vc)
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension XNNewsController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vcArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XNNewsVCCell", for: indexPath) as! XNNewsVCCell
        
        for view: UIView in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        cell.cellVC = self.vcArray[indexPath.row]
        cell.cellVC?.view.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: self.view.height)
        cell.contentView.addSubview((cell.cellVC?.view)!)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = self.collectionView.contentOffset.x / kScreenW
        self.topView.selectOnePage(pageIndex: Int(offset))
    }
}



extension XNNewsController : XNNewsTopViewDelegete {
    func newTopViewWithTag(_ view: XNNewsTopView, tog: Int) {
        self.collectionView.scrollToItem(at: IndexPath.init(row: tog, section: 0), at: .centeredHorizontally, animated: true)
    }
}































