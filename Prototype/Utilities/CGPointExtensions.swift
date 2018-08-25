//
//  CGPointExtensions.swift
//  Tasks
//
//  Created by Kevin Bai on 2018-01-04.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

extension CGPoint {
    func isIn(frame: CGRect) -> Bool {
        if x < frame.maxX && x > frame.minX && y < frame.maxY && y > frame.minY {
            return true
        }
        return false
    }
}

extension CGRect {
    var midPoint: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
    }
}
