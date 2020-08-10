//
//  Home.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 7/31/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    
    var body: some View {
        NavigationView {
            Text("Landmarks Content")
                .navigationBarTitle("Featured")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
