//
//  RootViewController.swift
//  30DaysSwift
//
//  Created by LuzhiChao on 17/1/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    var titles = [String]()
    var classNames = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "30Demo"
        self.addTitle(title: "01-StopWatch", name: StopWatchExample())
        self.addTitle(title: "02-CustomFont", name: CustomFontExample())
        self.addTitle(title: "03-PlayLocalVideo", name: PlayLocalVideoExample())
        
    }
    
    func addTitle(title:String , name:UIViewController) {
        titles.append(title)
        classNames.append(name)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let swiftDemo = "swiftDemo"
        var cell = tableView.dequeueReusableCell(withIdentifier: swiftDemo)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: swiftDemo)
        }
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className = classNames[indexPath.row]
        className.title = titles[indexPath.row]
        self.navigationController?.pushViewController(className, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
