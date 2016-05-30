//
//  DiaryDetailVC.swift
//  MyDiary
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit
class DiaryDetailVC: BaseVC {
    
    @IBOutlet weak var textView: UITextView!
    var diary:Diary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if (diary != nil){
            textView.text = diary!.content
            textView.font = PreferenceManager.font
            textView.textColor = COLOR_TEXT
            textView.tintColor = COLOR_BAR
            self.title = DateFormatter().stringFromDate(diary!.time)
        }
    }
}