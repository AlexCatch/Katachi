//
//  FormationCollectionViewCell.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public protocol KatachiCollectionViewCell: UICollectionViewCell {
    static var nibName: String! { get set }
    
    var delegate: KatachiCollectionViewCellDelegate? { get set }
    
    var question: IsKatachiQuestion! { get set }
    var height: CGFloat { get set }
    
    var collectionView: UICollectionView?
    
    func setup()
}
