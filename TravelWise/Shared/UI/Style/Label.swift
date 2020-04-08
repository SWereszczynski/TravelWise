import UIKit

func styleText(color: UIColor) -> (UILabel) -> Void {
    return { label in
        label.textColor = color
    }
}

func styleFont(_ font: UIFont) -> (UILabel) -> Void {
    return { label in
        label.font = font
    }
}

func styleText(_ text: String?) -> (UILabel) -> Void {
    return { label in
        label.text = text
    }
}

func styleAttributedText(_ attributedText: NSMutableAttributedString, lineHeight: CGFloat? = nil) -> (UILabel) -> Void {
    return { label in
        if let lineHeight = lineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.minimumLineHeight = lineHeight
            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        }
        label.attributedText = attributedText
    }
}

func styleAttributedText(_ text: String?, lineHeight: CGFloat) -> (UILabel) -> Void {
    guard let text = text else { return { label in label.attributedText = nil }}
    return { label in
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
                
        label.attributedText = attrString
    }
}

func styleAligment(_ aligment: NSTextAlignment) -> (UILabel) -> Void {
    return { label in
        label.textAlignment = aligment
    }
}

func styleNumberOfLines(_ numberOfLines: Int) -> (UILabel) -> Void {
    return { label in
        label.numberOfLines = numberOfLines
    }
}
