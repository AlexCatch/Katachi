//
//  KatachiQuestion.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation
import Katachi
public struct KatachiQuestion: IsKatachiQuestion {
    public var title: String!
    public var type: KatachiCollectionViewCell.Type!
    public var key: String!
    public var value: Any?
    public var additionalOptions: [String : Any]!
    
    public init(title: String!, type: KatachiCollectionViewCell.Type!, key: String!, additionalOptions: [String: Any]) {
        self.title = title
        self.type = type
        self.key = key
        self.additionalOptions = additionalOptions
    }
}
