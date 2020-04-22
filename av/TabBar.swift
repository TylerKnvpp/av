//
//  TabBar.swift
//  av
//
//  Created by Tyler Knapp on 4/20/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Workouts")
            }
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 11 Pro")
            TabBar().previewDevice("iPad Pro (10.5-inch)")
        }
    }
}
