//
//  MyFont.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/20.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation

class MyFont:NSObject {
    var fontStr:String!
    var font:UIFont!
    init(str:String,name:String){
        self.fontStr = str
        self.font = UIFont(name: name, size: 16)
    }
}