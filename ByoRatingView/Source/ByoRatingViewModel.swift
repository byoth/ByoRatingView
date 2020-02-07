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
    public var itemSize: CGSize = .init(width: 64, height: 64)
    public var itemsSpacing: CGFloat = 8
    
    
    public init() {
    }
    
    
    // MARK: - Output
    
    public var itemFrame: CGRect {
        return .init(origin: .zero, size: self.itemSize)
    }
    
}
