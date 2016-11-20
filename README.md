# CarouselView
无限循环图片轮播器Swift版。Autoscroll Banner。完美封装 
    
##Install
    
    // 初始化控件
    pageView = LZPageView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.size.width, height: pageViewHeight)))
    // 设置代理
    pageView.delegate = self
    // 传递数据
    pageView.statusArray = ["1","2","3"]
    // 添加到View中
    self.view.addSubview(pageView)
    
 --------------------------------------------------------------------------------------------------------------
 	
##Usage
 
	// 实现代理方法
	func pageView(pageView: LZPageView, didSelectedPageAtIndex index: NSInteger) {
        print(index)
        
        let alert = UIAlertView()
        alert.message = "是不是被哥的形象所倾倒了..."
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
 
 --------------------------------------------------------------------------------------------------------------
 
 

##期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢!
* 如果在使用过程中发现功能不够用，希望你能Issues我.
