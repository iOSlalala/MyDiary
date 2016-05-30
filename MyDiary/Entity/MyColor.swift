//
//  PreferColor.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/19.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation
import UIKit
class MyColor:NSObject {
    var backColor:UIColor!
    var textColor:UIColor!
    var barColor:UIColor!
    
    init(back:String,text:String,bar:String){
        self.backColor = UIColor(hexString: back)
        self.textColor = UIColor(hexString: text)
        self.barColor = UIColor(hexString: bar)
    }
}