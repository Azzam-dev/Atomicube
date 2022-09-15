//
//  TextFieldExtentions.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 15/09/2022.
//

import UIKit

fileprivate var __maxLengths = [UITextField: Int]()
extension UITextField {
    
    @IBInspectable
    var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

@IBDesignable
class DesignableTextField: UITextField {
    
    @IBInspectable
    var underline: CGFloat = 0 {
        didSet {
            if underline > 0 { addUnderlineLayer(lineWidth: underline) }
        }
    }
    
    @IBInspectable
    var lineColor: UIColor = .black {
        didSet {
            if underline > 0 { addUnderlineLayer(lineWidth: underline) }
        }
    }
    
    func addUnderlineLayer(lineWidth: CGFloat) {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: frame.height, width: frame.width , height: lineWidth)
        bottomLayer.backgroundColor = lineColor.cgColor
        layer.addSublayer(bottomLayer)
    }
    
}
