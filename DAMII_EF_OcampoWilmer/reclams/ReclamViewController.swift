//
//  HomeViewController.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 13/12/24.
//

import UIKit

class ReclamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var reclamTableView: UITableView!
    var reclamList: [ReclamEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reclamTableView.dataSource = self
        reclamTableView.delegate = self
        self.findAllData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reclamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reclamCell", for: indexPath) as! ReclamTableViewCell
        let reclam = reclamList[indexPath.row]
        
        cell.dateLabel.text = DateFormatter.formatDate(reclam.datetime)
        cell.timeLabel.text = DateFormatter.formatTime(reclam.datetime)
        cell.fullnameLabel.text = "\(reclam.fullname ?? "")"
        cell.dniLabel.text = "\(reclam.dni ?? "")"
        cell.complaintLabel.text = "DENUNCIA: \(reclam.complaint ?? "")"
        cell.descripLabel.text = "DESCRIPCION: \(reclam.descrip ?? "")"
        cell.storeLabel.text = "\(reclam.store ?? "")"
        cell.placeLabel.text = "Lugar: \(reclam.place ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedReclam = reclamList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let detail = storyboard.instantiateViewController(withIdentifier: "detailView") as? DetailViewController {
            detail.reclam = selectedReclam
            detail.reclamList = reclamList
            detail.indexPath = indexPath
            
            goToDetail(detail: detail)
        }
    }
    
    func goToDetail(detail: DetailViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailNav = storyboard.instantiateViewController(withIdentifier: "DetailNavView") as? UINavigationController {
            if let detailView = detailNav.viewControllers.first as? DetailViewController {
                detailView.reclam = detail.reclam
                detailView.reclamList = detail.reclamList
                detailView.indexPath = detail.indexPath
            }
            
            detailNav.modalPresentationStyle = .fullScreen
            present(detailNav, animated: true, completion: nil)
        }
    }
    
    func goToDetail(){
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = stoyboard.instantiateViewController(withIdentifier: "DetailNavView") as! DetailNavViewController
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
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
