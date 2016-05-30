//
//  SettingsVC.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/11/11.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC:BaseVC,UITableViewDelegate,UITableViewDataSource,SKStoreProductViewControllerDelegate {
    
    @IBOutlet weak var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "设置"
        table.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") ?? UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")

        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "更换字体"
        case 1:
            cell.textLabel?.text = "给个好评"
        default:break
        }
        
        cell.textLabel!.textColor = UIColor.lightGrayColor()
        cell.textLabel!.font = PreferenceManager.font
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0:
            let vc = ChangeFontVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            gotoRating()
            break
        default:break
        }
        table.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func gotoRating(){
        let str =  "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1076826882"
        UIApplication.sharedApplication().openURL(NSURL(string: str)!)
        
//        let storeProductVC = SKStoreProductViewController()
//        storeProductVC.delegate = self
//        storeProductVC.loadProductWithParameters([SKStoreProductParameterITunesItemIdentifier:"587767923"]) { (finished, error) -> Void in
//            if error != nil {
//                print(error)
//            } else {
//                self.presentViewController(storeProductVC, animated: true, completion: nil)
//            }
//        }
    }
    
//    func productViewControllerDidFinish(viewController: SKStoreProductViewController) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }    
    
}