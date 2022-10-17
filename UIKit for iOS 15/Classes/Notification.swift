//
//  Notification.swift
//  UIKit for iOS 15
//
//  Created by Олександр Швидкий on 12.10.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Codable, Hashable {
    @DocumentID var id: String?
    var title: String!
    var subtitle: String!
    var message: String!
    var image: String!
    var sentAt: Timestamp!
}

//let sampleNotifs = [
//    NotificationModel(id: "0x1", title: "New Release", message: "A new release of the SwiftUI course has been released", subtitle: "SwiftUI", image: "Logo SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x2", title: "Content Update", message: "The React Hooks course has been updated", subtitle: "React Hooks", image: "React", sentAt: Date()),
//    NotificationModel(id: "0x3", title: "New Release", message: "A new release by Sai Kambampati has been pushed", subtitle: "UIKit for iOS 15", image: "SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x4", title: "Black Friday Deal", message: "Purchase your subscription for 20% off only today", subtitle: "Design+Code", image: "Design+Code", sentAt: Date())
//    ,
//
//    NotificationModel(id: "0x5", title: "New Release", message: "A new release of the SwiftUI course has been released", subtitle: "SwiftUI", image: "Logo SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x6", title: "Content Update", message: "The React Hooks course has been updated", subtitle: "React Hooks", image: "React", sentAt: Date()),
//    NotificationModel(id: "0x7", title: "New Release", message: "A new release by Sai Kambampati has been pushed", subtitle: "UIKit for iOS 15", image: "SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x8", title: "Black Friday Deal", message: "Purchase your subscription for 20% off only today", subtitle: "Design+Code", image: "Design+Code", sentAt: Date())
//]
