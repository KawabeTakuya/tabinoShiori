//
//  PickerTextField.swift
//  tabinoShiori
//
//  Created by 川邉拓哉 on 2021/03/15.
//  Copyright © 2021 川邉拓哉. All rights reserved.
//

import UIKit

final class PickerTextField: UITextField {
    // 入力キャレットの非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    // 範囲選択カーソル非表示
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return[]
    }
    
    // コピー・ペースト・選択などのメニュー非表示 
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        false
    }


}
