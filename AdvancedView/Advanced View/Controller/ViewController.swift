//
//  ViewController.swift
//  Advanced View
//
//  Created by Mac on 11/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var weekDaysPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var weekArray = PickerModel.sharedInstance.weekdays
    var colorArray = PickerModel.sharedInstance.colors
    
    //MARK: - ViewController LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        weekDaysPicker.delegate = self
        weekDaysPicker.dataSource = self
    }
}

//MARK: - DatePicker
extension ViewController{
    @IBAction func dateDisplay(_ sender: UIButton){
        
        let dateformat=DateFormatter()
        dateformat.dateFormat="dd MM YYYY"
        let result = dateformat.string(from: (datePicker?.date)!)
        dateLabel.text = result
        
    }
}

//MARK: - PickerView
extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        weekArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekArray[row]
    }
    //MARK: - PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row = weekDaysPicker.selectedRow(inComponent: 0)
        colorLabel.text = colorArray[row]
    }
    
}

