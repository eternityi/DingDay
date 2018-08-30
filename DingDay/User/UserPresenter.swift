//
//  UserPresenter.swift
//  DingDay
//
//  Created by Qing on 2018/8/30.
//  Copyright © 2018 Qing. All rights reserved.
//

import Foundation

struct UserViewData {
  let name: String
  let id: Int
}

//protocol, an abstraction of the view,
protocol UserView: NSObjectProtocol {
  func startLoading()
  func finishLoading()
  func setUsers(_ users: [UserViewData])
  func setEmptyUsers()
}

class UserPresenter {
  fileprivate let userService: UserService
  weak fileprivate var userView: UserView?
  
  init(userService: UserService) {
    self.userService = userService
  }
  
  func attachView(_ view: UserView) {
    userView = view
  }
  
  func detachView() {
    userView = nil
  }
  
  func getUsers() {
    //user ---> userviewdata
    self.userView?.startLoading()
    userService.getUsers { [weak self] users in
      self?.userView?.finishLoading()
      
      if(users.count == 0) {
        self?.userView?.setEmptyUsers()
      } else {
        
        let mappedUsers = users.map {
          return UserViewData(name: "\($0.firstName) \($0.lastName)", id: $0.id)
        }
        self?.userView?.setUsers(mappedUsers)
        
      }
    }
  }
}
