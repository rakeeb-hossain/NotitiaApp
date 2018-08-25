//
//  UIColorExtensions.swift
//  Tasks
//
//  Created by Kevin Bai on 2018-01-06.
//  Copyright © 2018 Kevin Bai. All rights reserved.
//

import UIKit

extension UILabel {
    class func create(_ title: String, _ color: UIColor, _ font: UIFont?, textAlign: NSTextAlignment = .natural) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = color
        label.font = font
        label.textAlignment = textAlign
        return label
    }
}

extension UITextField {
    var placeholderColor: UIColor? {
        get {
            return nil
        }
        set(value) {
            //self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : value ?? UIColor.white])
            //NSAttributedStringKey(
        }
    }
}

extension UIColor {
    class func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}

extension UIView {
    func layoutRootView() {
        guard let view = self.superview else {
            return self.layoutIfNeeded()
        }
        return view.layoutRootView()
    }
    func getRootViewImage() -> UIImage? {
        let rootView = getRootView()
        return rootView.getImage()
    }
    func getImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    private func getRootView() -> UIView {
        guard let view = self.superview else {
            return self
        }
        return view
    }
}

extension UIViewController {
    func getRootVC() -> UIViewController {
        guard let vc = self.parent else { return self }
        return vc.getRootVC()
    }
}

