//
//  SimpleStepper.swift
//  AtomiCube
//
//  Created by Azzam AL-Rashed on 17/09/2022.
//

import SwiftUI

struct SimpleStepper: View {
    @State var number = 0
    var body: some View {
        HStack {
            Button {
                number = number-2
                print(number)
            } label: {
                Text("--")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .border(.gray, width: 2)
            }
            Button {
                number = number-1
                print(number)
            } label: {
                Text("-")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .border(.gray, width: 2)
            }
            Button {
                number = 0
                print(number)
            } label: {
                Text("\(number)")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .border(.gray, width: 2)
            }
            Button {
                number = number+1
                print(number)
            } label: {
                Text("+")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .border(.gray, width: 2)
            }
            
            Button {
                number = number+2
                print(number)
            } label: {
                Text("++")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.black)
                    .border(.gray, width: 2)
            }
        }

        
    }
}

struct SimpleStepper_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStepper()
    }
}
