//
//  ContentView.swift
//  FlowingText
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
            Text("Ciamo Mondo")
                .font(Font.system(size: 45, weight: .bold, design: .rounded))
                .modifier(FlowTextModifier(backgorund: Image("mosconi")))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
