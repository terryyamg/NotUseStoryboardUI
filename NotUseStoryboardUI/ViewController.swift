//
//  ViewController.swift
//  NotUseStoryboardUI
//
//  Created by Terry Yang on 2017/5/26.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lab = UILabel()
    let btn = MyCustomButton()
    var iv = UIImageView()
    let metrics = ["p": 15] // padding
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
        creatLabel()             //建立一個Label
        creatButton()            //建立一個Button
        creatImageView()
        setAutoLayoutConstraints()  //設定位置
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func creatLabel(){
        lab.text = "A Song of Ice and Fire"
        self.view.addSubview(lab)
    }
    
    func creatButton(){
        btn.setTitle("Table", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    func buttonAction(sender: UIButton){
        
        let vc = TableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func creatImageView(){
        let myImage: UIImage = UIImage(named: "a_song_of_ice_and_fire.jpeg")!
        iv = UIImageView(image: myImage)
        self.view.addSubview(iv)
    }
    
    func setAutoLayoutConstraints(){
        /*
         ┌─────────────────────┐
         │       ┌──┼──┐       │
         │       │     │       │
         │       │  iv │       │
         │       │     │       │
         │       └──┼──┘       │
         │                     │
         │       ┌──┼──┐       │
         │       │ lab │       │
         │       └──┼──┘       │
         │                     │
         │       ┌──┼──┐       │
         │       ┼ btn ┼       │
         │       └──┼──┘       │
         │                     │
         │                     │
         │                     │
         │                     │
         │                     │
         │                     │
         │                     │
         └─────────────────────┘
         */
        let viewsDict : [String : UIView] = ["lab": lab, "btn": btn, "iv": iv]
        lab.translatesAutoresizingMaskIntoConstraints = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        iv.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(btn.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(btn.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        constraints.append(lab.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(iv.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[iv(100)]-(p)-[lab(50)]-(p)-[btn(50)]",
                                                      options: [], metrics: metrics, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[lab]",
                                                      options: [], metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[btn(100)]",
                                                      options: [], metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[iv(100)]", options: [], metrics: nil, views: viewsDict)
        NSLayoutConstraint.activate(constraints)
        
    }
    
}

