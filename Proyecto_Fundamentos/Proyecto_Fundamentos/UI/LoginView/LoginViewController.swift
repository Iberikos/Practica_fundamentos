//
//  LoginViewController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 24/5/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        loginButton.alpha = 0
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 0,
                       options: []) {
            self.emailTextField.center.x += self.view.bounds.width
            self.passwordTextField.center.x += self.view.bounds.width

        }
        
        UIView.animate(withDuration: 5) {
            self.loginButton.alpha = 1
        }
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            print("email is empty")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        NetworkLayer.shared.login(email: email, password: password) { token, error in
            if let token = token {
                LocalDataLayer.shared.save(token: token)
                print("We got a valid token!")
                print(token)
                
                DispatchQueue.main.async {
                    
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{ ($0 as? UIWindowScene)?.keyWindow }
                        .first?
                        .rootViewController = HomeTabBarController() 
                }
                
            } else {
                print("Login Error: ", error?.localizedDescription ?? "")
            }
        }
        
    }
    
    
    
}
