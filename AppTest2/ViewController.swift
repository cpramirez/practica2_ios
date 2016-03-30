//
//  ViewController.swift
//  AppTest2
//
//  Created by CICE on 30/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    //MARK: - OUTLETS
    @IBOutlet weak var labelSaludo: UILabel!
    @IBOutlet weak var textFieldEdad: UITextField!
    @IBOutlet weak var labelEdad: UILabel!
    
    //MARK: - ACTIONS
    
    @IBAction func clicked(sender: AnyObject) {
        let insertNewAge: Int?
        insertNewAge = Int(textFieldEdad.text!)
        /*if insertNewAge != nil {
            labelSaludo.text = "Andressss!"
            let showNewAge = insertNewAge! * 7
            labelEdad.text = "Tu perro tiene \(showNewAge) años perrunos"
        } else {
            labelSaludo.text = "Hola Mundo"
            labelEdad.text = "Tu perro tiene ... años perrunos"
            print("Introduce un dato")
        }*/
        
        if let newAge = insertNewAge {
            let showNewAge = newAge * 7
            labelEdad.text = "Tu perro tiene \(showNewAge) años perrunos"
        } else {
            labelSaludo.text = "Hola Mundo"
            labelEdad.text = "Tu perro tiene ... años perrunos"
            //creamos la ventana pop-up
            let alertViewController = UIAlertController(title: "Hey!", message: "Escribe por favor la edad de tu perro", preferredStyle: .Alert)
            //creo los botones del pop-up
            let alertAction1 = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let alertAction2 = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            //los añado a la ventana
            alertViewController.addAction(alertAction1)
            alertViewController.addAction(alertAction2)
            //muestro el pop-up
            presentViewController(alertViewController,animated: true, completion: nil)
        }
        
    }
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hola chicos"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - UTILS
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        self.view.endEditing(true)
    }
    
}

