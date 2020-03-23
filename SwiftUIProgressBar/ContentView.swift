//
//  ContentView.swift
//  SwiftUIProgressBar
//
//  Created by ramil on 23.03.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0
    @State private var currentProgress = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color(.secondarySystemBackground))
                    .frame(width: 300, height: 24)
                    .cornerRadius(8)
                
                LinearGradient(gradient: Gradient(colors: [
                    progress < 300 ? .orange : Color(.systemTeal),
                    progress < 300 ? .pink : .blue
                ]), startPoint: .top, endPoint: .bottom)
                    .frame(width: CGFloat(progress), height: 24)
                    .cornerRadius(8)
            }.padding(.bottom)
            
            HStack {
                Text(progress < 300 ? "\(currentProgress) of 6" : "COMPLETE")
                    .bold()
                Spacer()
                Text("\(progress / 3)%")
            }
            if progress == 300 {
                Button(action: {
                    self.progress = 0
                    self.currentProgress = 0
                }) {
                    Image(systemName: "arrow.counterclockwise")
                }
                .padding()
            }
        }
        .frame(width: 272)
        .onTapGesture {
            if self.progress < 300 {
                self.progress += 50
                self.currentProgress += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
