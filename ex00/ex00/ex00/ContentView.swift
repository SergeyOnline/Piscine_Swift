//
//  ContentView.swift
//  ex00
//
//  Created by Shira Broderick on 6/6/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		Button("Click me") {
			print("Hello World !")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
