//
//  LoginViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 23/03/2023.
//

import UIKit
import ARSLineProgress
//import ARSLineProgres
class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var rememberPassWordButton: UIButton!
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    var isSelectedRightViewTextField:Bool = false
    var isSelectedRememberPass:Bool = false
    var customView:UIView!
    var username:String!
    var password:String!
    
    // MARK: ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImageView.formatBorder(borderWidth: 0, borderColor: UIColor.clear, cornerRadius: self.backgroundImageView.frame.size.height / 16)
        self.rememberPassWordButton.formatBorder(borderWidth: 1, borderColor: UIColor(rgb: 0xD4C5C5), cornerRadius: 6)
        self.loginButton .formatBorder(borderWidth: 1, borderColor: self.loginButton.backgroundColor!, cornerRadius: self.loginButton.frame.size.width / 8)
        self.registerButton .formatBorder(borderWidth: 1, borderColor: UIColor(rgb: 0x0386D0), cornerRadius: self.registerButton.frame.size.width / 8)
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
        self .hideKeyboardWhenTappedAround()
        self .setUpUIRememberPassWordButton(isSelected: self.isSelectedRememberPass)
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
    
    // MARK: Method
    func OpenCustomTabbarViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "CustomTabbarViewController")
    }
    
    func setUpUIRememberPassWordButton(isSelected:Bool) {
        self.rememberPassWordButton.setImage(isSelected ? UIImage(named: "ic_check") : nil, for: .normal)
    }
    
    // MARK: TextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print("While entering the characters this method gets called")
            return true;
    }
    // MARK: Action
    @IBAction func rememberPasswordButton_TouchupInSide(_ sender: Any) {
        self.isSelectedRememberPass = !self.isSelectedRememberPass
        self .setUpUIRememberPassWordButton(isSelected: self.isSelectedRememberPass)
    }
    
    @IBAction func loginButton_TouchupInSide(_ sender: Any) {
        ARSLineProgress.show()
        self.username = self.userNameTextField.text
        self.password = self.passwordTextField.text
        var headers: [String : String] = [:]
        headers["Content-Type"] = "application/json; charset=UTF-8"
        var body: [String : Any] = [:]
        body["Password"] = self.password
        body["Username"] = self.username
        body["DeviceIMEI"] = "3bcbec445806182260bb46067da1e566a1289943"
        MegaHttps(data: body,headers: headers, url: .MobiMapHost,service: .Login ,method: .post).executeQuery { errCode, mess, res in
            ARSLineProgress .hide()
            if (errCode == 0) {
                Defaults.save(self.username, passWord: self.password)
                let vc = self .OpenCustomTabbarViewController()
                vc.modalPresentationStyle = .fullScreen
                self .present(vc, animated: true)
            } else {
                MegaAppHelper() .openAlertControllerWithControler(controller: self,
                                                                  title:"Thông báo",
                                                                  message: mess,
                                                                  styleAlert: .alert,
                                                                  yesTitle:  "Đồng ý",
                                                                  styleYesAction: .default,
                                                                  handerYesAction: { _ in },
                                                                  NoTitle: nil,
                                                                  styleNoAction:nil) {_ in }
            }
        } erroreHanders: { err in
            MegaAppHelper() .openAlertControllerWithControler(controller: self,
                                                              title:"Thông báo",
                                                              message: err.localizedDescription,
                                                              styleAlert: .alert,
                                                              yesTitle:  "Đồng ý",
                                                              styleYesAction: .default,
                                                              handerYesAction: { _ in },
                                                              NoTitle: nil,
                                                              styleNoAction:nil) {_ in }
        }

    }
    
    
}
