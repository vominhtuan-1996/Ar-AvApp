//
//  LoginViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 23/03/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var isSelectedRightViewTextField:Bool = false
    var customView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImageView.formatBorder(borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 50)
        self .hideKeyboardWhenTappedAround()
        let defaultAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black
        ] as [NSAttributedString.Key : Any]
        
        let marketingAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.init(rgb: 0x036BB9)
        ] as [NSAttributedString.Key : Any]
        
        let wellcomeAttributes = [
            .font: UIFont.systemFont(ofSize: 21, weight: .bold),
            .foregroundColor: UIColor.black
        ] as [NSAttributedString.Key : Any]
        
        let attributedStringComponents = [
            NSAttributedString(string: "Welcome \n",attributes: wellcomeAttributes),
            NSAttributedString(string: "By signing in you are agreeing our \n", attributes: defaultAttributes),
            NSAttributedString(string: "Term and privacy policy", attributes: marketingAttributes),
        ] as [AttributedStringComponent]
        self.labelLogin.attributedText = NSAttributedString(from: attributedStringComponents, defaultAttributes: defaultAttributes)
        self.labelLogin.textAlignment = .center
        self.labelLogin.backgroundColor = UIColor.clear
        self.userNameTextField.setupRightImage(imageName: "ic_mail",tintColors: .lightGray)
        self.passwordTextField.setupRightImage(imageName: "ic_lock",tintColors: .lightGray)
        self.passwordTextField.rightView?.addTapGestureRecognizer {
            self.isSelectedRightViewTextField = !self.isSelectedRightViewTextField
            if (self.isSelectedRightViewTextField) {
                self.passwordTextField.isSecureTextEntry = false
            } else {
                self.passwordTextField.isSecureTextEntry = true
            }
        }
    }
}
