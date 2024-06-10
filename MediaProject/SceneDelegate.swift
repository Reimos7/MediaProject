//
//  SceneDelegate.swift
//  MediaProject
//
//  Created by 홍석평 on 6/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // UIWindow가 뷰 컨트롤러를 보여주는 역할
    // 이게 없으면 특정 화면을 가질수 없으니 특정 화면을 가질수 있는 상태를 가져야함
    
    var window: UIWindow?

    // 스토리보드에서 엔트리포인트를 찾아서 화면을 띄어주는 함수
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // 빈화면을 끼워주는 역할
        window = UIWindow(windowScene: scene)
        
        let vc = MovieViewController()
        window?.rootViewController = vc // 스토리보드의 엔트리포인트
        window?.makeKeyAndVisible() // 실제로 사용자한테 보여지게끔 사용하는 코드
        
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

