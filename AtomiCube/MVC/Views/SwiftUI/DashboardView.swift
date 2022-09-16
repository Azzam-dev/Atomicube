//
//  DashboardView.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 15/09/2022.
//

import SwiftUI
import Charts

struct DashboardView: View {
    var body: some View {
        Text("Hello, Atomic")
            .padding(20)
            .background(.secondary)
            .border(.black, width: 2)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
