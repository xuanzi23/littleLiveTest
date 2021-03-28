//
//  CarouselView.swift
//  LittleLives
//
//  Created by HAO XUAN on 27/3/21.
//

import SwiftUI

struct CarouselView: View {
    
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    private let carouselCount = 10
    @State var carouselPos = 0
    
    func getTitle() -> [String] {
        return [
            "Good Morning",
            "New Portfolio",
            "New Kid",
            "Kid Photos",
            "Having funs",
            "Learning",
            "Playing",
            "Studying",
            "Jumping",
            "Rest Time"
        ]
    }
    
    func getDesc() -> [String] {
        return [
            "Welcome to Little Lives",
            "Having a great time",
            "Hi, My name is Hao Xuan! Nice to meet you all",
            "Group photo",
            "Play hard",
            "Study Hard",
            "Get to know more friend",
            "I love study",
            "Safety is the first priority",
            "Sleep zzz"
        ]
    }
    
    var body: some View {
        HStack {
            Image("\(carouselPos)")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipped()
                .background(Color.accentColor)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(getTitle()[carouselPos])
                    .font(.title)
                    .bold()
                
                Text(getDesc()[carouselPos])
                
                Spacer()
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .onReceive(self.timer, perform: { _ in
            withAnimation {
                self.carouselPos = (self.carouselPos + 1) % carouselCount
            }
        })
    }
}
