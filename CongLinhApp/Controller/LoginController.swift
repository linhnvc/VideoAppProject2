//
//  LoginController.swift
//  CongLinhApp
//
//  Created by nguyen van cong linh on 21/04/2018.
//  Copyright © 2018 nguyen van cong linh. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let inputContainerView: UIView = {
        let inputContainerView = UIView()
        inputContainerView.backgroundColor = .white
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.layer.cornerRadius = 15
        inputContainerView.layer.masksToBounds = true
        return inputContainerView
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.rgb(displayP3Red: 63, green: 136, blue: 72)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleLogin(){
        
        let username = usernameTextField.text
        let password = passwdTextField.text
        if username == "" && password == "" {
            navigationController?.pushViewController(AccountSettingController(), animated: true)
            //present(AccountSetting(), animated: true, completion: nil)
            print("Login")
        } else if username == "" && password != "" {
            let alert: UIAlertController = UIAlertController(title: "Thong bao", message: "Ban chua nhap username", preferredStyle: UIAlertControllerStyle.alert)
            let buttonOK: UIAlertAction = UIAlertAction(title: "Nhap lai", style: .destructive, handler: nil)
            alert.addAction(buttonOK)
            present(alert, animated: true, completion: nil)
            print("Chua nhap username")
        } else if password == "" && username != "" {
            let alert: UIAlertController = UIAlertController(title: "Thong bao", message: "Ban chua nhap password", preferredStyle: UIAlertControllerStyle.alert)
            let buttonOK: UIAlertAction = UIAlertAction(title: "Nhap lai", style: .destructive, handler: nil)
            alert.addAction(buttonOK)
            present(alert, animated: true, completion: nil)
            print("Chua nhap password")
        } else if password == "z" && username == "" {
            let alert: UIAlertController = UIAlertController(title: "Thong bao", message: "Ban chua nhap username va password", preferredStyle: UIAlertControllerStyle.alert)
            let buttonOK: UIAlertAction = UIAlertAction(title: "Nhap lai", style: .destructive, handler: nil)
            alert.addAction(buttonOK)
            present(alert, animated: true, completion: nil)
            print("Chua nhap username va password")
        }
            
        
        else {
            let alert: UIAlertController = UIAlertController(title: "Thong bao", message: "Ban da nhap sai username hoac passwd, vui long nhap lai!", preferredStyle: UIAlertControllerStyle.alert)
            let buttonOK: UIAlertAction = UIAlertAction(title: "Nhap lai", style: .destructive, handler: nil)
            alert.addAction(buttonOK)
            present(alert, animated: true, completion: nil)
            print("Sai pass")
        }
    }
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwdTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.rgb(displayP3Red: 185, green: 185, blue: 185)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(displayP3Red: 65, green: 124, blue: 62)
        navigationItem.title = "Login"
        
        view.addSubview(inputContainerView)
        view.addSubview(loginButton)
        setupInputContainerView()
        setupLoginButton()
        
    }
    
    
    func setupInputContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputContainerView.addSubview(usernameTextField)
        usernameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        usernameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        inputContainerView.addSubview(line)
        line.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor).isActive = true
        line.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        line.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        inputContainerView.addSubview(passwdTextField)
        passwdTextField.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        passwdTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwdTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwdTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 10).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}













