//
//  ViewController.swift
//  FourPick
//
//  Created by Derek Fitzer on 4/30/21.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var textTitle: UILabel!
    
    @IBOutlet weak var textOne: UILabel!
    
    @IBOutlet weak var textThree: UILabel!
    @IBOutlet weak var textTwo: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var resText = ""
    
    var pickedValue: [Int] = [0,0,0,0]
    
    var pickerData = [["⬛️ 0", "🟫 1", "🟥 2", "🟧 3","🟨 4","🟩 5","🟦 6","🟪 7","⬜️ 8", "   9","Silver","Gold"],
            ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3","🟨 4","🟩 5","🟦 6","🟪 7","⬜️ 8", "   9","Silver","Gold"],
            
            ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3","🟨 4","🟩 5","🟦 6","🟪 7","⬜️ 8", "   9","Silver","Gold"],
             ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3","🟨 4","🟩 5","🟦 6","🟪 7","⬜️ 8", "   9","Silver","Gold"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    // The data to return fopr the row and component (column) that's being passed in
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return pickerData[component][row]
     }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            pickedValue[0] = row
        case 1:
            pickedValue[1] = row
        case 2:
            pickedValue[2] = row
        case 3:
            pickedValue[3] = row
        default:
            break
        }
        print(pickedValue)
        calcValue()
        
    }
    
    func calcValue(){
        var mult = 1
        let n1 = pickedValue[0] * 10
        let n2 = pickedValue[1] + n1
        
        if pickedValue[2] > 0 {
        for _ in 1...pickedValue[2]{
            mult *= 10
        }
        }
        
        let total = n2 * mult
        
        
        if pickedValue[0] > 9 || pickedValue[1] > 9 {
            textOne.text = "Invalid Color Code"
        } else {
            textOne.text = "\(String(total)) Ohm Resistor"
           // tol(val: pickedValue[3])
        if total > 1000, total < 1000000 {
            let adjTotal = total / 1000
            textTwo.text = "\(String(adjTotal))KΩ Resistor"
            tol(val: pickedValue[3])
        } else if total > 1000000, total < 1000000000 {
            let adjTotal = total / 100000
            textTwo.text = "\(String(adjTotal))MΩ Resistor"
            tol(val: pickedValue[3])
        } else if total > 1000000000 {
            let adjTotal = total / 100000000
            textTwo.text = "\(String(adjTotal))GΩ Resistor"
            tol(val: pickedValue[3])
        } else {
            textTwo.text = ""
        }
        }
    }
    
    func tol(val: Int){
        switch val {
        case 0: textTwo.text! += " ± 20%"
        case 1: textTwo.text! += " ± 1%"
        case 2: textTwo.text! += " ± 2%"
        case 3: textTwo.text! += " ± 3%"
        case 4: textTwo.text! += " -0 +100%"
        case 5: textTwo.text! += " ± 0.5%"
        case 6: textTwo.text! += " ± 0.25%"
        case 7: textTwo.text! += " ± 0.10%"
        case 8: textTwo.text! += " ± 0.05%"
        case 9: textTwo.text! += " ± 10%"
        case 10: textTwo.text! += " ± 10%"
        case 11: textTwo.text! += " ± 5%"
        default:
            textTwo.text! += " ± 20%"
        }
        textTwo.text! += " Tolerance"
    }

}


