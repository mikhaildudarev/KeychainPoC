//
//  LaunchScreenView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenStateManager: LaunchScreenStateManager

    @State private var keyOpacity: CGFloat = .zero
    @State private var chainOpacity: CGFloat = .zero
    @State private var screenOpacity: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text("KEY")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .opacity(keyOpacity)
                Text("chain")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .opacity(chainOpacity)
            }
            .padding()
            .border(.thickMaterial, width: 3)
        }
        .opacity(screenOpacity)
        .onChange(of: launchScreenStateManager.state) { newValue in
            switch newValue {
            case .inital:
                break
            case .firstStep:
                withAnimation { keyOpacity = 1 }
            case .secondStep:
                withAnimation { chainOpacity = 1 }
            case .thirdStep:
                withAnimation { screenOpacity = 0 }
            case .finished:
                break
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}
