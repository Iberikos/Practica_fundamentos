//
//  SceneDelegate.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 9/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?       //Es la primera Scena que vamos a arrancar


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }  ///Guardamos la "escena" con el nombre 'windowsScene' que hereda de UIwindowScene
        window = UIWindow(windowScene: windowsScene)        //Aquí lo inicializamos
        window?.rootViewController = HomeTabBarController() ///Le decimos que la app debe iniciar con la vista TableViewController, hemos cambiado y elejimos que inicie con el "HomeTabBarController"
        window?.makeKeyAndVisible()         ///RECUERDA!!! hay que borrar el 'Main storyboard' del proyecto y el info tambien
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

