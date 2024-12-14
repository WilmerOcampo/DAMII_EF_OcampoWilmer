//
//  RegisterViewController.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 13/12/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var product: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var store: UITextField!
    @IBOutlet weak var complaint: UITextField!
    @IBOutlet weak var descrip: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let fullname = fullname.text!
        let dni = dni.text!
        let email = email.text!
        let product = product.text!
        let place = place.text!
        let store = store.text!
        let complaint = complaint.text!
        let descrip = descrip.text!
        
        self.registerData(fullname: fullname, dni: dni, email: email, product: product, place: place, store: store, complaint: complaint, descrip: descrip)
    }
}

extension RegisterViewController {
    func registerData(fullname: String, dni: String, email: String, product: String, place: String, store: String, complaint: String, descrip: String){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistenceContainer.viewContext
        
        let entity = ReclamEntity(context: context)
        entity.fullname = fullname
        entity.dni = dni
        entity.email = email
        entity.product = product
        entity.place = place
        entity.store = store
        entity.complaint = complaint
        entity.descrip = descrip
        entity.datetime = Date()
        
        do {
            try context.save()
            self.goToHome()
        } catch let error as NSError {
            print(error)
        }
    }
}

extension RegisterViewController {
    func goToHome(){
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = stoyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
    }
}
