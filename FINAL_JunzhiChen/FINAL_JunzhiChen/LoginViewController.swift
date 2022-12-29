//
//  ViewController.swift
//  FINAL_JunzhiChen
//
//  Created by Orange on 2022-12-14.
//
import FacebookLogin
import UIKit



class LoginViewController: UIViewController {
    
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var userEdit: UITextField!
    @IBOutlet var passwordEdit: UITextField!
    @IBOutlet var googleLogin: UIButton!
    @IBOutlet var facebookLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            }
        let facebookLogin = FBLoginButton()
//        facebookLogin.center = view.center
//        view.addSubview(facebookLogin)
        facebookLogin.permissions = ["public_profile", "email"]

        
        loginLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 44.0)
        //username textfield ui
//        userEdit.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        userEdit?.layer.borderWidth = 1.0
        userEdit?.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        userEdit?.layer.cornerRadius = 5.0
        userEdit?.addConstraint((userEdit?.heightAnchor.constraint(equalToConstant: 50))!)
        userEdit?.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        userEdit?.layer.shadowOffset = CGSize(width: 0, height: 3)
        userEdit?.layer.shadowColor = UIColor.black.cgColor //Any dark color
        
        //password textefield ui
        passwordEdit?.layer.borderColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha:1.0).cgColor
        passwordEdit?.layer.borderWidth = 1.0
        passwordEdit?.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        passwordEdit?.layer.cornerRadius = 5.0
        passwordEdit?.addConstraint((passwordEdit?.heightAnchor.constraint(equalToConstant: 50))!)
        passwordEdit?.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        passwordEdit?.layer.shadowOffset = CGSize(width: 0, height: 3)
        passwordEdit?.layer.shadowColor = UIColor.black.cgColor //Any dark color
        //google button
        googleLogin?.layer.borderColor = UIColor.init(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha:1.0).cgColor
        googleLogin?.layer.borderWidth = 1.0
        googleLogin?.layer.cornerRadius = 5.0
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

