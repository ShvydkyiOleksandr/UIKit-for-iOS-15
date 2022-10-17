//
//  HandbookCollectionViewCell.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 05.10.2022.
//

import UIKit

class HandbookCollectionViewCell: UICollectionViewCell {
    @IBOutlet var overlay: UIView!
    @IBOutlet var banner: UIImageView!
    @IBOutlet var logo: CustomImageView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    let gradient = CAGradientLayer()
    
    // layoutSubviews(): This instance method runs as soon as the subviews are laid out. Anytime a device changes layout, this function runs.
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
        
       
    }
    // awakeFromNib(): This method runs as soon as the cell is initialized from the storyboard. It prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 30
        
        overlay.layer.insertSublayer(gradient, at: 0)
        overlay.layer.cornerRadius = 30
        overlay.layer.cornerCurve = .continuous
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .semibold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .extraLarge
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
