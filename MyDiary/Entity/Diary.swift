//
//  Diary.swift
//  日记本
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import CoreData

class Diary: NSManagedObject {
    @NSManaged var title:String
    @NSManaged var content:String
    @NSManaged var time:NSDate
    
}