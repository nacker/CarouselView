//
//  ViewController.swift
//  图片轮播Swift
//
//  Created by nacker QQ:648959 on 15/12/15.
//  Copyright © 2015年 Shanghai Minlan Information & Technology Co ., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageView: LZPageView!
    let pageViewHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageView()
    }

    func setupPageView() {
        pageView = LZPageView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.size.width, height: pageViewHeight)))
        pageView.delegate = self
        pageView.statusArray = ["1","2","3"]
        self.view.addSubview(pageView)
    }
}

extension ViewController: LZPageViewDelegate {

    func pageView(pageView: LZPageView, didSelectedPageAtIndex index: NSInteger) {
        print(index)
        
        let alert = UIAlertView()
        alert.message = "是不是被哥的形象所倾倒了..."
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
}