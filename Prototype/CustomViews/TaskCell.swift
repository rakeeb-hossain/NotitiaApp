//
//  TaskCell.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let ptsLabel = UILabel.create("1 c", .rgb(216,158,0), .mainFont(.light, 18.scaled))
    let separatorView = UIView()
    let titleLabel = UILabel.create("Take a selfie! asdasdf a af as ", .black, .mainFont(.light, 24.scaled))
    
    let fractionView = UIView()
    let numeratorLabel = UILabel.create("3", .black, .mainFont(.light, 16.scaled))
    let divideView = UIView()
    let denominatorLabel = UILabel.create("20", .black, .mainFont(.light, 16.scaled))
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TaskCell")
        
        separatorView.backgroundColor = .rgb(112,112,112)
        divideView.backgroundColor = .rgb(112,112,112)
        
        ptsLabel.addToView(self, .left(20.scaled.pad), .centerY)
        separatorView.addToView(self, .left(ptsLabel.right, 10.scaled.pad), .width(5.scaled.constant), .height(0.8.ratio), .centerY)
        
        fractionView.addToView(self, .left(self.right, (-50).scaled.pad), .right(20.scaled.pad), .top, .bottom)
        divideView.addToView(fractionView, .centerX, .width(0.8.ratio), .height(1.scaled.constant), .centerY)
        numeratorLabel.addToView(fractionView, .bottom(divideView.top), .centerX)
        denominatorLabel.addToView(fractionView, .top(divideView.bottom), .centerX)
        titleLabel.addToView(self, .left(separatorView.right, 10.scaled.pad), .right(fractionView.left), .centerY)
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorView.layer.cornerRadius = separatorView.frame.width / 2
    }
}
