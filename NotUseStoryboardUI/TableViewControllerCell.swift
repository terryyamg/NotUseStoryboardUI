//
//  TableViewControllerCell.swift
//  NotUseStoryboardUI
//
//  Created by Terry Yang on 2017/5/31.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class TableViewControllerCell: UITableViewCell {
    var iv = UIImageView()
    let lab = UILabel()
    var btn = MyCustomButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        creatLabel()
        creatImageView()
        creatButton()
        setAutoLayoutConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func creatLabel(){
        lab.text = "Hi Hi"
        self.contentView.addSubview(lab)
    }
    
    func creatImageView(){
        let myImage: UIImage = UIImage(named: "a_song_of_ice_and_fire.jpeg")!
        iv = UIImageView(image: myImage)
        self.contentView.addSubview(iv)
    }
    
    func creatButton(){
        btn.setTitle("Click", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.contentView.addSubview(btn)

    }
    
    func buttonAction(sender: UIButton){

    }
    
    func setAutoLayoutConstraints(){
        /*
        ┌────────────────────────────┐
        │┌─────┐                     │
        ││     │  ┌─────┐    ┌─────┐ │
        │┼  iv ┼  ┼ lab ┼    ┼ lab ┼ │
        ││     │  └─────┘    └─────┘ │
        │└─────┘                     │
        └────────────────────────────┘
         */
        let viewsDict : [String : UIView] = ["iv": iv, "lab": lab, "btn": btn]
        iv.translatesAutoresizingMaskIntoConstraints = false
        lab.translatesAutoresizingMaskIntoConstraints = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(iv.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        constraints.append(lab.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        constraints.append(btn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[iv(100)]-[lab(150)]-[btn]",
                                                      options: [], metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[iv(100)]",
                                                      options: [], metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[lab(100)]", options: [], metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[btn(100)]", options: [], metrics: nil, views: viewsDict)
        NSLayoutConstraint.activate(constraints)
        
    }
}
