
//
//  BaseVC.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/28.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation

class BaseVC : UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        let backItem = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: #selector(BaseVC.back))
        self.navigationItem.leftBarButtonItem = backItem
        //启用滑动返回（swipe back）
//        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
    }
    
    //是否允许手势
//    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
//        print(self.navigationController?.viewControllers.count )
//        
//        if (gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer) {
//            //只有二级以及以下的页面允许手势返回
////            return self.navigationController?.viewControllers.count > 1
//            return true
//        }
//        return false
//    }
    
    func back(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        setFont(self.view)
    }
    
    func setFont(view: UIView) {
        if let lbl = view as? UILabel {
            lbl.font = PreferenceManager.share.preferFont.font
        }
        
        for v in view.subviews {
            setFont(v)
        }
    }
}
