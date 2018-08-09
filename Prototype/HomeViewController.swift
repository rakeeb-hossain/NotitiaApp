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
    @IBOutlet weak var balanceText: UILabel!

    @IBOutlet weak var taskTable: UITableView!
    
    let db = Firestore.firestore()
    var count = 0
    var arr: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTable.delegate = self
        self.taskTable.dataSource = self
        
        // Count number of tasks

        db.collection("users").getDocuments()
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
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in taskTable: UITableView) -> Int {
        print(arr.count)
        return arr.count
    }
    
    func tableView(_ taskTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        let cell = taskTable.dequeueReusableCell(withIdentifier: "taskList", for: indexPath)
        
        cell.textLabel?.text = arr[indexPath.section].title
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 30
        
        
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
