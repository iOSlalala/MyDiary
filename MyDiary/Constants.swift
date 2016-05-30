//
//  Constants.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/19.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation
import UIKit

let WIDTH = UIScreen.mainScreen().bounds.width
let HEIGHT = UIScreen.mainScreen().bounds.height

let PreferenceColor = "PreferenceColor"

let PreferenceFont = "PreferenceFont"

let FilePathOfPreference = NSBundle.mainBundle().pathForResource("Preference", ofType: "plist")!

let COLOR_TEXT = UIColor.lightGrayColor()
let COLOR_BACK = UIColor(hexString: "9a7860")
let COLOR_BAR = UIColor(hexString: "91b8a7")
//let FONT_TEXT = PreferenceManager.share.preferFont.font
