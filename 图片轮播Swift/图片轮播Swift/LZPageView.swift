//
//  LZPageView.swift
//  图片轮播Swift
//
//  Created by nacker QQ:648959 on 15/12/15.
//  Copyright © 2015年 Shanghai Minlan Information & Technology Co ., Ltd. All rights reserved.
//

import UIKit

protocol LZPageViewDelegate {
    func pageView(pageView: LZPageView, didSelectedPageAtIndex index: NSInteger);
}

class LZPageView: UIView {
    
    let pageControllHeight: CGFloat = 20

    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    var timer: NSTimer!
    
    var statusArray = [String]() {
        didSet {
            print(statusArray)
            
            let scrollViewWidth = scrollView.frame.size.width
            let scrollViewHeight = scrollView.frame.size.height
            
            for (var i = 0; i < statusArray.count; i++){
                let button:UIButton = UIButton()
                button.tag = i
                button.frame = CGRectMake(CGFloat(i) * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)
                button.setImage(UIImage(named:statusArray[i]), forState:.Normal)
                button.addTarget(self, action: "btnClick:", forControlEvents: .TouchDown)
                button.contentMode = UIViewContentMode.ScaleAspectFill
                self.scrollView.addSubview(button)
                
            }
            
            self.scrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(statusArray.count), 0)
            self.pageControl.numberOfPages = statusArray.count;
        }
    }
    
    var delegate: LZPageViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupPageControl()
        
        startTimer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupScrollView() {
        scrollView = UIScrollView(frame: CGRect(origin: CGPointZero, size: self.frame.size))
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
    }

    func setupPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollView.frame.size.height - pageControllHeight, width: scrollView.frame.size.width, height: pageControllHeight))
        pageControl.currentPage = 0;
        pageControl.center = CGPointMake(self.center.x, pageControl.center.y)
        pageControl.pageIndicatorTintColor = UIColor.redColor();
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor();
        self.addSubview(pageControl)
    }
    
}

extension LZPageView  {
    
    @objc private func btnClick(button:UIButton) {
        
        print("btnClick---")
        
        if delegate != nil {
            delegate.pageView(self, didSelectedPageAtIndex: button.tag)
        }
    }
}

extension LZPageView: UIScrollViewDelegate  {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
    
    func startTimer() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "nextPage:", userInfo: nil, repeats: true)
        NSRunLoop .mainRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes)
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func nextPage(timer : NSTimer) {
    
        var index = self.pageControl.currentPage + 1
        
        if index == self.statusArray.count {
            index = 0
        }

        let offSet : CGPoint = CGPointMake(self.scrollView.frame.size.width * CGFloat(index), 0)
        self.scrollView .setContentOffset(offSet, animated: true)
    }
    
}