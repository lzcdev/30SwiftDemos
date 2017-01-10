//
//  CustomFontExample.swift
//  30DaysSwift
//
//  Created by LuzhiChao on 17/1/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit
import CoreData
class CustomFontExample: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["鲁志超现在很菜，但是正在变强", "改变字体是个很好玩的事情", "《三体这本书不错》", "【想一下】[今晚看什么书]", "!@#$%^&*()", "测试测试测试😀"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var changeFontBtn: UIButton!
    @IBAction func changeFont(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        
        changeFontBtn.layer.cornerRadius = 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.textLabel?.text = data[indexPath.row]
        cell?.textLabel?.font = UIFont(name:fontNames[fontRowIndex], size:18)
        return cell!
    }
    

}
