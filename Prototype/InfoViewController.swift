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
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var taskImg: UIImageView!
    @IBOutlet weak var rewardText: UILabel!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBAction func beginTask(_ sender: UIButton) {
        print(type)
        print(number)
        print(reward)
        
        if type == "ImageCapture" {
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
        
        if type == "Rating" {
            
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any])
    {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func transitionTo()
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func receiveInfo (num: Int, type: String, title: String, reward: Int, description2: String, imgRef2: String)
    {
        print(num)
        self.number = num + 1
        descriptionTask?.text = description2
        titleText?.text = title
        rewardText?.text = "Reward: \(reward) coins"
        
        self.type = type
        self.number = num + 1
        self.reward = reward
        self.imgRef = imgRef2
        print("Self: \(self.imgRef)")
        
        let url = URL(string: imgRef)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        taskImg.image = UIImage(data: data!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.title = "Some title"
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
