//
//  TopicsTableViewCell.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 10.10.2022.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    @IBOutlet var topicLabel: UILabel!
    @IBOutlet var topicIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Accessibility
        topicLabel.adjustsFontForContentSizeCategory = true
        topicLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
        topicLabel.maximumContentSizeCategory = .extraExtraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
