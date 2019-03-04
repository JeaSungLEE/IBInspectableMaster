//
//  UIView+Border.swift
//  Bluemoon
//
//  Created by 이재성 on 25/11/2018.
//  Copyright © 2018 mashup6th. All rights reserved.
//

import UIKit

private var flatAssociatedObjectKey: UInt8 = 0

extension UINavigationBar {
    @IBInspectable var flat: Bool {
        get {
            guard let obj = objc_getAssociatedObject(self, &flatAssociatedObjectKey) as? NSNumber else {
                return false
            }
            return obj.boolValue
        }

        set {
            if newValue {
                let void = UIImage()
                setBackgroundImage(void, for: .any, barMetrics: .default)
                shadowImage = void
            } else {
                setBackgroundImage(nil, for: .any, barMetrics: .default)
                shadowImage = nil
            }
            objc_setAssociatedObject(self, &flatAssociatedObjectKey, NSNumber(value: newValue),
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class DismissSegue: UIStoryboardSegue {
    override func perform() {
        source.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension UIView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension UIView {
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

