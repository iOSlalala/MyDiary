//
//  AddDiary.swift
//  日记本
//
//  Created by 王馨妍 on 15/10/16.
//  Copyright © 2015年 Wxy. All rights reserved.
//

import Foundation
import UIKit

let Color_Purple = UIColor(red: 0xc6/255.0, green: 0x87/255.0, blue: 0xff/255.0, alpha: 1.0) //c687ff

class AddDiaryVC:BaseVC {
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    var diary: Diary?
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.titleLabel!.font = PreferenceManager.font
        textView.font = PreferenceManager.font
        textView.textColor = COLOR_TEXT
        textView.tintColor = COLOR_BAR
        saveBtn.setTitleColor(COLOR_BAR, forState: .Normal)
        saveBtn.setTitleColor(COLOR_BACK, forState: .Highlighted)
        if diary != nil {
            textView.text = diary!.content
            self.title = NSDateFormatter.shortStrFromFate(diary!.time)
        } else {
            textView.becomeFirstResponder()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = diary {
            if d.content == textView.text {
                return
            } else {
                DiaryManager.changeDiary(d, newContent: textView.text)
            }
        }
        
        else if !textView.text.isEmpty {
            DiaryManager.saveDiary(textView.text)
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func saveAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}