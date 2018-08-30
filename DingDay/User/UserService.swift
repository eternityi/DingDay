//
//  UserService.swift
//  DingDay
//
//  Created by Qing on 2018/8/30.
//  Copyright © 2018 Qing. All rights reserved.
//

import Foundation

class UserService {
  func getUsers(_ callBack:([User]) -> Void) {
    let users = [User(firstName: "Ed", lastName: "Shreen", email:"ed@gmail.com", id:1),
    ]
    
    callBack(users)
  }
}
