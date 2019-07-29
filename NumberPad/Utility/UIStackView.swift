//
//  UIStackView.swift
//  NumberPad
//
//  Created by Jitendra Kumar on 15/05/19.
//  Copyright © 2019 Jitendra Kumar. All rights reserved.
//

import UIKit

extension UIStackView{
    
    @discardableResult
    func margins(_ margin:UIEdgeInsets) -> UIStackView {
        layoutMargins = margin
        isLayoutMarginsRelativeArrangement = true
        
        return self
    }

    @discardableResult
    func leftPadding(_ left:CGFloat)->UIStackView{
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = left
        return self
    }
    @discardableResult
    func topPadding(_ top:CGFloat)->UIStackView{
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = top
        return self
    }
    @discardableResult
    func bottomPadding(_ bottom:CGFloat)->UIStackView{
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = bottom
        return self
    }
    @discardableResult
    func rightPadding(_ right:CGFloat)->UIStackView{
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = right
        return self
    }
    @discardableResult
    func distribution(_ distribution:UIStackView.Distribution = .fillEqually)->UIStackView{
        self.distribution = distribution
        return self
    }
    
}

extension UIView{
    
    fileprivate func stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        addSubview(stackView)
       // stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    open func vStack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill) -> UIStackView {
        return stack(.vertical, views: views, spacing: spacing, alignment: alignment)
    }
    
    @discardableResult
    open func hStack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill) -> UIStackView {
        return stack(.horizontal, views: views, spacing: spacing, alignment: alignment)
    }
    
    @discardableResult
    open func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    open func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func withBorder(width: CGFloat, color: UIColor) -> UIView {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }
}

