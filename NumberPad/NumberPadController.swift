//
//  ViewController.swift
//  NumberPad
//
//  Created by Jitendra Kumar on 15/05/19.
//  Copyright © 2019 Jitendra Kumar. All rights reserved.
//

import UIKit
import AVFoundation
struct KeyItem {
    let digit:String!
    let letter:String!
}
enum DailTone:Int {
    case tockTone = 1104
    case touchTone = 1200
    case longTouchTone = 1211
    case startCallTone = 1254
    case ringingTone = 1151
    case redailTone = 1255
    case answerCallTone = 1256
    case endCallTone  = 1257
    
    static func playSound(soundID:DailTone){
        // create a sound ID, in this case its the tock sound.
        let systemSoundID: SystemSoundID = SystemSoundID(soundID.rawValue)
        // to play sound
        AudioServicesPlaySystemSound (systemSoundID)
    }
}
class NumberPadController: UICollectionViewController {
    fileprivate let cellId = "NumberCell"
    fileprivate let greenCallCellId = "GreenCallCell"
    fileprivate let backSpaceCellId = "BackSpaceCell"
    fileprivate let headerId = "HeaderCell"
    fileprivate var dailedNumberString:String = ""
    fileprivate let number:[KeyItem] = [
        KeyItem(digit: "1", letter: ""),
        KeyItem(digit: "2", letter: "A B C"),
        KeyItem(digit: "3", letter: "D E F"),
        KeyItem(digit: "4", letter: "G H I"),
        KeyItem(digit: "5", letter: "J K L"),
        KeyItem(digit: "6", letter: "M N O"),
        KeyItem(digit: "7", letter: "P Q R S"),
        KeyItem(digit: "8", letter: "T U V"),
        KeyItem(digit: "9", letter: "W X Y Z"),
        KeyItem(digit: "*", letter: ""),
        KeyItem(digit: "0", letter: "+"),
        KeyItem(digit: "#", letter: ""),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(GreenCallCell.self, forCellWithReuseIdentifier: greenCallCellId)
        collectionView.register(BackSpaceCell.self, forCellWithReuseIdentifier: backSpaceCellId)
        collectionView.register(DailedNumberHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: headerId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? 2: number.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if indexPath.row == 0{
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: greenCallCellId, for: indexPath) as! GreenCallCell
                return cell
            }else{
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: backSpaceCellId, for: indexPath) as! BackSpaceCell
                cell.isEnableBackSpace = self.dailedNumberString.count>0 ? true : false
                return cell
            }
        }
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NumberCell
        cell.item = number[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DailedNumberHeader
        header.input = dailedNumberString
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        let height = view.frame.height*0.2
        return .init(width: view.frame.width, height: height)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            dailedNumberString += number[indexPath.row].digit
           DailTone.playSound(soundID: .touchTone)
            collectionView.reloadData()
        }else{
            if indexPath.row == 1{
                //delete number
                dailedNumberString =  String(dailedNumberString.dropLast())
                DailTone.playSound(soundID: .tockTone)
                collectionView.reloadData()
                
            }else{
                //call functionality
                DailTone.playSound(soundID: .startCallTone)
            }
        }
        
        
    }
}

extension NumberPadController:UICollectionViewDelegateFlowLayout{
    var lrPadding:CGFloat{return view.frame.width * 0.13 }
    var interSpacing :CGFloat{ return view.frame.width * 0.1}
    var cellWidth :CGFloat{ return(view.frame.width - 2 * lrPadding - 2 * interSpacing)/3}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: cellWidth, height: cellWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            let lPadding = view.frame.width/2 - cellWidth/2
            return .init(top: 0, left: lPadding, bottom: 0, right: lrPadding)
        }
        let lrPadding = view.frame.width * 0.15
        return .init(top: 16, left: lrPadding, bottom: 16, right: lrPadding)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

