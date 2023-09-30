//
//  CompetitionRow.swift
//  MathBettor
//
//  Created by Алексей Исаев on 04.05.2023.
//

import SwiftUI

struct CompetitionRow: View {
    let competitionName: String
    let competitionCountry: String
    let competitionImageURL: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            CompetitionImage(
                imageURL: competitionImageURL,
                imageSize: CGSize(width: 15, height: 15)
            )
            VStack(alignment: .leading) {
                Text(competitionCountry)
                    .font(.system(size: 14))
                    .fontWeight(.ultraLight)
                Text(competitionName)
                    .font(.system(size: 14))
            }
        }
    }
}

struct CompetitionRow_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionRow(competitionName: "name", competitionCountry: "country", competitionImageURL: "url")
    }
}
