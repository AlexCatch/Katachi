//
//  ViewController.swift
//  KatachiExamples
//
//  Created by Alex Catchpole on 04/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import UIKit
import Katachi

class ViewController: UIViewController, KatachiCollectionViewManagerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var manager: KatachiCollectionViewManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager = KatachiCollectionViewManager(delegate: self, collectionView: collectionView, sections: [
            KatachiSection(title: "Hello world", questions: [
                KatachiQuestion(title: "oooo", type: KatachiTextCollectionViewCell.self, key: "oooo")
            ])
        ])
        collectionView.reloadData()
    }
    
    func registerCells(for collectionView: UICollectionView) -> [KatachiCollectionViewCell.Type] {
        return [
            KatachiTextCollectionViewCell.self
        ]
    }
}

