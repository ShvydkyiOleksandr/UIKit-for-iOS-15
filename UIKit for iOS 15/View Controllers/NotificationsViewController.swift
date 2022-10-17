//
//  NotificationsViewController.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 12.10.2022.
//

import UIKit
import Combine
import FirebaseFirestore

class NotificationsViewController: UIViewController {
    
    @IBOutlet var cardView: CustomView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var cardViewBottonConstraint: NSLayoutConstraint!
    
    var dataSource: UITableViewDiffableDataSource<TBSection, NotificationModel>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    let screenHeight = UIScreen.main.bounds.height
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView
            .publisher(for: \.contentSize)
            .sink { contentSize in
                let tableViewHeight = contentSize.height + 10
                self.tableViewHeight.constant = tableViewHeight
                
                if tableViewHeight + 120 < self.screenHeight {
                    self.cardViewBottonConstraint.constant = self.screenHeight - (tableViewHeight) - 120 + 1
                } else {
                    self.cardViewBottonConstraint.constant = 20
                }
            }
            .store(in: &tokens)
        
        tableView.delegate = self
        
        // Configure Data Source
        self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell else {
                fatalError("Can't create a new cell")
            }
            
            cell.titleLabel.text = item.title
            cell.messageLabel.text = item.message
            cell.subtitleLabel.text = item.subtitle
            cell.notificationImageView.image = UIImage(named: item.image)
            
            return cell
        }
        
        self.dataSource.defaultRowAnimation = .fade
        
        // Load Firestore Data
        Task {
            do {
                try await loadData()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadData() async throws {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])
        
        let docs = try await Firestore.firestore().collection("notifications")
            .order(by: "sentAt", descending: true)
            .getDocuments()
        var notifications = [NotificationModel]()
        
        for snapshot in docs.documents {
            if let data = try snapshot.data(as: NotificationModel?.self) {
                notifications.append(data)
            }
        }
        
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        await self.dataSource.apply(currentSnapshot, animatingDifferences: true)
        
        DispatchQueue.main.async {
            self.cardView.alpha = 1
        }
    }
}

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
