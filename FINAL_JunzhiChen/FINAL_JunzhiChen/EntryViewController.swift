//
//  EntryViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var reminderLabel: UILabel!

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        reminderLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)

        
        titleField.becomeFirstResponder()
        noteField.text = "Put your notes here"
        noteField.textColor = UIColor.lightGray
    }

    @IBAction func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Theme.current.background
        reminderLabel.textColor = Theme.current.textColor

    }
    

}
