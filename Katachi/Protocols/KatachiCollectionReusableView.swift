//
//  KatachiCollectionReusableView.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import Foundation

public protocol KatachiCollectionReusableView: UICollectionReusableView {
    var section: IsKatachiSection! { get set }
    
    static var nibName: String! { get set }
    static var viewType: String! { get set }
    
    func setup()
}
