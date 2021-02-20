//
//  ViewController.swift
//  Wikipedia_app
//
//  Created by Жанадил on 2/18/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit

class VC: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "segue1", sender: self)
        searchTextField.endEditing(true)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            let destination = segue.destination as! VC2
            destination.object = searchTextField.text!
        }
    }
}



// UITextFieldDelegate Methods
extension VC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}
