//
//  UserManager.swift
//  MyDiary
//
//  Created by 王馨妍 on 16/1/19.
//  Copyright © 2016年 Wxy. All rights reserved.
//

import Foundation
import UIKit
class UserManager:NSObject {
    
    static var share = UserManager()
    
    private func getObjectWithKey(key:String)->AnyObject?{
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
    }
    
    private func setObjectWithKey(object:AnyObject?,key:String){
        NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
    }
    
    class func getPreferenceColorIndex()->Int{
        if let index = self.share.getObjectWithKey(PreferenceColor)  as? Int{
            return index
        } else {
            return 0
        }
    }
    
    class func getPreferenceFontIndex()->Int{
        if let index = self.share.getObjectWithKey(PreferenceFont)  as? Int{
            return index
        } else {
            return 0
        }
    }
    
    class func savePreferenceFontIndex(index:Int){
        self.share.setObjectWithKey(index, key: PreferenceFont)
        PreferenceManager.share.loadFont()
    }
    
    class func savePreferenceColorIndex(index:Int) {
        self.share.setObjectWithKey(index, key: PreferenceColor)
    }
}