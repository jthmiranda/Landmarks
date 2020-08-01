//
//  ContentView.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 7/31/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tutle Rock")
                .font(.title)
                .foregroundColor(Color.green)
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Joshua Tree National Park"/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"California"/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
            }
        }
        .padding()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
