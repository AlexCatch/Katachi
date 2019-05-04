//
//  KatachiQuestion.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public struct KatachiQuestion: IsKatachiQuestion {
    public var title: String!
    public var type: KatachiTextCollectionViewCell.Type!
    public var key: String!
    public var value: Any?
    
    public init(title: String!, type: KatachiTextCollectionViewCell.Type!, key: String!) {
        self.title = title
        self.type = type
        self.key = key
    }
}
