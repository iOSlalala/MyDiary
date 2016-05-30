//
//  PreferenceManager.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/19.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation
import UIKit



class PreferenceManager: NSObject {
    static var share = PreferenceManager()
    var preferFont: MyFont!
    static var font: UIFont {
        return PreferenceManager.share.preferFont.font
    }
    
    override init() {
        super.init()
        colorAndFontDic = NSDictionary(contentsOfFile: FilePathOfPreference)
        loadFont()
    }
    
    func loadFont(){
        let fontIndex = UserManager.getPreferenceFontIndex()
        preferFont = getFontByIndex(fontIndex)
    }

    func getFontByIndex(index:Int)->MyFont{
        let fontArr = colorAndFontDic!["TextFont"] as! [[String:String]]
        let dic = fontArr[index]
        print(dic)
        return MyFont(str: dic["FontStr"]!, name: dic["FontName"]!)
    }
    
    var colorAndFontDic:NSDictionary?

}