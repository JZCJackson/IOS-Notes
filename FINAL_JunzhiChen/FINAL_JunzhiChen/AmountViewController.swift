//
//  AountViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class AmountViewController: UIViewController {
    @IBOutlet var amountTitleLabel: UILabel!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var amountLabel: UILabel!
    var currentAmount: Int = 0

    public var completion: ((String, String) -> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTitleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        
        titleField.becomeFirstResponder()
    }
    
    @IBAction func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !amountLabel.text!.isEmpty{
            completion?(text, amountLabel.text!)
            }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        //1. When the slider value is changed, we change the amount label text
        currentAmount = Int(sender.value)
        
        amountLabel.text = "\(currentAmount)"
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Theme.current.background
        amountTitleLabel.textColor = Theme.current.textColor

    }
}
