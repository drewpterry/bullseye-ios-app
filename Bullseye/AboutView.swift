//
//  AboutView.swift
//  Bullseye
//
//  Created by Drew Terry on 2/11/20.
//  Copyright © 2020 Drew Terry. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯")
            Text("Earn points by dragging the slider.")
            Text("The goals is to place the slider as close the the target value as possible. The closer you are the more points you score.")
            Text("Enjoy!")
        }
    .navigationBarTitle("About Bullseye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}

