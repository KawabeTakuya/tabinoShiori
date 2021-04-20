//
//  Alert.swift
//  tabinoShiori
//
//  Created by 川邉拓哉 on 2021/04/20.
//  Copyright © 2021 川邉拓哉. All rights reserved.
//

import Foundation
import UIKit

class Alert: UIViewController{
    
    class func simpleAlert(title:String, message:String, viewController: UIViewController) {
        var alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
            alertController = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil))
        // 引数で渡されてきたViewControllerに対してメソッドを実行
            viewController.present(alertController, animated: true, completion: nil)
        }
        
}

//    func simpleAlert(title:String, message:String) {
//        var alertController: UIAlertController!
//
//        alertController = UIAlertController(title: "title",
//                                   message: "message",
//                                   preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK",
//                                       style: .default,
//                                       handler: nil))
//        self.present(alertController, animated: true, completion: nil)
//    }
//
//}
