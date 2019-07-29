//
//  UIEdgeInserts.swift
//  NumberPad
//
//  Created by Jitendra Kumar on 15/05/19.
//  Copyright © 2019 Jitendra Kumar. All rights reserved.
//

import UIKit

extension UIEdgeInsets{
    
    static func all(_ value:CGFloat)->UIEdgeInsets{
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    static func only(top:CGFloat = 0.0,left:CGFloat = 0.0,bottom:CGFloat = 0.0 ,right:CGFloat = 0.0)->UIEdgeInsets{
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    static func symmetric(vertical:CGFloat = 0.0,horizontal:CGFloat = 0.0)->UIEdgeInsets{
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
}
