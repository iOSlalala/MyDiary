//
//  DiaryManager.swift
//  日记本
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import CoreData
import UIKit
let EntityName = "Diary"
let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
let context = appDel.managedObjectContext
class DiaryManager: NSObject {
    class func saveDiary(content:String){
        let entity = NSEntityDescription.entityForName(EntityName, inManagedObjectContext: context)
        let diary = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        diary.setValue(content, forKey: "content")
        diary.setValue(NSDate(), forKey: "time")
        if content.characters.count < 15 {
            diary.setValue(content, forKey: "title")

        } else{
            diary.setValue((content as NSString).substringToIndex(15), forKey: "title")
        }
        do{
            try context.save()
            print("Save success")
        } catch{
            print("Could not save")
        }
        let fetchRequest = NSFetchRequest(entityName: EntityName)
        do{
            let fetchResult = try context.executeFetchRequest(fetchRequest)
            print(fetchResult.count)
        } catch{
            print("Get error")
        }
    }
    
    class func changeDiary(oldDiary: Diary, newContent: String) {
        deleteDiary(oldDiary)
        saveDiary(newContent)
    }
    
    class func searchDiary() -> [Diary]? {
        let fetch = NSFetchRequest(entityName: EntityName)
        //排序
        let sort = NSSortDescriptor(key: "time", ascending: false)
        fetch.sortDescriptors = [sort]
        
        do{
            let diaryArr = try context.executeFetchRequest(fetch) as! [Diary]
            return diaryArr
        } catch{
            print("Get error")
        }
        return nil
    }
    class func deleteDiary(diary:Diary) -> Bool{
        context.deleteObject(diary)
        do{
            try context.save()
            return true
        } catch{
            print("Delete failed")
            return false
        }
    }
    
}