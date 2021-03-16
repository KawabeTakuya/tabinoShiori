//
//  CheckPermission.swift
//  tabinoShiori
//
//  Created by 川邉拓哉 on 2021/03/17.
//  Copyright © 2021 川邉拓哉. All rights reserved.
//

import Foundation
import Photos

class CheckPermission{
    
    //ユーザーに許可を促す
    func checkCamera(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                
            case .authorized:
                print("aurhorized")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            @unknown default:
                break
            }
            
        }
        
    }
    
    
}
