//
//  TableViewController.swift
//  NotUseStoryboardUI
//
//  Created by Terry Yang on 2017/5/26.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class TableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    let data : [String] = ["WinterIsComing","OursIsTheFury","HearMeRoar","BloodAndFire"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TableViewController"
        
        let fullScreenSize = UIScreen.main.bounds.size
        let myTabview = UITableView(frame: CGRect(x: 0,y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20),style: .plain)
        myTabview.register(TableViewControllerCell.self, forCellReuseIdentifier: "MyCell")
        myTabview.delegate = self
        myTabview.dataSource = self
        myTabview.separatorStyle = .singleLine
        myTabview.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        myTabview.allowsSelection = true
        myTabview.allowsMultipleSelection = false
        self.view.addSubview(myTabview)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewControllerCell
        cell.awakeFromNib()
        cell.lab.textColor = .black
        cell.lab.text = data[indexPath.row]
        cell.iv.image = UIImage(named: data[indexPath.row]+".jpeg")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TabBarViewController()
        vc.titles = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
