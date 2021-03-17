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
    
    private let picker = PickerTextField()
    
    @IBOutlet weak var peoplePicker: PickerTextField!
    
    @IBOutlet weak var schedulePicker: PickerTextField!
    
    @IBOutlet weak var situationPicker: PickerTextField!
    
    private let pickerview = UIPickerView()
    
    private var peoplePickerview: UIPickerView = UIPickerView()
    
    private let peopleList = ["1人","2人","3人","4人","5人以上"]
    
    private var schedulePickerview: UIPickerView = UIPickerView()
    
    private let scheduleList = ["日帰り","1泊","2泊","3泊","4泊以上"]
    
    private var situationPickerview: UIPickerView = UIPickerView()
    
    private let situationList = ["ひとり旅","友人と","家族旅行","社員旅行","恋人と","その他"]
    
    @IBOutlet weak var fileImageView: UIImageView!
    
    private var checkPermission = CheckPermission()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peoplePicker.text = ""
        schedulePicker.text = ""
        situationPicker.text = ""
        setup()
        checkPermission.checkCamera()
        
    }
    
        private func setup(){
    
            //UIImagePickerControllerDelegate
            peoplePickerview.delegate = self
            peoplePickerview.dataSource = self
            schedulePickerview.delegate = self
            schedulePickerview.dataSource = self
            situationPickerview.delegate = self
            situationPickerview.dataSource = self
            //UIToolbarの継承
            let toolbar = UIToolbar()
            //Doneを右に表示するためのスペース
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            //Doneボタン
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(NewFileViewController.tappdeDone))
            //toolbarにスペースとDoneを追加
            toolbar.items = [space,doneButton]
            //toolbarの表示方法を指定
            toolbar.sizeToFit()
            //Pickerviewを埋め込み
            peoplePicker.inputView = peoplePickerview
            //toolbarを表示
            peoplePicker.inputAccessoryView = toolbar
            schedulePicker.inputView = schedulePickerview
            schedulePicker.inputAccessoryView = toolbar
            situationPicker.inputView = situationPickerview
            situationPicker.inputAccessoryView = toolbar
    
        }

    //Doneボタンの処理
    @objc func tappdeDone(){
        peoplePicker.resignFirstResponder()
        schedulePicker.resignFirstResponder()
        situationPicker.resignFirstResponder()
    }
    
    //スクロール範囲外が押された時に閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        peoplePicker.resignFirstResponder()
        schedulePicker.resignFirstResponder()
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

//アルバムから画像を取得
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
