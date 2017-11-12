//
//  ViewController.swift
//  ImagePicker
//
//  Created by Yuhsuan Lin on 2017/10/25.
//  Copyright © 2017年 Yuhsuan Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image_view: UIImageView!
    
    @IBAction func openLibrary(_ sender: Any) {
        self.callGetPhoneWithKind(2)
    }
    
    @IBAction func openCamera(_ sender: Any) {
        self.callGetPhoneWithKind(1)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callGetPhoneWithKind(_ kind: Int) {
        let picker: UIImagePickerController = UIImagePickerController()
        switch kind {
        case 1:
            // 開啟相機
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                picker.sourceType = UIImagePickerControllerSourceType.camera
                picker.allowsEditing = true // 可對照片作編輯
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                print("沒有相機鏡頭...") // 用alertView.show
            }
        default:
            // 開啟相簿
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                picker.allowsEditing = true // 可對照片作編輯
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.image_view.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.image_view.contentMode = UIViewContentMode.scaleAspectFill
        
        self.image_view.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
    }


}

