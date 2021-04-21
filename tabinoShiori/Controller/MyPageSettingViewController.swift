//
//  MyPageSettingViewController.swift
//  tabinoShiori
//
//  Created by 川邉拓哉 on 2021/04/21.
//  Copyright © 2021 川邉拓哉. All rights reserved.
//

import UIKit
import Photos

class MyPageSettingViewController: UIViewController {

    private var checkPermission = CheckPermission()
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission.checkCamera() 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileImagePick(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//アルバムから画像を取得
extension MyPageSettingViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        //インスタンスを作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
        
    }
    
    //アルバムのキャンセルボタンが押された時
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[.editedImage
            ] as? UIImage{
            
            profileImage.image = pickerImage
           
            //閉じる処理
            picker.dismiss(animated:true, completion: nil)
            
        }
        
    }
    
    
}

