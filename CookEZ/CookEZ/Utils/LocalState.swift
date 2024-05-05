//
//  LocalState.swift
//  CookEZ
//
//  Created by Admin on 3/26/24.
//

import Foundation
public class LocalState {
    
    private enum Keys: String  {
        case hasOnBoarded
        case hasSignedIn
        
    }
    
    public static var hasOnBoarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnBoarded.rawValue)
            
            //just for testing// return false
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnBoarded.rawValue)
            UserDefaults.standard.synchronize() // technically not needed, and not needed in newer versions, IOS automatically does it for us
        }
    }
    public static var hasSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasSignedIn.rawValue)
            
            //just for testing// return false
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasSignedIn.rawValue)
            UserDefaults.standard.synchronize() // technically not needed, and not needed in newer versions, IOS automatically does it for us
        }
    }
    
    
}
