//
//  IsKatachiSection.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public protocol IsKatachiSection {
    var title: String? {get set}
    var questions: [IsKatachiQuestion]! {get set}
    var type: KatachiCollectionReusableView.Type! { get set }
}
