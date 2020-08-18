//
//  PageViewController.swift
//  Landmarks
//
//  Created by Jonathan Miranda on 8/17/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        
        init(_ parent: PageViewController) {
            self.parent = parent
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewControler: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
    }
}


struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
