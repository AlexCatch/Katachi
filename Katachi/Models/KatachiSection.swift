//
//  KatachiSection.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation

public struct KatachiSection: IsKatachiSection {
    public var title: String?
    public var questions: [IsKatachiQuestion]!
    
    public init(title: String?, questions: [IsKatachiQuestion]) {
        self.title = title
        self.questions = questions
    }
}
