//
//  NewFileViewController.swift
//  tabinoShiori
//
//  Created by 川邉拓哉 on 2021/03/15.
//  Copyright © 2021 川邉拓哉. All rights reserved.
//

import UIKit
import Photos

class NewFileViewController: UIViewController{

    
    @IBOutlet weak var tripTitle: UITextField!
    
    @IBOutlet weak var peoplePicker: PickerTextField!
    
    @IBOutlet weak var schedulePicker: PickerTextField!
    
    @IBOutlet weak var situationPicker: PickerTextField!
    
    private var peoplePickerview: UIPickerView = UIPickerView()
    
    private let peopleList = ["1人旅","2人旅","3人旅","4人旅","5人以上"]
    
    private var schedulePickerview: UIPickerView = UIPickerView()
    
    private let scheduleList = ["日帰り","1泊","2泊","3泊","4泊以上"]
    
    private var situationPickerview: UIPickerView = UIPickerView()
    
    private let situationList = ["ひとり旅","友人と","家族旅行","社員旅行","恋人と","その他"]
    
    @IBOutlet weak var fileImageView: UIImageView!
    
    private var checkPermission = CheckPermission()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peoplePicker.text = "人数の選択（必須）"
        schedulePicker.text = "日程の選択(必須)"
        situationPicker.text = "日程の選択(必須)"
        peopleSetup()
        scheduleSetup()
        situationSetup()
    checkPermission.checkCamera()
        
    }
    
    private func peopleSetup() {
        
        peoplePickerview.delegate = self
        peoplePickerview.dataSource = self
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(NewFileViewController.peopleTappdeDone))
        toolbar.items = [space,doneButton]
        toolbar.sizeToFit()
        peoplePicker.inputView = peoplePickerview
        peoplePicker.inputAccessoryView = toolbar
        
    }
    
    @objc func peopleTappdeDone(){
        peoplePicker.resignFirstResponder()
    }

    private func scheduleSetup() {
        
        schedulePickerview.delegate = self
        schedulePickerview.dataSource = self
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(NewFileViewController.scheduleTappdeDone))
        toolbar.items = [space,doneButton]
        toolbar.sizeToFit()
        schedulePicker.inputView = schedulePickerview
        schedulePicker.inputAccessoryView = toolbar
        
    }
    
    @objc func scheduleTappdeDone(){
        schedulePicker.resignFirstResponder()
    }
    
    private func situationSetup() {
        
        situationPickerview.delegate = self
        situationPickerview.dataSource = self
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(NewFileViewController.situationTappdeDone))
        toolbar.items = [space,doneButton]
        toolbar.sizeToFit()
        situationPicker.inputView = situationPickerview
        situationPicker.inputAccessoryView = toolbar
        
    }
    
    @objc func situationTappdeDone(){
        situationPicker.resignFirstResponder()
    }
    
    
    @IBAction func albumPick(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
    }
    
    
}


extension NewFileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

    //コンポーネントの行数の指定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == peoplePickerview {
        return peopleList.count
        } else if pickerView == schedulePickerview {
        return scheduleList.count
        } else {
        return situationList.count
        }
}

    //選択肢に配列を表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == peoplePickerview {
            return peopleList[row]
        } else if pickerView == schedulePickerview{
            return scheduleList[row]
        } else {
            return situationList[row]
        }
}

    //選択したものをtextFieldに表示
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == peoplePickerview {
            peoplePicker.text = peopleList[row]
        } else if pickerView == schedulePickerview{
            schedulePicker.text = scheduleList[row]
        } else {
            situationPicker.text = situationList[row]
        }
}
    
    

}

extension NewFileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
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
            
            fileImageView.image = pickerImage
           
            //閉じる処理
            picker.dismiss(animated:true, completion: nil)
            
        }
        
    }
    
    
}
