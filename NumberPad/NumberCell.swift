//
//  NumberCell.swift
//  NumberPad
//
//  Created by Jitendra Kumar on 15/05/19.
//  Copyright © 2019 Jitendra Kumar. All rights reserved.
//

import UIKit
class NumberCell: UICollectionViewCell {
    
   fileprivate lazy var digitsLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.minimumScaleFactor = 0.5
        return label
    }()
   fileprivate lazy var letterLabel:UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.numberOfLines = 0
        //label.minimumScaleFactor = 0.5
        return label
    }()
    var item:KeyItem?{
        didSet{
            digitsLabel.text = item?.digit ?? ""
            letterLabel.text = item?.letter ?? ""
        }
    }
    fileprivate let defaultBgColor = UIColor(white: 0.9, alpha: 1)
    override var isHighlighted: Bool{
        didSet{
            self.backgroundColor = isHighlighted ? .darkGray : defaultBgColor
            digitsLabel.textColor = isHighlighted ? .white : .black
            letterLabel.textColor = isHighlighted ? .white : .black
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultBgColor
        vStack(digitsLabel,letterLabel).centerInSuperview()
        
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        digitsLabel.minimumScaleFactor = 0.5
       // letterLabel.minimumScaleFactor = 0.5
        layer.cornerRadius = self.frame.width/2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
class GreenCallCell: UICollectionViewCell {
    fileprivate lazy var callButton:UIImageView = {
        let button = UIImageView(image: #imageLiteral(resourceName: "ic_call"))
        //button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0.8212921023, blue: 0.02013419941, alpha: 1)
        addSubview(callButton)
        callButton.centerInSuperview(size: .init(width: 40.0, height: 40.0))
       
        
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width/2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class BackSpaceCell: UICollectionViewCell {
    fileprivate lazy var backSpaceButton:UIImageView = {
        let button = UIImageView(image: #imageLiteral(resourceName: "backspace.png"))
        button.contentMode = .scaleAspectFit
       button.tintColor = UIColor(white: 0.9, alpha: 1)
        return button
    }()
    var isEnableBackSpace:Bool!{
        didSet{
            backSpaceButton.isHidden = !isEnableBackSpace ? true : false
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backSpaceButton)
        backSpaceButton.centerInSuperview(size: .init(width: 40.0, height: 40.0))
        self.isEnableBackSpace = false
        
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width/2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
