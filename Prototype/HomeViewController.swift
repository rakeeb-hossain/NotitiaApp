//
//  HomeViewController.swift
//  Prototype
//
//  Created by Rakeeb on 2018-08-04.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

struct Info {
    var type: String
    var title: String
    var reward: Int
    var description1: String
    var description2: String
    var imgRef1: String
    var imgRef2: String
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let balanceTextBackgroundView = UIView()
    let balanceText = UILabel.create("120 c", .rgb(216,158,0), .mainFont(.semiBold, 18.scaled))
    let taskTitleLabel = UILabel.create("Tasks", .white, .mainFont(.semiBold, 36.scaled))
    let taskTable = UITableView()
    let topBar = UIView()
    let db = Firestore.firestore()
    var count = 0
    var arr: [Info] = [
        Info(type: "", title: "Take a selfie!", reward: 20, description1: "", description2: "", imgRef1: "", imgRef2: ""),
        Info(type: "", title: "How funny are these cards?", reward: 10, description1: "", description2: "", imgRef1: "", imgRef2: ""),
        Info(type: "", title: "Take picture of fire hydrants", reward: 10, description1: "", description2: "", imgRef1: "", imgRef2: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.backgroundColor = .black
        topBar.addToView(self.view, .left, .right, .top, .height(78.scaled.constant))
        taskTitleLabel.addToView(topBar, .centerX, .centerY)
        taskTable.separatorColor = .clear
        taskTable.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        balanceTextBackgroundView.backgroundColor = .white
        balanceTextBackgroundView.addToView(topBar, .right(20.scaled.pad), .width(0.2.ratio), .height(taskTitleLabel.height, 0.8.ratio), .centerY)
        
        balanceText.addToView(balanceTextBackgroundView, .centerX, .centerY)
        taskTable.addToView(self.view, .left, .right, .top(topBar.bottom), .bottom)
        self.taskTable.delegate = self
        self.taskTable.dataSource = self
        
        // Count number of tasks

        /*db.collection("users").getDocuments()
            {
                (querySnapshot, err) in
                
                if let err = err
                {
                    print("Error getting balance: \(err)");
                }
                else
                {
                    if let text: String = Auth.auth().currentUser?.email {
                        let balanceRef = self.db.collection("users").document(text)
                        print(text)
                        
                        balanceRef.getDocument() { (document, error) in
                            if let document = document, document.exists {
                                print("We in")
                                guard let balance = document.data()?["balance"] as? String else {
                                    return
                                }
                                self.balanceText.text! = "\(balance)"
                                
                            } else {
                                print("Document does not exist")
                            }
                        }
                    }
                }
        }
        
        db.collection("tasks").getDocuments()
            {
                (querySnapshot, err) in
                
                if let err = err
                {
                    print("Error getting documents: \(err)");
                }
                else
                {
                    for document in querySnapshot!.documents {
                        self.count += 1
                        print("\(document.documentID) => \(document.data())");
                    }
                    
                    print("Count = \(self.count)");
                    
                    for i in 1..<(self.count+1) {
                        let docRef = self.db.collection("tasks").document("\(i)")
                        
                        docRef.getDocument() { (document, error) in
                            if let document = document, document.exists {
                                guard let title = document.data()?["Title"] as? String else {
                                    return
                                }
                                guard let type = document.data()?["Type"] as? String else {
                                    return
                                }
                                guard let reward = document.data()?["Reward"] as? Int else {
                                    return
                                }
                                guard let description1 = document.data()?["Description1"] as? String else {
                                    return
                                }
                                guard let description2 = document.data()?["Description2"] as? String else {
                                    return
                                }
                                guard let imgRef1 = document.data()?["ImgRef1"] as? String else {
                                    return
                                }
                                guard let imgRef2 = document.data()?["ImgRef2"] as? String else {
                                    return
                                }
                                let myStruct = Info(type: type, title: title, reward: reward, description1: description1, description2: description2, imgRef1: imgRef1, imgRef2: imgRef2)
                                
                                self.arr.append(myStruct)
                                self.taskTable.reloadData()
                            } else {
                                print("Document does not exist")
                            }
                        }
                    }

                }
        }
        
        
        */
        // Do any additional setup after loading the view.
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
        guard let cell = taskTable.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else { return UITableViewCell() }
        cell.titleLabel.text = arr[indexPath.row].title
        print("row: \(indexPath.row)")
        cell.ptsLabel.text = "\(arr[indexPath.row].reward) c"
        if indexPath.row == 0 {
            cell.numeratorLabel.text = "4"
            cell.denominatorLabel.text = "20"
        }
        else if indexPath.row == 1 {
            cell.numeratorLabel.text = "8"
            cell.denominatorLabel.text = "10"
        }
        else if indexPath.row == 2 {
            cell.numeratorLabel.text = "8"
            cell.denominatorLabel.text = "8"
            cell.numeratorLabel.textColor = .rgb(206,206,206)
            cell.denominatorLabel.textColor = .rgb(206,206,206)
            cell.titleLabel.textColor = .rgb(206,206,206)
            cell.ptsLabel.textColor = .rgb(206,206,206)
            cell.separatorView.backgroundColor = .rgb(51,219,0)
        }
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
