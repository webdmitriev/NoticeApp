//
//  UILabel.ext.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 10.04.2025.
//

import UIKit

extension UILabel {
    func setStrikethrough(_ isStrikethrough: Bool, color: UIColor? = nil) {
        guard let currentText = self.text ?? self.attributedText?.string else { return }
        
        let mutableAttributedString = NSMutableAttributedString(string: currentText)
        let range = NSRange(location: 0, length: mutableAttributedString.length)
        
        // Сохраняем текущие атрибуты
        if let currentAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) {
            mutableAttributedString.addAttributes(currentAttributes, range: range)
        } else {
            mutableAttributedString.addAttributes([
                .font: self.font ?? UIFont.systemFont(ofSize: 17),
                .foregroundColor: self.textColor ?? UIColor.black
            ], range: range)
        }
        
        // Устанавливаем/убираем зачёркивание
        if isStrikethrough {
            mutableAttributedString.addAttribute(
                .strikethroughStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: range
            )
            mutableAttributedString.addAttribute(
                .strikethroughColor,
                value: color ?? self.textColor ?? UIColor.black,
                range: range
            )
        } else {
            mutableAttributedString.removeAttribute(.strikethroughStyle, range: range)
            mutableAttributedString.removeAttribute(.strikethroughColor, range: range)
        }
        
        self.attributedText = mutableAttributedString
    }
}
