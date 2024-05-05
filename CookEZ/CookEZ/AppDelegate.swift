//
//  AppDelegate.swift
//  CookEZ
//
//  Created by Admin on 3/25/24.
//

import UIKit

let appColorMain: UIColor = .appMain
let appColorMainAccent: UIColor = .appMainAccentCclor
let appColorDark: UIColor = .appDark
let appColorForeGround: UIColor = .appForeground
let appColorFont: UIColor = .appFont
let appColorNegatory: UIColor = .appNegatory

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    

    var window: UIWindow?
    
    let mainViewController = MainViewController()
    let loginViewContrller = LoginViewController()
    let onBoardingContainerViewController = OnBoardingContainerViewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        loginViewContrller.delegate = self
        onBoardingContainerViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = appColorForeGround
        
        registerForNotifications()
        LocalState.hasOnBoarded = false
        RecipeSetup.loadInitalData()
        didLogin()
        
        return true
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
}

extension AppDelegate {
    func setRootViewController(_ vc:UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasSignedIn{
            setRootViewController(mainViewController)
        }else if LocalState.hasOnBoarded {
            setRootViewController(loginViewContrller )
        }else {
            setRootViewController(onBoardingContainerViewController)
        }
    }
}
extension AppDelegate: OnBoardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("Did Finish Onboarding")
        LocalState.hasOnBoarded = true
        setRootViewController(loginViewContrller)
    }
}
extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        print("Did Logout")
        LocalState.hasSignedIn = false
        setRootViewController(loginViewContrller)
    }
}

