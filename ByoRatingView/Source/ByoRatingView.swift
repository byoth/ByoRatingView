//
//  ByoRatingView.swift
//  ByoRatingView
//
//  Created by Taehyun Jo on 2020/02/05.
//  Copyright © 2020 byo. All rights reserved.
//

import UIKit

import SnapKit
import Then


public final class ByoRatingView: UIView {
    
    // MARK: - Subview
    
    private let stackView: UIStackView = .init()
    
    
    // MARK: - Variable
    
    override public var intrinsicContentSize: CGSize {
        return self.getContentSize()
    }
    
    private var viewModel: ByoRatingViewModel? {
        didSet {
            if let viewModel = self.viewModel {
                self.bindData(viewModel: viewModel)
            }
        }
    }
    
    public var rating: CGFloat {
        return self.viewModel?.rating ?? 0
    }
    
    
    // MARK: - Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setup()
    }
    
    private func setup() {
        self.setupUI()
        self.setupGesture()
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        self.setupStackView()
    }
    
    private func setupStackView() {
        self.stackView.distribution = .fillEqually
        
        self.addSubview(self.stackView)
        
        self.stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setupGesture() {
        let panGesture: UIPanGestureRecognizer = .init(target: self, action: #selector(didPan))
        let tapGesture: UITapGestureRecognizer = .init(target: self, action: #selector(didTap))
        
        let gestures: [UIGestureRecognizer] = [panGesture, tapGesture]
        
        gestures.forEach {
            self.addGestureRecognizer($0)
        }
    }
    
    public func bind(viewModel: ByoRatingViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Action
    
    @objc
    private func didPan(_ sender: UIPanGestureRecognizer) {
        self.didGesture(sender)
    }
    
    @objc
    private func didTap(_ sender: UITapGestureRecognizer) {
        self.didGesture(sender)
    }
    
    private func didGesture(_ gesture: UIGestureRecognizer) {
        self.updateRating(gesture: gesture)
        
        if gesture.state == .ended {
            // TODO: - Need to implement completion
        }
    }
    
    private func updateRating(gesture: UIGestureRecognizer) {
        let location: CGPoint = gesture.location(in: self)
        let rating: CGFloat = self.getRating(location: location)
        
        self.viewModel?.rating = rating
    }
    
    
    // MARK: - UI Update
    
    private func bindData(viewModel: ByoRatingViewModel) {
        self.stackView.spacing = viewModel.itemsSpacing
        
        self.updateStackView(viewModel: viewModel)
        
        self.invalidateIntrinsicContentSize()
    }
    
    private func updateStackView(viewModel: ByoRatingViewModel) {
        self.stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        for _ in 0 ..< viewModel.itemsCount {
            let view: UIView = .init(frame: viewModel.itemFrame)
            
            self.stackView.addArrangedSubview(view)
        }
    }
    
    
    // MARK: - Instance
    
    private func getContentSize() -> CGSize {
        guard let viewModel = self.viewModel else {
            return .zero
        }
        
        let width: CGFloat = viewModel.itemSize.width * viewModel.itemsCount.f + viewModel.itemsSpacing * max(viewModel.itemsCount - 1, 0).f
        let height: CGFloat = viewModel.itemSize.height
        
        return .init(width: width, height: height)
    }
    
    private func getRating(location: CGPoint) -> CGFloat {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        let rating: CGFloat = .init(location.x / self.bounds.width * viewModel.itemsCount.f)
        let roundedRating: CGFloat = rating.round(nearest: 0.5)
        
        return min(max(roundedRating, 0), viewModel.itemsCount.f)
    }
    
}
