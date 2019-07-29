//
//  DailedNumberHeader.swift
//  NumberPad
//
//  Created by Jitendra Kumar on 15/05/19.
//  Copyright © 2019 Jitendra Kumar. All rights reserved.
//

import UIKit

class DailedNumberHeader: UICollectionReusableView {
    
    fileprivate lazy var numberLabel:UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
       // label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var input:String?{
        didSet{
            numberLabel.text = input ?? ""
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(numberLabel)
        numberLabel.fillSuperview(padding: .only(left:32,right:32))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
