//
//  DashboardView.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 15/09/2022.
//

import SwiftUI
import Charts

struct BarChart: View {
    
    var mood: Mood = RealmRepository.shared.getMood()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart {
                ForEach(Array(mood.values.enumerated()), id: \.offset) { index, mood in
                    BarMark(
                        x: .value("Shape Type", index),
                        y: .value("Total Count", mood)
                    ).foregroundStyle(by: .value("Shape Color", "Purple"))
                }
            }.chartForegroundStyleScale([ "Purple": .purple])
        } else {
            // Fallback on earlier versions
            Text("Please update your device to iOS 16 or later to be able to use this feature")
        }
    }
}

struct DashboardView: View {
    var body: some View {
        VStack {
            List {
                BarChart()
                    .frame(height: 100)
                    .padding()
            }
        }.padding(.top, 60)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
