//
//  FormationCollectionViewCell.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public protocol KatachiCollectionViewCell: UICollectionViewCell {
    var question: IsKatachiQuestion! { get set }
    static var nibName: String! { get set }
    static var isCustom: Bool { get set }
    func setup()
}
