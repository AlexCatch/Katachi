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
    func registerHeaders(for collectionView: UICollectionView) -> [KatachiCollectionReusableView.Type]
    func headerHeight(for section: IsKatachiSection, in collectionView: UICollectionView) -> CGSize
}

public class KatachiCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public weak var collectionView: UICollectionView?
    public weak var delegate: KatachiCollectionViewManagerDelegate?
    public weak var cellDelegate: KatachiCollectionViewCellDelegate?
    public var numberOfColumns: Int! = 1
    public var sections: [IsKatachiSection]! = []
    
    
    /// Create a new KatachiCollectionViewManager
    ///
    /// - Parameters:
    ///   - delegate: Required to register cells and calculate heights
    ///   - collectionView: The collection view to manage
    public init(delegate: KatachiCollectionViewManagerDelegate, collectionView: UICollectionView?) {
        super.init()
        self.delegate = delegate
        self.collectionView = collectionView
        
        registerCells()
        registerReusableViews()
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
    }
    
    
    /// Register cells to use
    private func registerCells() {
        guard let unwrappedCollectionView = collectionView else {
            return
        }
        
        guard let managerDelegate = delegate else {
            return
        }
        
        let cellsToRegister = managerDelegate.registerCells(for: unwrappedCollectionView)
        for cell in cellsToRegister {
            let nib = UINib(nibName: cell.nibName, bundle: nil)
            unwrappedCollectionView.register(nib, forCellWithReuseIdentifier: cell.nibName)
        }
    }
    
    
    /// Register any reusable views such as headers or footers
    private func registerReusableViews() {
        guard let unwrappedCollectionView = collectionView else {
            return
        }
        
        guard let managerDelegate = delegate else {
            return
        }
        let headersToRegister = managerDelegate.registerHeaders(for: unwrappedCollectionView)
        for cell in headersToRegister {
            let nib = UINib(nibName: cell.nibName, bundle: nil)
            unwrappedCollectionView.register(nib, forSupplementaryViewOfKind: cell.viewType, withReuseIdentifier: cell.nibName)
        }
    }
    
    
    /// Dequeue the specified cell with a question and the cell delegate
    ///
    /// - Parameters:
    ///   - collectionView: The collection view to dequeue for
    ///   - question: The question to pass to the deqeued cell
    ///   - indexPath: The index path to deqeue for
    /// - Returns: KatachiCollectionViewCell
    private func dequeueCellForQuestion(collectionView: UICollectionView, question: IsKatachiQuestion, indexPath: IndexPath) -> KatachiCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: question.type.nibName, for: indexPath) as! KatachiCollectionViewCell
        cell.question = question
        cell.delegate = cellDelegate
        cell.setup()
        return cell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let question = sections[indexPath.section].questions[indexPath.row]
        return dequeueCellForQuestion(collectionView: collectionView, question: question, indexPath: indexPath)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].questions.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = sections[indexPath.section]
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: section.type.viewType, withReuseIdentifier: section.type.nibName, for: indexPath) as! KatachiCollectionReusableView
        view.section = section
        view.setup()
        return view
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        guard let managerDelegate = delegate else {
            return CGSize(width: 0, height: 0)
        }
        
        return managerDelegate.headerHeight(for: sections[section], in: collectionView)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let question = sections[indexPath.section].questions[indexPath.item]
        let dummyCell = dequeueCellForQuestion(collectionView: collectionView, question: question, indexPath: indexPath)
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / CGFloat(numberOfColumns)
        return CGSize(width: size, height: dummyCell.height)
    }
    
}
