//
//  Config.swift
//  Group11Alpha
//
//  Created by In Kyoung Choi on 4/10/18.
//  Copyright © 2018 Yeeun Choi. All rights reserved.
//

import Foundation

class Config: NSObject {
    // Define keys for the values to store
    fileprivate static let kUserIdKey = "userId"
    fileprivate static let kPasswordKey = "password"
    
    class func setUserId(_ userId:String) {
        UserDefaults.standard.set(userId, forKey: kUserIdKey)
        UserDefaults.standard.synchronize()
    }
    class func setPassword(_ password:String) {
        UserDefaults.standard.set(password, forKey: kPasswordKey)
        UserDefaults.standard.synchronize()
    }
    
    class func userId() -> String {
        return UserDefaults.standard.object(forKey: kUserIdKey) as! String
    }
    class func password() -> String {
        return UserDefaults.standard.object(forKey: kPasswordKey) as! String
    }
}
