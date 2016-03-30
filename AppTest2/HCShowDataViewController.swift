//
//  HCShowDataViewController.swift
//  AppTest2
//
//  Created by CICE on 30/3/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class HCShowDataViewController: UIViewController {

    //MARK: - VARIABLES LOCALES GLOBALES
    var nombre: String?
    var apellido: String?
    var email: String?
    var password: String?
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelApellido: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    
    //MARK: - ACTIONS
    @IBAction func selectImageWithCamera(sender: AnyObject) {
        pickPhoto()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelNombre.text = nombre
        labelApellido.text = apellido
        labelEmail.text = email
        labelPassword.text = password
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - EXTENSION PICKER IMAGE
extension HCShowDataViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickPhoto(){
        //si la camara esta disponible, sacamos un menu para que elija usarla o ir a la galeria
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            showPhotoMenu()
        } else {
            //sino vamos directamente a la galeria
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu(){
        //creamos el menu, lo mostramos y procesamos la respuesta
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default) { (alert) -> Void in
            self.takePhotoWithCamera()
            
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Select Photo", style: .Default) {(alert) -> Void in
            self.choosePhotoFromLibrary()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibraryAction)
        presentViewController(alertController, animated:  true, completion: nil)
    }
    
    func takePhotoWithCamera(){
        //la clase que realmente se encarga de hacer la gestion de la imagen
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
}