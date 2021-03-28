//
//  ContentView.swift
//  LittleLives
//
//  Created by HAO XUAN on 27/3/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    CarouselView()
                        .padding(.vertical)
                        .listRowInsets(EdgeInsets())
                    
                    Section(header: Text("Easier Communication")
                                .foregroundColor(Color.accentColor)) {
                        HorizontalScrollContentView()
                            .padding(.vertical)
                            .listRowInsets(EdgeInsets())
                    }
                    
                    ListContentView()
                }
                .listStyle(GroupedListStyle())
                .navigationTitle(Text("Little Lives"))
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}
