//
//  ListContent.swift
//  LittleLives
//
//  Created by HAO XUAN on 27/3/21.
//

import SwiftUI

struct ListContentView: View {
    
    @StateObject var dataObservable = DataObservable()
    @State private var hasLoad = false
    
    var titleDateFormatter: DateFormatter {
        let dateFormator = DateFormatter()
        dateFormator.dateStyle = .long
        dateFormator.timeStyle = .none
        return dateFormator
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func returnContent(data: [ContentItem]) -> [[ContentItem]] {
        print("Testing \(data.count)")
        var groupedItems = [[ContentItem]]()
        var currentItems = [ContentItem]()
        
        var previousHeaderId = ""
        for(index, item) in data.enumerated() {
            let headerId = dateFormatter.string(from: item.date)
            if headerId != previousHeaderId {
                if currentItems.count > 0 {
                    groupedItems.append(currentItems)
                }
                currentItems = [item]
                previousHeaderId = headerId
            } else {
                currentItems.append(item)
            }
            if data.count - 1 == index {
                groupedItems.append(currentItems)
            }
        }
        return groupedItems
    }
    
    var body: some View {
        ForEach(returnContent(data: dataObservable.data), id: \.self) { (sectionItems: [ContentItem]) in
            Section(header: Text("\(titleDateFormatter.string(from: sectionItems.first?.date ?? Date()))")) {
                ForEach(sectionItems, id: \.self, content: { item in
                    NavigationLink(destination: Text(item.title), label: {
                        
                        HStack(alignment: .top) {
                            Image(systemName: item.img)
                                .foregroundColor(Color.accentColor)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.type.rawValue)
                                    .foregroundColor(Color.accentColor)
                                    .font(.title3)
                                    .bold()
                                
                                Text(item.title)
                                Text(item.desc)
                            }
                        }
                        .padding(.vertical)
                    })
                })
            }
            .textCase(nil)
        }
        
        Button(action: {
            dataObservable.fetchData()
        }) {
            Text("Load More")
        }

        ProgressView()
            .onAppear {
                dataObservable.fetchData()
            }
    }
}
