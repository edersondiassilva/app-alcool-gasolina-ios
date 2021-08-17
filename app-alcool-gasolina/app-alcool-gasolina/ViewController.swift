//
//  ViewController.swift
//  app-alcool-gasolina
//
//  Created by Ederson on 12/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alcoholTextField: UITextField!
    @IBOutlet weak var gasolineTextField: UITextField!
    @IBOutlet weak var messageInformation: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigsLayout()
    }

    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        self.setConfigsLayout()
        self.calc()
    }
    
    func setConfigsLayout(){
        self.messageInformation.backgroundColor = .systemBlue
        self.messageInformation.layer.masksToBounds = true
        self.messageInformation.layer.cornerRadius = 2
        
        self.submitButton.backgroundColor = .systemBlue
        self.submitButton.layer.cornerRadius = self.submitButton.bounds.size.height/2
    }
    
    func validadeTextFields() -> Bool{

        self.alcoholTextField.layer.borderWidth = 0
        self.gasolineTextField.layer.borderWidth = 0
        self.messageInformation.backgroundColor = .systemBlue
        
        let alc:Double = Double(alcoholTextField.text!) ?? 0
        let gas:Double = Double(gasolineTextField.text!) ?? 0
        
        if alc == 0{
            self.alcoholTextField.layer.borderWidth = 1
            self.alcoholTextField.layer.borderColor = UIColor.red.cgColor
            self.messageInformation.backgroundColor = .red
        }
        
        if gas == 0{
            self.gasolineTextField.layer.borderWidth = 1
            self.gasolineTextField.layer.borderColor = UIColor.red.cgColor
            self.messageInformation.backgroundColor = .red
        }
        
        if alc > 0 && gas > 0{
            return true
        }else{
            return false
        }
    }
    
    func calc(){
        
        let isValid = self.validadeTextFields()
        
        if isValid{
            let alc:Double = Double(alcoholTextField.text!) ?? 0
            let gas:Double = Double(gasolineTextField.text!) ?? 0
            let result:Double = (alc / gas) * 100
            
            if result < 70{
                messageInformation.text = "O Álcool é a melhor opção para abastecimento."
            }else{
                messageInformation.text = "A Gasolina é a melhor opção para abastecimento."
            }
        }else{
            messageInformation.text = "Favor preencher os campos corretamente."
        }
        
    }
}
