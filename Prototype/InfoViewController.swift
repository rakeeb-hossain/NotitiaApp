//
//  InfoViewController.swift
//  Prototype
//
//  Created by Rakeeb on 2018-08-05.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var number: Int = 0
    var type: String = ""
    var reward: Int = 0
    var imgRef: String = ""
    
    let balanceTextBackgroundView = UIView()
    let balanceText = UILabel.create("120 c", .rgb(216,158,0), .mainFont(.semiBold, 18.scaled))
    let taskTitleLabel = UILabel.create("Task", .white, .mainFont(.semiBold, 36.scaled))
    let taskTable = UITableView()
    let topBar = UIView()
    let taskImg = UIImageView()
    let taskLabel = UILabel.create("Take a selfie!", .black, .mainFont(.semiBold, 24.scaled))
    let startButton = UIButton(type: .system)
    
    let rewardText = UILabel.create("", .rgb(216,158,0), .mainFont(.regular, 18.scaled))
    let descriptionTask = UITextView()
    @objc func beginTask(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePickerController.sourceType = .camera
                imagePickerController.allowsEditing = true
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not available!")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any])
    {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picker.dismiss(animated: true, completion: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "classify") as! ClassifyViewController
        vc.receiveClassifyInfo(image: image)
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func receiveInfo (num: Int, type: String, title: String, reward: Int, description2: String, imgRef2: String)
    {
        print(num)
        self.number = num + 1
        
        self.type = type
        self.number = num + 1
        self.reward = reward
        self.imgRef = imgRef2
        print("Self: \(self.imgRef)")
    }
    
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
        let exLabel = UILabel.create("Example: ", .black, .mainFont(.semiBold, 18.scaled))
        
        taskLabel.addToView(self.view, .top(topBar.bottom, 10.scaled.pad), .centerX)
        exLabel.addToView(self.view, .top(taskLabel.bottom, 10.scaled.pad), .left(20.scaled.pad))
        taskImg.addToView(self.view, .centerX, .top(exLabel.bottom, 10.scaled.pad), .width(0.5.ratio), .height(taskImg.width))
        descriptionTask.addToView(self.view, .left(20.scaled.pad), .right(20.scaled.pad), .top(taskImg.bottom, 10.scaled.pad), .bottom(50.scaled.pad))
        
        descriptionTask.isUserInteractionEnabled = false
        descriptionTask.textColor = .black
        descriptionTask.font = .mainFont(.light, 16.scaled)
        descriptionTask.text = "Take a picture of yourself (selfie) and report your deomgraphics and expressions in the photo for 20 coins. These coins can be used towards buying things like gift cards and PayPal Vouchers!"
        
        
        taskImg.image = UIImage(named: "Kevin")
        rewardText.text = "10 c"
        
        startButton.setTitle("Begin", for: [])
        startButton.titleLabel?.font = .mainFont(.regular, 18.scaled)
        rewardText.addToView(self.view, .bottom(20.scaled.pad), .right(self.view.centerX, 5.scaled.pad))
        startButton.addToView(self.view, .centerY(rewardText.centerY), .left(self.view.centerX, 5.scaled.pad))
        
        startButton.addTarget(self, action: #selector(beginTask(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.view.layoutIfNeeded()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.balanceTextBackgroundView.layer.cornerRadius = balanceTextBackgroundView.frame.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
