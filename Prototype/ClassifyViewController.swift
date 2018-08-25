//
//  ClassifyViewController.swift
//  Prototype
//
//  Created by Rakeeb on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class ClassifyViewController: UIViewController {
    let balanceTextBackgroundView = UIView()
    let balanceText = UILabel.create("120 c", .rgb(216,158,0), .mainFont(.semiBold, 18.scaled))
    let taskTitleLabel = UILabel.create("Classify", .white, .mainFont(.semiBold, 36.scaled))
    let topBar = UIView()
    
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    let descriptionLabel = UILabel.create("Describe the emotion and demographic of the person in the photo (i.e. Caucasian, Happy)", .black, .mainFont(.light, 18.scaled))
    let descriptionField = LoginTextField(placeholder: "Description")
    let imageView = UIImageView()
    var imageData: UIImage?
    let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //descriptionField.addToView(self.view, .centerX, .width(0.75.ratio))
        // Do any additional setup after loading the view.
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(exitFirstResponder(sender:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        topBar.backgroundColor = .black
        topBar.addToView(self.view, .left, .right, .top, .height(78.scaled.constant))
        taskTitleLabel.addToView(topBar, .centerX, .centerY)
        self.imageView.clipsToBounds = true
        balanceTextBackgroundView.backgroundColor = .white
        balanceTextBackgroundView.addToView(topBar, .right(20.scaled.pad), .width(0.2.ratio), .height(taskTitleLabel.height, 0.8.ratio), .centerY)
        
        balanceText.addToView(balanceTextBackgroundView, .centerX, .centerY)
        
        imageView.addToView(self.view, .top(topBar.bottom, 10.scaled.pad), .centerX, .width(0.4.ratio), .height(imageView.width))
        
        descriptionLabel.addToView(self.view, .top(imageView.bottom, 10.scaled.pad), .left(20.scaled.pad), .right(20.scaled.pad))
        descriptionLabel.numberOfLines = 3
        descriptionField.addToView(self.view, .top(descriptionLabel.bottom, 10.scaled.pad), .centerX, .height(42.scaled.constant), .width(0.75.ratio))
        
        submitButton.setTitle("Submit", for: [])
        submitButton.titleLabel?.font = .mainFont(.light, 18.scaled)
        submitButton.addToView(self.view, .centerX, .top(descriptionField.bottom, 10.scaled.pad))
        submitButton.addTarget(self, action: #selector(submitImage(sender:)), for: .touchUpInside)
    }
    
    @objc func submitImage(sender: UIButton) {
        let alertController = UIAlertController(title: "Success", message: "This data is now under approval. Check back soon!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default) { _ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
            self.present(vc!, animated: true, completion: nil)
        }
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func exitFirstResponder(sender: UITapGestureRecognizer) {
        self.descriptionField.resignFirstResponder()
    }

    func receiveClassifyInfo(image: UIImage?) {
        self.imageData = image
        self.imageView.image = imageData
        UIView.animate(withDuration: 0.2) {
            self.imageView.contentMode = .scaleAspectFill
            self.view.layoutIfNeeded()
        }
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
