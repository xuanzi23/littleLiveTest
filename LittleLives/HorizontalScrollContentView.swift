//
//  HorizontalScrollContentView.swift
//  LittleLives
//
//  Created by HAO XUAN on 27/3/21.
//

import SwiftUI

struct HorizontalScrollContentView: View {
    
    func getProgram() -> [String] {
        return [
            "Emergency Contact",
            "Talk to School",
            "Request for Absence",
            "Medical Instruction",
            "Health Checkup",
            "Payment",
            "Course Material",
            "Information",
        ]
    }
    
    func getImage() -> [String] {
        return [
            "person.3",
            "phone.connection",
            "rectangle.and.pencil.and.ellipsis",
            "cross.case",
            "cross",
            "dollarsign.circle",
            "character.book.closed",
            "info.circle",
        ]
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<getProgram().count, id: \.self) { index in
                    NavigationLink(destination: Text("Hi")) {
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                Image(systemName: getImage()[index])
                                    .font(.title)
                                    .foregroundColor(Color.primary)
                                    
                            }
                            Spacer()
                            Text(getProgram()[index])
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .bold()
                        }
                        .padding()
                        .frame(width: 120, height: 200)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
