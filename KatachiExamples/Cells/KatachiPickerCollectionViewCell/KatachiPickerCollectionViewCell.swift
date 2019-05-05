//
//  KatachiPickerCollectionViewCell.swift
//  KatachiExamples
//
//  Created by Alex Catchpole on 05/05/2019.
//  Copyright © 2019 Alex Catchpole. All rights reserved.
//

import UIKit
import Katachi
class KatachiPickerCollectionViewCell: UICollectionViewCell, KatachiCollectionViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    static var nibName: String! = "KatachiPickerCollectionViewCell"
    
    var delegate: KatachiCollectionViewCellDelegate?
    var question: IsKatachiQuestion!
    var height: CGFloat = 90.0
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup() {
        createPicker()
        questionTitleLabel.text = question.title
        if let placeholder = question.additionalOptions["placeholder"] as? String {
            answerTextField.placeholder = placeholder
        }
        
    }
    
    func createPicker() {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        picker.backgroundColor = UIColor.white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Close", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closeButtonPressed))
        
        toolBar.setItems([doneButton], animated: false)
        
        answerTextField.inputView = picker
        answerTextField.inputAccessoryView = toolBar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let items = question.additionalOptions["options"] as? [String] else {
            return 0
        }
        
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let items = question.additionalOptions["options"] as? [String] else {
            return nil
        }
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let items = question.additionalOptions["options"] as? [String] else {
            return
        }
        delegate?.questionDidChange(question: question, value: items[row], sender: answerTextField)
        answerTextField.text = items[row]
    }
    
    @objc func closeButtonPressed()  {
        answerTextField.resignFirstResponder()
    }
}
