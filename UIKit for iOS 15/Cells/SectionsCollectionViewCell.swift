//
//  SectionsCollectionViewCell.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 10.10.2022.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var banner: UIImageView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!

    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
    }

    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
