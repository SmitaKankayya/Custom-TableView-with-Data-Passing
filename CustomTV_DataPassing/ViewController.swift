//
//  ViewController.swift
//  CustomTV_DataPassing
//
//  Created by Smita Kankayya on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tblView: UITableView!
    
    var array1 = ["Smita", "Arnav", "Sachin", "Sonali", "Karuna", "Sambhaji", "Prashant", "Vriddhi","Smita", "Arnav", "Sachin", "Sonali", "Karuna", "Sambhaji", "Prashant", "Vriddhi"]
    
    var array2 = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH","AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH"]
    
    var arrayImg = [#imageLiteral(resourceName: "9a026c4f8489de6fe54b105591cb5095.jpg"), #imageLiteral(resourceName: "029b805b5ca3ce1e6e7c1de7b305dcfc.jpg"), #imageLiteral(resourceName: "cartoon"), #imageLiteral(resourceName: "png-transparent-christmas-animation-santa-claus-celebrate-christmas-child-holidays-christmas-decoration-thumbnail.png"), #imageLiteral(resourceName: "images.jpeg") , #imageLiteral(resourceName: "Genei1.jpg"), #imageLiteral(resourceName: "family-gathering-on-christmas-illustration-PN7C6B.jpg"), #imageLiteral(resourceName: "teaser.jpg"),#imageLiteral(resourceName: "9a026c4f8489de6fe54b105591cb5095.jpg"), #imageLiteral(resourceName: "029b805b5ca3ce1e6e7c1de7b305dcfc.jpg"), #imageLiteral(resourceName: "cartoon"), #imageLiteral(resourceName: "png-transparent-christmas-animation-santa-claus-celebrate-christmas-child-holidays-christmas-decoration-thumbnail.png"), #imageLiteral(resourceName: "images.jpeg") , #imageLiteral(resourceName: "Genei1.jpg"), #imageLiteral(resourceName: "family-gathering-on-christmas-illustration-PN7C6B.jpg"), #imageLiteral(resourceName: "teaser.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
    }
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        cell!.label1.text = array1[indexPath.row]
        cell!.label2.text = array2[indexPath.row]
        cell!.img.image = arrayImg[indexPath.row]
        
        if indexPath.row % 2 == 0{
            cell!.backgroundColor = .cyan
        }
        else{
            cell!.backgroundColor = .lightGray
        }
        cell!.textLabel?.textColor = .black
        
        return cell!
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailViewController?.strimg = arrayImg[indexPath.row]
        detailViewController?.strLabel1 = array1[indexPath.row]
        detailViewController?.strLabel2 = array2[indexPath.row]
        
        navigationController?.pushViewController(detailViewController!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            array1.remove(at: indexPath.row)
            array2.remove(at: indexPath.row)
            arrayImg.remove(at: indexPath.row)
            tblView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //set initial cell
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        //Final set cell animation
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}
