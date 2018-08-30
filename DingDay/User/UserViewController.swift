//
//  UserViewController.swift
//  DingDay
//
//  Created by Qing on 2018/8/30.
//  Copyright © 2018 Qing. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

  @IBOutlet weak var emptyView: UIView?
  @IBOutlet weak var tableView: UITableView?
  
  fileprivate let userPresenter = UserPresenter(userService: UserService())
  fileprivate var usersToDisplay = [UserViewData]()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    tableView?.dataSource = self
    
    userPresenter.attachView(self)
    userPresenter.getUsers()
        
  }
  
}

extension UserViewController: UserView {
  func startLoading() {
    print("start")
  }
  
  func finishLoading() {
    print("finish")
  }
  
  func setUsers(_ users: [UserViewData]) {
    usersToDisplay = users
    tableView?.isHidden = false
    emptyView?.isHidden = true;
    tableView?.reloadData()
  }
  
  func setEmptyUsers() {
    tableView?.isHidden = true
    emptyView?.isHidden = false;
  }
}

extension UserViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return usersToDisplay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UserCell")
    
    let userViewData = usersToDisplay[indexPath.row]
    cell.textLabel?.text = userViewData.name
    cell.detailTextLabel?.text = String(userViewData.id)
    
    return cell
  }
}
