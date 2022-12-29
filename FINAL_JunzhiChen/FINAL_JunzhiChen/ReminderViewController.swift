//
//  reminderViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var reminderLabel: UITextView!

    public var reminderTitle: String = ""
    public var reminder: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = reminderTitle
        reminderLabel.text = reminder
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Theme.current.background
        titleLabel.textColor = Theme.current.textColor

    }
}
