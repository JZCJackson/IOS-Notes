//
//  SettingsViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-15.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
    }
    
    @IBAction func themeChanged(_ sender: Any) {
        if (sender as AnyObject).isOn {
            Theme.current = LightTheme()
        }else {
            Theme.current = DarkTheme()
//            settingsLabel.textColor = LightTheme().textColor

        }

        applyTheme()

    }
    
    @IBAction func textChanged(_ sender: Any) {
        if (sender as AnyObject).isOn {
            Theme.current = LightTheme()
        }else {
            Theme.current = DarkTheme()
//            view.backgroundColor = LightTheme().background

        }

        applyTheme2()

    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.background
    }
    
    fileprivate func applyTheme2() {

        settingsLabel.textColor = Theme.current.textColor

    }
}
