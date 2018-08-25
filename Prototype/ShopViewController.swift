//
//  ShopViewController.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let balanceTextBackgroundView = UIView()
    let balanceText = UILabel.create("120 c", .rgb(216,158,0), .mainFont(.semiBold, 18.scaled))
    let taskTitleLabel = UILabel.create("Shop", .white, .mainFont(.semiBold, 36.scaled))
    let taskTable = UITableView()
    let topBar = UIView()
    var count = 0
    var arr: [Info] = [
        Info(type: "", title: "$20 Amazon gift card", reward: 200, description1: "", description2: "", imgRef1: "", imgRef2: ""),
        Info(type: "", title: "$15 Best Buy gift card", reward: 150, description1: "", description2: "", imgRef1: "", imgRef2: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.backgroundColor = .black
        topBar.addToView(self.view, .left, .right, .top, .height(78.scaled.constant))
        taskTitleLabel.addToView(topBar, .centerX, .centerY)
        taskTable.separatorColor = .clear
        taskTable.register(RewardCell.self, forCellReuseIdentifier: "RewardCell")
        balanceTextBackgroundView.backgroundColor = .white
        balanceTextBackgroundView.addToView(topBar, .right(20.scaled.pad), .width(0.2.ratio), .height(taskTitleLabel.height, 0.8.ratio), .centerY)
        
        balanceText.addToView(balanceTextBackgroundView, .centerX, .centerY)
        taskTable.addToView(self.view, .left, .right, .top(topBar.bottom), .bottom)
        self.taskTable.delegate = self
        self.taskTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        balanceTextBackgroundView.layer.cornerRadius = balanceTextBackgroundView.frame.height / 2
    }
    
    func numberOfSections(in taskTable: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ taskTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ taskTable: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // Make the background color show through
    func tableView(_ taskTable: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ taskTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = taskTable.dequeueReusableCell(withIdentifier: "RewardCell", for: indexPath) as? RewardCell else { return UITableViewCell() }
        cell.titleLabel.text = arr[indexPath.row].title
        print("row: \(indexPath.row)")
        cell.ptsLabel.text = "\(arr[indexPath.row].reward) c"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "info") as? InfoViewController
        
        self.present(vc!, animated: true, completion: nil)
        
        vc?.receiveInfo(num: indexPath.row, type: arr[indexPath.row].type, title: arr[indexPath.row].title, reward: arr[indexPath.row].reward, description2: arr[indexPath.row].description2, imgRef2: arr[indexPath.row].imgRef2)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

