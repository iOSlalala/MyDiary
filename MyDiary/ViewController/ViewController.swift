//
//  ViewController.swift
//  日记本
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    var dataArr: [Diary]?
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableFooterView = UIView(frame: CGRectZero)
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataArr = DiaryManager.searchDiary()
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:TableCell = tableView.dequeueReusableCellWithIdentifier("TableCell") as? TableCell ?? TableCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TableCell")
        let diary = dataArr![indexPath.row]
        cell.date = NSDateFormatter.shortStrFromFate(diary.time)
        cell.title = diary.title
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr?.count ?? 0
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            if DiaryManager.deleteDiary(dataArr![indexPath.row]){
                dataArr!.removeAtIndex(indexPath.row)
                table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddDiaryVC") as! AddDiaryVC
        detailVC.diary = dataArr![indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension NSDateFormatter {
    class var shortFormatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter
    }
    
    class func shortStrFromFate(date:NSDate) -> String {
        return shortFormatter.stringFromDate(date)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if navigationController?.viewControllers.count >= 2 {
            return true
        }
        
        return false
    }
}
