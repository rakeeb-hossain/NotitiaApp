//
//  RewardCell.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class RewardCell: UITableViewCell {
    
    let ptsLabel = UILabel.create("", .rgb(216,158,0), .mainFont(.light, 18.scaled))
    let titleLabel = UILabel.create("", .black, .mainFont(.light, 18.scaled))
    
    let redeemButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "RewardCell")
        
        redeemButton.setTitle("Redeem", for: [])
        redeemButton.setTitleColor(.black, for: [])
        redeemButton.titleLabel?.font = UIFont.mainFont(.light, 18.scaled)
        redeemButton.layer.borderColor = UIColor.black.cgColor
        redeemButton.layer.borderWidth = 2.scaled
        
        ptsLabel.addToView(self, .left(20.scaled.pad), .centerY)
        titleLabel.addToView(self, .left(20.scaled.pad), .bottom(self.centerY, 5.scaled.pad))
        ptsLabel.addToView(self, .left(20.scaled.pad), .top(self.centerY, 5.scaled.pad))
        redeemButton.addToView(self, .height(0.5.ratio), .centerY(ptsLabel.centerY), .right(20.scaled.pad), .width(0.4.ratio))
        
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        redeemButton.layer.cornerRadius = redeemButton.frame.height / 2
    }
}

