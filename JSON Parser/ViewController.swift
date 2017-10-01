//
//  ViewController.swift
//  JSON Parser
//
//  Created by wodl.H on 2017. 10. 1..
//  Copyright © 2017년 desirelab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            guard let array = json as? [Any] else { return }
            for user in array {
                guard let userDict = user as? [String: Any] else { return }
                guard let userID = userDict["id"] as? Int else {print("not an Int"); return }
                guard let userName = userDict["name"] as? String else { return }
                guard let userCompany = userDict["company"] as? [String: String] else { return }
                guard let companyName = userCompany["name"] else {
                    return }
                print(userID)
                print(userName)
                print(companyName)
                print("  ")
            }
        } catch {
            print(error)
        }
    }
}

