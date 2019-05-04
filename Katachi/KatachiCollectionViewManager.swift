//
//  KatachiCollectionViewManager.swift
//  Katachi
//
//  Created by Alex Catchpole on 04/05/2019.
//

import Foundation
import UIKit

public protocol KatachiCollectionViewManagerDelegate: class {
    func registerCells(for collectionView: UICollectionView) -> [KatachiCollectionViewCell.Type]
}

public class KatachiCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView?
    public weak var delegate: KatachiCollectionViewManagerDelegate?
    var sections: [IsKatachiSection]!
    
    public init(delegate: KatachiCollectionViewManagerDelegate, collectionView: UICollectionView?, sections: [IsKatachiSection]!) {
        super.init()
        self.delegate = delegate
        self.sections = sections
        self.collectionView = collectionView
        
        registerCells()
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
    }
    
    private func registerCells() {
        guard let unwrappedCollectionView = collectionView else {
            return
        }
        
        guard let managerDelegate = delegate else {
            return
        }
        let cellsToRegister = managerDelegate.registerCells(for: unwrappedCollectionView)
        for cell in cellsToRegister {
            let nib = UINib(nibName: cell.nibName, bundle: !cell.isCustom ? Bundle(identifier: "tech.catchpole.Katachi") : nil)
            unwrappedCollectionView.register(nib, forCellWithReuseIdentifier: cell.nibName)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let question = sections[indexPath.section].questions[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: question.type.nibName, for: indexPath) as! KatachiCollectionViewCell
        cell.question = question
        cell.setup()
        return cell
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].questions.count
    }
    
}
