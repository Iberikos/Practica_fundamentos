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
    
//    let singleRows = ["lunes", "martes", "miercoles", "jueves", "viernes", "Sabado", "domingo"]
    
    let customRows = [
            CustomItem(image: UIImage(systemName: "pencil.circle")!, text: "lunes"),
            CustomItem(image: UIImage(systemName: "trash.circle")!, text: "martes"),
            CustomItem(image: UIImage(systemName: "folder.circle")!, text: "miércoles"),
            CustomItem(image: UIImage(systemName: "paperplane.circle")!, text: "jueves"),
            CustomItem(image: UIImage(systemName: "doc.circle")!, text: "viernes"),
            CustomItem(image: UIImage(systemName: "terminal")!, text: "sábado"),
            CustomItem(image: UIImage(systemName: "book.closed")!, text: "domingo")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self               ///Importante
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // identifier es unico, registrar la celda que vamos a usar
        let xib = UINib(nibName: "TableCell", bundle: nil)      ///aqui registramos el archivo xib con nmombre de tablecell
        tableView.register(xib, forCellReuseIdentifier: "customTableCell") ///aqui con la tableView
    }
    
    // Delegate & DataSouerce methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customRows.count //Para que pinte tantas elementos como haya en la lista
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) /// aqui definimos una celda, utilizamos el primer metodo
//        let weekDayName = singleRows[indexPath.row]
//        cell.textLabel?.text = weekDayName
//
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let customItem = customRows[indexPath.row]
        cell.IconImageView.image = customItem.image
        cell.titleLabel.text = customItem.text
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { ///esta funcion es para elegir la altura de las celdas
        return 100
    }


}
