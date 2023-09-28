//
//  CompetitionInfoView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 05.06.2023.
//

import SwiftUI

struct CompetitionInfoView: View {
    @State private var showAbout = false
    let imageURL: String
    let competitionCountry: String
    let competitionName: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.backgroundGradient
                VStack {
                    Spacer()
                    Text(competitionCountry)
                    Text(competitionName)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: geometry.size.width - 32)
                        .padding(.bottom, 16.0)
                }
                .bold()
                .foregroundColor(.black)
            }
            .cornerRadius(20)
            .ignoresSafeArea()
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
        }
    }
}

struct CompetitionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionInfoView(imageURL: "", competitionCountry: "name Country", competitionName: "competition name")
    }
}
