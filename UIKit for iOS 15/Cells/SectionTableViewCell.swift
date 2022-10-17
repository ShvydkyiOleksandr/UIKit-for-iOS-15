//
//  SectionTableViewCell.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 07.10.2022.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var courseLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
