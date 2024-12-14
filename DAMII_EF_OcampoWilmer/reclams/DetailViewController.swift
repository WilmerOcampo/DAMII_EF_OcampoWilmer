//
//  DetailViewController.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 14/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var complaintLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    
    var reclam: ReclamEntity?
    var reclamList: [ReclamEntity] = []
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let reclam = reclam {
            dateLabel.text = DateFormatter.formatDate(reclam.datetime)
            timeLabel.text = DateFormatter.formatTime(reclam.datetime)
            fullnameLabel.text = reclam.fullname
            dniLabel.text = reclam.dni
            emailLabel.text = reclam.email
            productLabel.text = reclam.product
            placeLabel.text = reclam.place
            storeLabel.text = reclam.store
            complaintLabel.text = reclam.complaint
            descripLabel.text = reclam.descrip
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.goToHome()
    }
    

    @IBAction func deleteAction(_ sender: Any) {
        self.showAlertDelete()
    }
}

extension DetailViewController {
    func deleteCoreData(index: IndexPath, reclam: ReclamEntity){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistenceContainer.viewContext
        context.delete(reclam)
        
        do {
            try context.save()
            reclamList.remove(at: index.row)
        } catch let error as NSError {
            print(error)
        }
    }
}

extension DetailViewController {
    func goToHome(){
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = stoyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
    }
}

extension DetailViewController {
    func showAlertDelete(){
        let alert = UIAlertController(title: "Eliminar Reclamo", message: "Los datos se eliminarán permanentemente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        let actionDelete = UIAlertAction(title: "Eliminar", style: .destructive) { _ in
            if let reclam = self.reclam, let indexPath = self.indexPath {
                self.deleteCoreData(index: indexPath, reclam: reclam)
                self.goToHome()
            }
        }
        alert.addAction(actionDelete)
        present(alert, animated: true)
    }
}
