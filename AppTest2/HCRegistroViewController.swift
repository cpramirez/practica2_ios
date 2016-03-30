//
//  HCRegistroViewController.swift
//  AppTest2
//
//  Created by CICE on 30/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class HCRegistroViewController: UIViewController {
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var textFieldNombre: UITextField!
    @IBOutlet weak var textFieldApellido: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sendInfoToShowDataViewController"{
            //instancia de la clase controller que recibira los datos
            let showDataVC: HCShowDataViewController = segue.destinationViewController as! HCShowDataViewController
            
            showDataVC.nombre = textFieldNombre.text
            showDataVC.apellido = textFieldApellido.text
            showDataVC.email = textFieldEmail.text
            showDataVC.password = textFieldPassword.text
        }
        
    }
    

}
