//
//  ChangeFont.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/11/11.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit

let fontArr = PreferenceManager.share.colorAndFontDic!["TextFont"] as! [[String:String]]
public let NofiticationChangeFont = "NofiticationChangeFont"

class ChangeFontVC:BaseVC,UITableViewDelegate,UITableViewDataSource {
    var table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        self.title = "字体们"
    }
    
    func initTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") ?? UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        let myFont = MyFont(str: fontArr[indexPath.row]["FontStr"]!, name: fontArr[indexPath.row]["FontName"]!)
        
        cell.textLabel!.text = myFont.fontStr
        cell.textLabel!.font = myFont.font
        cell.textLabel!.textColor = UIColor.lightGrayColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UserManager.savePreferenceFontIndex(indexPath.row)
        table.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.popToRootViewControllerAnimated(true)
        NSNotificationCenter.defaultCenter().postNotificationName(NofiticationChangeFont, object: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
}