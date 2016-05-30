//
//  ChangeColor.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/11/11.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit

let KeyColor = "KeyColor"
let colorArr = PreferenceManager.share.colorAndFontDic!["TextColor"] as! [[String:String]]
let colorNameArr = ["1","2","3"]

class ChangeColorVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }
    
    func initTable(){
        table.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        table.delegate = self;
        table.dataSource = self;
        view.addSubview(table)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        let myColor =  MyColor(back: colorArr[indexPath.row]["BackColor"]!, text: colorArr[indexPath.row]["TextColor"]!, bar: colorArr[indexPath.row]["BarColor"]!)
        cell?.textLabel?.text = colorNameArr[indexPath.row]
        cell?.textLabel?.textColor = myColor.textColor
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UserManager.savePreferenceColorIndex(indexPath.row)
        PreferenceManager.share.preferColor = MyColor(back: colorArr[indexPath.row]["BackColor"]!, text: colorArr[indexPath.row]["TextColor"]!, bar: colorArr[indexPath.row]["BarColor"]!)
        self.navigationController?.popViewControllerAnimated(true)
    }

}