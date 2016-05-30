//
//  NavigationController.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation

import UIKit

class NavigationController:UINavigationController,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        print("NavigationController  viewDidLoad")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(changeFont), name: NofiticationChangeFont, object: nil)
    }

//    override func pushViewController(viewController: UIViewController, animated: Bool) {
//        self.interactivePopGestureRecognizer!.enabled = false
//        super.pushViewController(viewController, animated: animated)
//    }
    
    func changeFont() {
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: PreferenceManager.font]
    }
    
}