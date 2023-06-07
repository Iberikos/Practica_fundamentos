//
//  DetailsViewController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 3/6/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var heroeImageView: UIImageView!
    @IBOutlet weak var heroeNameLabel: UILabel!
    @IBOutlet weak var heroeDescLabel: UILabel!
    @IBOutlet weak var transformacionsButton: UIButton!
    var heroe: Heroe!
    var transformations: [Transformations] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = heroe.name
        
        heroeImageView.setImage(url: heroe.photo)
        heroeNameLabel.text = heroe.name
        heroeDescLabel.text = heroe.description
        
        let token = LocalDataLayer.shared.getToken()
        
        NetworkLayer
            .shared
            .fetchTransformations(token: token, heroeId: heroe.id) { [weak self] allTrans, error in
                guard let self = self else { return }
                
                if let allTrans = allTrans {
                    self.transformations = allTrans
                    print("trans count: ", allTrans.count)
                    
                
                    if !self.transformations.isEmpty {
                        DispatchQueue.main.async {
                            self.transformacionsButton.alpha = 1
                        }
                    }
                } else {
                    print ("Error fetching transformations: ", error?.localizedDescription ?? "")
                }
            }

    }

    @IBAction func transformationsButtonTab(_ sender: UIButton) {
        let transView = TransformationsViewController()
        transView.transformations = self.transformations
        
        navigationController?.pushViewController(transView, animated: true)
    }
    
}
