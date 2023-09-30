//
//  FixtureInfoView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct FixtureInfoView: View {
    @State private var showAbout = false

    let homeTeamLogoURL: String
    let awayTeamLogoURL: String
    let homeTeamName: String
    let awayTeamName: String
    let fixtureDate: String
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.backgroundGradient
                VStack(spacing: 8.0) {
                    Spacer()
                    HStack(alignment: .top) {
                        Text(homeTeamName)
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width / 3)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))

                        Spacer()
                        Text(awayTeamName)
                            .multilineTextAlignment(.center)
                            .frame(width: geometry.size.width / 3)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
                    }
                    .padding(.horizontal, 16.0)
                    Text(fixtureDate)
                        .fontWeight(.thin)
                        .padding(.bottom)
                }
                .bold()
                .foregroundColor(.white)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        self.showAbout.toggle()
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .sheet(isPresented: $showAbout) {
                        TermsOfUseView()
                    }
                }
            }
            .cornerRadius(20)
        .ignoresSafeArea()
        }
    }
}

struct FixtureInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureInfoView(homeTeamLogoURL: "", awayTeamLogoURL: "", homeTeamName: "home", awayTeamName: "away", fixtureDate: "20-02-2023 00001122")
    }
}
