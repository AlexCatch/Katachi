//
//  FormationTextCollectionViewCell.swift
//  FBSnapshotTestCase
//
//  Created by Alex Catchpole on 04/05/2019.
//

import UIKit

public class KatachiTextCollectionViewCell: UICollectionViewCell, KatachiCollectionViewCell {
    public var question: IsKatachiQuestion!
    public static var nibName: String! = "KatachiTextCollectionViewCell"
    public static var isCustom: Bool = false
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup() {
        
    }

}
