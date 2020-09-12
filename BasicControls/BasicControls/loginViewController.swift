//
//  ViewController.swift
//  BasicControls
//
//  Created by Mac on 12/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class loginViewController: UIViewController,UITextFieldDelegate {
    
    //MARK: - Propeties
    var username1:UITextField?
    var password1:UITextField?
    var username : UILabel?
    var password : UILabel?
    var loginbtn : UIButton?
    var segmentcontrol : UISegmentedControl?
    var slider : UISlider?
    var switch1 : UISwitch?
    var imageview : UIImageView?
    var actualimage : UIImage?
    var switchLabel : UILabel?
    var sliderLabel : UILabel?
    var scrollView : UIScrollView!
    
    //MARK: - ViewControllerLife Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        self.navigationItem.title="Login view Controller"
        scrollView = UIScrollView(frame: UIScreen.main.bounds)
        self.view.addSubview(scrollView)
        userInterfaceUpdate()
    }
    override func viewDidDisappear(_ animated: Bool) {
        username1?.text=""
        password1?.text=""
    }
}
//MARK: - userInterfaceUpdate
extension loginViewController{
    func userInterfaceUpdate() {
        //MARK: - Labels
        username=UILabel(frame: CGRect(x: 50, y: 100, width: 150, height: 50))
        username!.text="User Name"
        self.scrollView.addSubview(username!)
        password=UILabel(frame: CGRect(x: 50, y: 150, width: 150, height: 50))
        password!.text="Password"
        self.scrollView.addSubview(password!)
        
        //MARK: - TextField
        username1=UITextField(frame: CGRect(x: 150, y: 100, width: 150, height: 30))
        username1?.borderStyle=UITextField.BorderStyle.roundedRect
        username1?.keyboardType=UIKeyboardType.URL
        username1?.keyboardAppearance=UIKeyboardAppearance.default
        username1?.returnKeyType=UIReturnKeyType.done
        username1?.delegate=self
        self.scrollView.addSubview(username1!)
        
        password1=UITextField(frame: CGRect(x: 150, y: 150, width: 150, height: 30))
        password1?.borderStyle=UITextField.BorderStyle.roundedRect
        password1?.keyboardType=UIKeyboardType.URL
        password1?.keyboardAppearance=UIKeyboardAppearance.default
        password1?.returnKeyType=UIReturnKeyType.done
        password1?.isSecureTextEntry=true
        password1?.delegate=self
        self.scrollView.addSubview(password1!)
        
        //MARK: - Buttons
        loginbtn=UIButton(type: UIButton.ButtonType.roundedRect)
        loginbtn?.frame=CGRect(x: 100, y: 200, width: 200, height: 50)
        loginbtn?.setTitle("login", for: UIControl.State.normal)
        loginbtn?.setTitle("selected", for: UIControl.State.highlighted)
        loginbtn?.tintColor=UIColor.red
        loginbtn?.addTarget(self, action: #selector(btnclick), for:UIControl.Event.touchUpInside)
        self.scrollView.addSubview(loginbtn!)
        
        //MARK: - Segment
        segmentcontrol=UISegmentedControl(items: ["Red","Green","Blue"])
        segmentcontrol?.frame=CGRect(x: 100, y: 270, width: 200, height: 100)
        segmentcontrol?.addTarget(self, action: #selector(segmentchange), for: .valueChanged)
        self.scrollView.addSubview(segmentcontrol!)
        
        //MARK: - Slider
        slider=UISlider(frame: CGRect(x: 100, y: 370, width: 150, height: 50))
        slider?.minimumValue=1
        slider?.maximumValue=100
        slider?.minimumTrackTintColor=UIColor.brown
        slider?.maximumTrackTintColor=UIColor.magenta
        slider?.addTarget(self, action: #selector(sliderchange), for: .valueChanged)
        self.scrollView.addSubview(slider!)
        sliderLabel=UILabel(frame: CGRect(x: 150, y: 420, width: 100, height: 30))
        sliderLabel?.text = "0.0"
        self.scrollView.addSubview(sliderLabel!)
        
        
        //MARK: - Switch
        switch1=UISwitch(frame: CGRect(x: 150, y: 470, width: 30, height: 30))
        switch1?.addTarget(self, action: #selector(switchchange), for: .valueChanged)
        self.scrollView.addSubview(switch1!)
        
        switchLabel=UILabel(frame: CGRect(x: 150, y: 520, width: 50, height: 30))
        switchLabel?.text = "Off"
        self.scrollView.addSubview(switchLabel!)
        
        
    }
    
    //MARK: - Segmentchange
    @objc func segmentchange()
    {
        if segmentcontrol?.selectedSegmentIndex == 0
        {
            self.view.backgroundColor = .red
        }
        else if segmentcontrol?.selectedSegmentIndex == 1
        {
            self.view.backgroundColor = .green
        }
        if segmentcontrol?.selectedSegmentIndex == 2
        {
            self.view.backgroundColor = .blue
        }
    }
    
    
    //MARK: - Sliderchange
    @objc func sliderchange()
    {
        sliderLabel?.text = "\(slider?.value ?? 0.0)"
    }
    
    //MARK: - Switchchange
    @objc func switchchange()
    {
        if (switch1?.isOn)!
        {
            switchLabel?.text = "On"
        }
        else
        {
            switchLabel?.text = "Off"
        }
    }
    
    //MARK: - Login button action/Navigation/DataPassing
    @objc func btnclick()
    {
        let homevc=homepageViewController()
        homevc.tempValue=username1?.text
        self.navigationController?.pushViewController(homevc, animated: true)
        
    }
    
    //MARK: - TextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField==username1
        {
            password1?.becomeFirstResponder()
        }
        else
        {
            if username1?.text==password1?.text
            {
                self.view.backgroundColor=UIColor.green
            }
            else
            {
                self.view.backgroundColor=UIColor.red
            }
            password1?.resignFirstResponder()
        }
        return true
    }
}



