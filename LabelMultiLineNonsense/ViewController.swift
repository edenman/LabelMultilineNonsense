//
//  ViewController.swift
//  LabelMultiLineNonsense
//
//  Created by Eric Denman on 3/13/18.
//  Copyright © 2018 Coffee Train Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  private let tableView = UITableView()
  private let longString = "This is a much longer string it should wrap to multiple lines I am serious you guys"

  private let strings: [String]

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    fatalError("omg")
  }

  required init?(coder aDecoder: NSCoder) {
    strings = ["foo", "foo", "foo", "foo", longString, longString, longString, longString, longString, longString]

    super.init(nibName: nil, bundle: nil)

    view.backgroundColor = UIColor.white
    view.addSubview(tableView)
    
    view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))

    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    tableView.delegate = self
    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.reloadData()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return strings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return MyTableViewCell()
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    configureCell(cell as! MyTableViewCell, indexPath: indexPath)
  }
  
  private func configureCell(_ cell: MyTableViewCell, indexPath: IndexPath) {
    let string = strings[indexPath.row]
    cell.set(string)
  }
}

