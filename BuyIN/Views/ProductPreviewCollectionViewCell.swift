//
//  ProductCollectionViewCell.swift
//  BuyIN
//
//  Created by Amr Hossam on 17/03/2022.
//

import UIKit

class ProductPreviewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = className
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productImageView)
        contentView.addSubview(productTitleLabel)
        contentView.addSubview(productPriceLabel)
        configureConstraints()
    }
    
    func configure(with model: ProductViewModel) {
        let url = model.images.items.first?.url
        productImageView.setImageFrom(url)
        productTitleLabel.text = model.title
        productPriceLabel.text = "EGP \(model.price.dropFirst())"
        
    }
    
    private func configureConstraints() {
        
        let productImageViewConstraints = [
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let productTitleLabelConstraints = [
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            productTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        let productPriceLabelConstraints = [
            productPriceLabel.leadingAnchor.constraint(equalTo: productTitleLabel.leadingAnchor),
            productPriceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(productImageViewConstraints)
        NSLayoutConstraint.activate(productTitleLabelConstraints)
        NSLayoutConstraint.activate(productPriceLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
