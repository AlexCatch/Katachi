//
//  IsKatachiQuestion.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public protocol IsKatachiQuestion {
    var title: String! { get set }
    var key: String! { get set }
    var value: Any? { get set }
    var type: KatachiTextCollectionViewCell.Type! { get set }
}
