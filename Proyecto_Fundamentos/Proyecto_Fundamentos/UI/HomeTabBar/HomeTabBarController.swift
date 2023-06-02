//
//  HomeTabBarController.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 10/4/23.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupLayout()       ///esto elige el fondo
        setupTabs()
    }
    
    private func setupTabs(){
        let navigationController = UINavigationController(rootViewController: TableViewController())
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController.tabBarItem = UITabBarItem(title: "TableView", image: tabImage, tag: 0)  ///aqui le damos un titulo y una imagen del sistema, los tag como solo tenemos uno marcamos 0 pero si hay más hay que tener en cuenta que no pyueden ser iguales
        
        let collectionViewController = CollectorViewController()
        let tabImg = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        collectionViewController.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImg, tag: 1)
        
        viewControllers = [navigationController, collectionViewController]     ///cogemos la array de ViewControllers pero como solo hay uno cogemos ese, actualizamos y metemos el otro ViewController
    }

    private func setupLayout(){
        tabBar.backgroundColor = .systemBackground ///para que no sea igual el fondo que el de la view
    }
}
