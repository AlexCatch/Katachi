//
//  KatachiHeaderCollectionReusableView.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import UIKit
import Katachi
public class KatachiHeaderCollectionReusableView: UICollectionReusableView, KatachiCollectionReusableView {
    
    @IBOutlet weak var title: UILabel!
    
    public var section: IsKatachiSection!
    public static var nibName: String! = "KatachiHeaderCollectionReusableView"
    public static var viewType: String! = UICollectionView.elementKindSectionHeader
    public static var isCustom: Bool = false
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setup() {
        title.text = section.title
    }
    
}
