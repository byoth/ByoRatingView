//
//  ByoRatingViewModel.swift
//  ByoRatingView
//
//  Created by Taehyun Jo on 2020/02/05.
//  Copyright © 2020 byo. All rights reserved.
//

import UIKit


public struct ByoRatingViewModel {
    public var rating: CGFloat
    
    public var itemsCount: Int
    public var itemSize: CGSize
    public var itemsSpacing: CGFloat
    
    public var itemImageNames: (full: String, half: String, empty: String)
    
    
    public init(
        rating: CGFloat = 2.5,
        itemsCount: Int = 5,
        itemSize: CGSize = .init(width: 48, height: 48),
        itemsSpacing: CGFloat = 4,
        itemImageNames: (full: String, half: String, empty: String) = (full: "", half: "", empty: "")) {
        
        self.rating = rating
        self.itemsCount = itemsCount
        self.itemSize = itemSize
        self.itemsSpacing = itemsSpacing
        self.itemImageNames = itemImageNames
    }
    
    
    public var itemFrame: CGRect {
        return .init(origin: .zero, size: self.itemSize)
    }
}
