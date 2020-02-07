//
//  CGFloat+Extension.swift
//  ByoRatingView
//
//  Created by Taehyun Jo on 2020/02/07.
//

import CoreGraphics


extension CGFloat {
    func round(nearest: CGFloat) -> CGFloat {
        let n: CGFloat = 1 / nearest
        let numberToRound: CGFloat = self * n
        
        return numberToRound.rounded() / n
    }
}
