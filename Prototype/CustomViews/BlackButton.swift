//
//  BlackButton.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class BlackButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    init(title: String) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 10.scaled
        self.backgroundColor = .black
        self.setTitle(title, for: [])
        self.setTitleColor(.white, for: [])
    }
}
