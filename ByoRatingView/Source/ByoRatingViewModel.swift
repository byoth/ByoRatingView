//
//  ByoRatingViewModel.swift
//  ByoRatingView
//
//  Created by Taehyun Jo on 2020/02/05.
//  Copyright © 2020 byo. All rights reserved.
//

import UIKit


public struct ByoRatingViewModel {
    
    // MARK: - Input
    
    public var itemsCount: Int = 5
    public var itemSize: CGSize
    public var itemsSpacing: CGFloat = 0
    
    
    // MARK: - Output
    
    public var itemFrame: CGRect {
        return .init(origin: .zero, size: self.itemSize)
    }
    
}
