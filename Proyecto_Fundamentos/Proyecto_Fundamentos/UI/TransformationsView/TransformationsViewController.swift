//
//  TransformationsViewController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 5/6/23.
//

import UIKit

class TransformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var transformations: [Transformations]!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self             
        tableView.dataSource = self
        
        navigationItem.title = "Transformations"
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")
        
        
    }

    // Delegate & DataSouerce methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let heroe = transformations[indexPath.row]
        
        cell.IconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        cell.descLabel.text = heroe.description
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 
        return 150
    }


}
