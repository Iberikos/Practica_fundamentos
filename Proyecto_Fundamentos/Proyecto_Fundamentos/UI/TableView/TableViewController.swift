//
//  TableViewController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 9/4/23.
//

import UIKit

struct CustomItem {             ///Definimos el objeto (que es la array de abajo)
    let image: UIImage
    let text: String
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {    ///creamos estos delegados y rellenamos automaticamente los errores de los metodos que nois piden  (copiamos abajo)
    
    @IBOutlet weak var tableView: UITableView!
    
    var heroes: [Heroe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self               ///Importante
        tableView.dataSource = self
        
        title = "Heroes"            /// titulo de la vista
        
        let xib = UINib(nibName: "TableCell", bundle: nil)      ///aqui registramos el archivo xib con nmombre de tablecell
        tableView.register(xib, forCellReuseIdentifier: "customTableCell") ///aqui con la tableView
        
        let token = LocalDataLayer.shared.getToken()
        
        NetworkLayer.shared.fetchHeroes(token: token) { [weak self] allHeroes, error in
            guard let self = self else { return }
            
            if let allHeroes = allHeroes {
                self.heroes = allHeroes
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Error fetching heroes: ", error?.localizedDescription ?? "")
            }
        }
    }
    
    // Delegate & DataSouerce methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count //Para que pinte tantas elementos como haya en la lista
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) /// aqui definimos una celda, utilizamos el primer metodo
        //        let weekDayName = singleRows[indexPath.row]
        //        cell.textLabel?.text = weekDayName
        //
        //        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let heroe = heroes[indexPath.row]
        
        cell.IconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        cell.descLabel.text = heroe.description
        cell.accessoryType = .disclosureIndicator               /// flechita para luego pasar a la siguente vista
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { ///esta funcion es para elegir la altura de las celdas
        return 150
    }
    
    
}

extension UIImageView {
    func setImage(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        downloadImage(url: url) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    private func downloadImage(url:URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        } .resume()
        
    }
}
