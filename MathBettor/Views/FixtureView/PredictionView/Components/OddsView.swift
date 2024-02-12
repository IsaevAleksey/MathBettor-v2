//
//  OddsView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 12.02.2024.
//

import SwiftUI

struct OddsView: View {
    let bookmakers: [Bookmaker]
    
    var body: some View {
        List(bookmakers, id: \.name) { bookmaker in
            Text(bookmaker.name)
            ForEach(bookmaker.bets.filter {$0.name.contains("Match Winner")}, id: \.name) { bet in
                VStack {
                    Text(bet.name)
                    BetRow(values: bet.values)
                }
            }
        }
    }
}

struct OddsView_Previews: PreviewProvider {
    static var previews: some View {
        OddsView(bookmakers: [Bookmaker(name: "123Bet", bets: [Bet(name: "Match Winner", values: [Values(value: "ishod", odd: "1.4")])])])
    }
}


struct BetRow: View {
    let values: [Values]
    var body: some View {
        ForEach(values, id: \.value) { value in
            HStack {
                Text(value.value ?? "no value")
                Text(value.odd)
            }
        }
    }
}
