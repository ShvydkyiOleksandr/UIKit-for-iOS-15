//
//  FeaturedViewController.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 03.10.2022.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var handbooksCollectionView: UICollectionView!
    @IBOutlet var coursesTableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var featuredTitleLabel: UILabel!
    @IBOutlet var featuredSubtitleLabel: UILabel!
    @IBOutlet var featuredDescLabel: UILabel!
    @IBOutlet var handbooksLabel: UILabel!
    @IBOutlet var coursesLabel: UILabel!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        setup()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
        
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        scrollView.delegate = self
        
        // Accessibility
      featuredTitleLabel.adjustsFontForContentSizeCategory = true
      featuredTitleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
      featuredTitleLabel.maximumContentSizeCategory = .accessibilityExtraLarge

      featuredSubtitleLabel.adjustsFontForContentSizeCategory = true
      featuredSubtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .bold)
      featuredSubtitleLabel.maximumContentSizeCategory = .accessibilityMedium

      featuredDescLabel.adjustsFontForContentSizeCategory = true
      featuredDescLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
      featuredDescLabel.maximumContentSizeCategory = .accessibilityMedium

      handbooksLabel.adjustsFontForContentSizeCategory = true
      handbooksLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
      handbooksLabel.maximumContentSizeCategory = .accessibilityMedium

      coursesLabel.adjustsFontForContentSizeCategory = true
      coursesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
      coursesLabel.maximumContentSizeCategory = .accessibilityMedium
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? CoursesViewController, let course = sender as? Course {
            detailsVC.course = course
        }
    }
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        let handbook = handbooks[indexPath.item]
        
        cell.titleLabel.text = handbook.courseTitle
        cell.subtitleLabel.text = handbook.courseSubtitle
        cell.descriptionLabel.text = handbook.courseDescription
        cell.gradient.colors = handbook.courseGradient
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
    }
    
    func setup() {
        cardView.layer.cornerCurve = .continuous
        cardView.layer.cornerRadius = 30
        blurView.layer.cornerCurve = .continuous
        blurView.layer.cornerRadius = 30
        blurView.layer.masksToBounds = true
        
        cardView.layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 20
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        let course = courses[indexPath.section]

        cell.titleLabel.text = course.courseTitle
        cell.subtitleLabel.text = course.courseSubtitle
        cell.descriptionLabel.text = course.courseDescription
        cell.courseBackground.image = course.courseBackground
        cell.courseBanner.image = course.courseBanner
        cell.courseLogo.image = course.courseIcon

        return cell
    }
}

extension FeaturedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let lastScrollYPos = scrollView.contentOffset.y
        
        let percentage = lastScrollYPos / contentHeight
        if percentage <= 0.15 {
            self.title = NSLocalizedString("Featured", comment: "Featured")
        } else if percentage <= 0.33 {
            self.title = NSLocalizedString("Handbooks", comment: "Handbooks")
        } else {
            self.title = NSLocalizedString("Courses", comment: "Courses")
        }
    }
}
