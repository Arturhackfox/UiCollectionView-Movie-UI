//
//  CustomHeader.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 02.02.2024.
//

import UIKit

class CustomHeader: UICollectionReusableView {
    static let identifier = "CustomHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
}

#Preview {
        MovieSecondViewController()
    }
