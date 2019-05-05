//
//  FormationTextCollectionViewCell.swift
//  FBSnapshotTestCase
//
//  Created by Alex Catchpole on 04/05/2019.
//

import UIKit
import Katachi
public class KatachiTextCollectionViewCell: UICollectionViewCell, KatachiCollectionViewCell {
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    public var question: IsKatachiQuestion!
    public weak var delegate: KatachiCollectionViewCellDelegate?
    public static var nibName: String! = "KatachiTextCollectionViewCell"
    public static var isCustom: Bool = false
    public var height: CGFloat = 90.0
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        answerTextField.addTarget(self, action: #selector(KatachiTextCollectionViewCell.textDidChange), for: UIControl.Event.editingChanged)
    }
    
    public func setup() {
        self.questionTitle.text = question.title
        
        if let placeholder = question.additionalOptions["placeholder"] as? String {
            self.answerTextField.placeholder = placeholder
        }
    }
    
    @objc func textDidChange() {
        guard let unwrappedDelegate = delegate else {
            return
        }
        unwrappedDelegate.questionDidChange(question: question, value: answerTextField.text, sender: answerTextField)
    }

}
