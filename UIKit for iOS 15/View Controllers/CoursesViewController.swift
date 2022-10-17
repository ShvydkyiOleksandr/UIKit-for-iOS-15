//
//  CoursesViewController.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 06.10.2022.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {
    
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    @IBOutlet var sectionsTableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet var iconImageView: CustomImageView!
    
    @IBOutlet var menuButton: UIButton!
    
    private var tokens: Set<AnyCancellable> = []
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height + 10
            }
            .store(in: &tokens)
        
        // Set data for the preview card
        self.bannerImage.image = course?.courseBanner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course?.courseTitle
        self.subtitleLabel.text = course?.courseSubtitle
        self.descriptionLabel.text = course?.courseDescription
        self.authorLabel.text = "Taught by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
        
        self.iconImageView.image = course?.courseIcon
        
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }
    
    let menu = UIMenu(
        title: "Course Options",
        options: .displayInline,
        children: [
            UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in
                // Share Course
            }),
            UIAction(title: "Take Test", image: UIImage(systemName: "highlighter"), handler: { _ in
                // Take Test
            }),
            UIAction(title: "Download", image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in
                // Download Course
            }),
            UIAction(title: "Forums", image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"), handler: { _ in
                // Forums
            }),
        ]
    )
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections[indexPath.row]
            
            cell.titleLabel.text = selectedSection.sectionTitle
            cell.courseLogo.image = selectedSection.sectionIcon
            cell.descriptionLabel.text = selectedSection.sectionDescription
            cell.subtitleLabel.text = selectedSection.sectionSubtitle
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
