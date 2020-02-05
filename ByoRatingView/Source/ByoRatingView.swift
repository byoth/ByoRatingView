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
    
    
    // MARK: - View Model
    
    private var viewModel: ByoRatingViewModel? {
        didSet {
            if let viewModel = self.viewModel {
                self.bindData(viewModel: viewModel)
            }
        }
    }
    
    public func bind(viewModel: ByoRatingViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupUI()
    }
    
    
    // MARK: - Setup
    
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
    
    
    // MARK: - UI Update
    
    private func bindData(viewModel: ByoRatingViewModel) {
        self.stackView.spacing = viewModel.itemsSpacing
        
        self.updateStackView(viewModel: viewModel)
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
    
}
