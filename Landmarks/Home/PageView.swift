//
//  PageView.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewController: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ view: [Page]) {
        self.viewController = view.map { UIHostingController(rootView: $0)}
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(controllers: viewController, currentPage: $currentPage)
            PageControl(numberOfPages: viewController.count, currentPage: $currentPage)
                .padding(.trailing)
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
