//
//  MyCustomButton.swift
//  NotUseStoryboardUI
//
//  Created by Terry Yang on 2017/6/1.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

public class MyCustomButton: UIButton {
    
    var isToggle: Bool = false {
        didSet {
            if isToggle {
                self.addTarget(self, action: Selector(("touchUpInside:")), for: .touchUpInside)
            } else {
                self.removeTarget(self, action: Selector(("touchUpInside:")), for: .touchUpInside)
            }
        }
    }
    var backgroundColorNormal: UIColor? {
        didSet {
            backgroundColor = backgroundColorNormal
        }
    }
    var backgroundColorHighlighted: UIColor?
    var _backgroundColorHighlighted: UIColor? {
        return backgroundColorHighlighted != nil ? backgroundColorHighlighted : backgroundColorNormal
    }
    var backgroundColorSelected: UIColor?
    var _backgroundColorSelected: UIColor? {
        return backgroundColorSelected != nil ? backgroundColorSelected : _backgroundColorHighlighted
    }
    var backgroundColorHighlightedSelected: UIColor?
    var _backgroundColorHighlightedSelected: UIColor? {
        return backgroundColorHighlightedSelected != nil ? backgroundColorHighlightedSelected : _backgroundColorHighlighted
    }
    
    override public var isHighlighted: Bool {
        didSet {
            switch (isHighlighted, isSelected) {
            case (true, false):
                backgroundColor = _backgroundColorHighlighted
            case (true, true):
                backgroundColor = _backgroundColorHighlightedSelected
            case (false, true):
                backgroundColor = _backgroundColorSelected
            default:
                backgroundColor = backgroundColorNormal
            }
        }
    }
    
    func touchUpInside(sender: UIButton!) {
        isSelected = !isSelected
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        layer.borderWidth = 1.0 //邊框
        layer.borderColor = UIColor.black.cgColor //邊框顏色
        layer.cornerRadius = 5.0 //導圓角半徑
        clipsToBounds = true //裁切
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) //邊距
        setTitleColor(tintColor, for: .normal)
        setTitleColor(UIColor.white, for: .highlighted) //按壓文字顏色
        backgroundColorNormal = UIColor.orange
        backgroundColorHighlighted = UIColor.red //按壓背景顏色
        
    }

}
