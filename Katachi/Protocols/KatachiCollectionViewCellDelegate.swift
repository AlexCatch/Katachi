//
//  KatachiCollectionViewCellDelegate.swift
//  Katachi
//
//  Created by Alex Catchpole on 05/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import Foundation

public protocol KatachiCollectionViewCellDelegate: class {
    func questionDidChange(question: IsKatachiQuestion!, value: Any?, sender: Any?)
    func questionActionOccurred(question: IsKatachiQuestion!)
}
