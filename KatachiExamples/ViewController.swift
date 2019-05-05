//
//  ViewController.swift
//  KatachiExamples
//
//  Created by Alex Catchpole on 04/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import UIKit
import Katachi

class ViewController: UIViewController, KatachiCollectionViewManagerDelegate, KatachiCollectionViewCellDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var manager: KatachiCollectionViewManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = KatachiCollectionViewManager(delegate: self, collectionView: collectionView)
        manager.sections =  [
            KatachiSection(title: "Hello world", questions: [
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiTextCollectionViewCell.self, key: "oooo", additionalOptions: ["placeholder": "Start Typing..."]),
                KatachiQuestion(title: "Question", type: KatachiPickerCollectionViewCell.self, key: "oooo", additionalOptions: [
                    "options": [
                        "hello",
                        "hello world",
                        "hello world hello",
                        "hello world hello world",
                    ],
                    "placeholder": "Choose an option"
                    ])
                ])
        ]
        manager.cellDelegate = self
        manager.numberOfColumns = 1
        collectionView.reloadData()
    }
    
    func registerCells(for collectionView: UICollectionView) -> [KatachiCollectionViewCell.Type] {
        return [
            KatachiTextCollectionViewCell.self,
            KatachiPickerCollectionViewCell.self
        ]
    }
    
    func registerHeaders(for collectionView: UICollectionView) -> [KatachiCollectionReusableView.Type] {
        return [
            KatachiHeaderCollectionReusableView.self
        ]
    }
    
    func headerHeight(for section: IsKatachiSection, in collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 50)
    }
    
    func questionDidChange(question: IsKatachiQuestion!, value: Any?, sender: Any?) {
        print("did change")
        print(question.title)
        print(value)
    }
    
    func questionActionOccurred(question: IsKatachiQuestion!) {
        
    }
}

