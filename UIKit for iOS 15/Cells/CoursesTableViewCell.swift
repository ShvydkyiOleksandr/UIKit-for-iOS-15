//
//  CoursesTableViewCell.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 05.10.2022.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var courseBackground: UIImageView!
    @IBOutlet var courseBanner: UIImageView!
    @IBOutlet var courseLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .extraLarge
    }
}
