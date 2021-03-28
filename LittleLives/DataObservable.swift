//
//  DataObservable.swift
//  LittleLives
//
//  Created by HAO XUAN on 27/3/21.
//

import Foundation
import Combine

enum ContentType: String {
    case portfolio = "Portfolio"
    case checkInAndOut = "Check In & Out"
    case health = "Health"
    case fees = "Fees"
}

struct ContentItem: Hashable {
    var date: Date
    var img: String
    var type: ContentType
    var title: String
    var desc: String
}

class DataObservable: ObservableObject {
    @Published var data = [ContentItem]()
    
    var currentPage = 0
    let perPage = 20
    
    private var cancellable: AnyCancellable?
    
    func fetchData() {
        self.data += self.generateFakeData(item: perPage)
    }
    
    func generateFakeData(item: Int) -> [ContentItem] {
        var data = [ContentItem]()
        let type: [ContentType] = [.checkInAndOut, .fees, .health, .portfolio]
        for i in 0..<item {
            let type = type[Int.random(in: 0..<3)]
            var img = ""
            switch type {
            case .portfolio:
                img = "person.crop.circle"
            case .checkInAndOut:
                img = "arrow.left.arrow.right"
            case .health:
                img = "cross.case"
            case .fees:
                img = "dollarsign.circle"
            }
            data.append(ContentItem(date: generateRandomDate(daysBack: item), img: img, type: type, title: "Fake Data Title \(i)", desc: "Fake Data Description \(i)"))
        }
        return data
    }
    
    func generateRandomDate(daysBack: Int) -> Date {
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = Bool.random() == true ? 1 : -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) )
        return randomDate!
    }
}
