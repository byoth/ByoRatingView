//
//  CGFloatLiteral.swift
//  ByoRatingView
//
//  Created by Taehyun Jo on 2020/02/07.
//

import CoreGraphics


extension IntegerLiteralType {
    var f: CGFloat {
        return .init(self)
    }
}


extension FloatLiteralType {
    var f: CGFloat {
        return .init(self)
    }
}
