//
//  TableCell.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit


class TableCell: UITableViewCell {
    
    var title:String!{
        didSet {
            titleLbl.text = title
            titleLbl.font = PreferenceManager.font
        }
    }
    var date:String!{
        didSet{
            dateLbl.text = date
            dateLbl.font = PreferenceManager.font
        }
    }
    private var titleLbl = UILabel()
    private var dateLbl = UILabel()
    private var view = UIView()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for  subView in self.subviews{
            if NSStringFromClass(subView.classForCoder) == "UITableViewCellDeleteConfirmationView"{
                subView.subviews.first?.backgroundColor = UIColor.whiteColor()
                let label = UILabel(frame: CGRectMake(0, 10, 60, 60))
                label.font = PreferenceManager.font
                label.text = "弃"
                label.textAlignment = .Center
                label.textColor = COLOR_BAR
                subView.subviews.first?.addSubview(label)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        view.frame = CGRectMake(15, 10, WIDTH - 30, 60)
        view.layer.borderColor = COLOR_BAR.CGColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        contentView.addSubview(view)
        titleLbl.frame = CGRectMake(10, 12, WIDTH - 50, 25)
        titleLbl.font = PreferenceManager.font
        titleLbl.textColor = UIColor.lightGrayColor()
        view.addSubview(titleLbl)
        
        dateLbl.frame = CGRectMake(WIDTH - 140, 30, 140, 25)
        dateLbl.font = PreferenceManager.font
        dateLbl.textColor = COLOR_TEXT
        view.addSubview(dateLbl)
        
        selectionStyle = .None
        separatorInset = UIEdgeInsetsMake(0, WIDTH*2, 0, -WIDTH)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}