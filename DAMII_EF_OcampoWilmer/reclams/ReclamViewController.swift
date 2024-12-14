//
//  HomeViewController.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 13/12/24.
//

import UIKit

class ReclamViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var reclamTableView: UITableView!
    var reclamList: [ReclamEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reclamTableView.dataSource = self
        self.findAllData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reclamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reclamCell", for: indexPath) as! ReclamTableViewCell
        
        let reclam = reclamList[indexPath.row]
      
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: reclam.datetime ?? Date())
        cell.dateLabel.text = "\(dateString)"
        
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: reclam.datetime ?? Date())
        cell.timeLabel.text = "\(timeString)"
        
        cell.fullnameLabel.text = "\(reclam.fullname ?? "")"
        cell.dniLabel.text = "\(reclam.dni ?? "")"
        cell.complaintLabel.text = "DENUNCIA: \(reclam.complaint ?? "")"
        cell.descripLabel.text = "DESCRIPCION: \(reclam.descrip ?? "")"
        cell.storeLabel.text = "\(reclam.store ?? "")"
        cell.placeLabel.text = "Lugar: \(reclam.place ?? "")"
        
        return cell
        
    }

}

extension ReclamViewController {
    func findAllData(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistenceContainer.viewContext
        
        do {
            let reclams = try context.fetch(ReclamEntity.fetchRequest())
            self.reclamList = reclams
        } catch let error as NSError {
            print(error)
        }
        self.reclamTableView.reloadData()
    }
}
