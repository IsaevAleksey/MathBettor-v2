//
//  TermsOfUseView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 26.09.2023.
//

import SwiftUI

struct TermsOfUseView: View {
    var body: some View {
        ScrollView {
            Text("Third party content.")
                .bold()
            Text("The Application contains third-party content obtained from external applications and resources that we are not responsible for. All content available in Application is not hosted on our servers and is not created or uploaded by us to the hosting server. We expressly exclude any liability in connection with such content, its availability or the information contained therein. We follow the fair use law providing the image sources. The images are used solely to identify the public leagues, teams, players or venues. All images belongs to their authors, we have no ownership on any image delivered through the API.")
//            Text("We follow the fair use law providing the image sources. The images are used solely to identify the public leagues, teams, players or venues. All images belongs to their authors, we have no ownership on any image delivered through the API.")
            Text("Texts, photographs, graphic works and other elements contained in Application may be protected by copyright individually and/or as a whole (collectively, the Copyright Works). Unless otherwise agreed in with with the owners of the Copyright Works, if it is a third-party content, fair use of Copyright Works may only occur to the extent and in the manner provided for by the applicable law. In particular, the use of Copyright Works in the form of reproduction (copying) for direct or indirect economic gain, as well as their use in the form of distribution, rental is not permitted without owners explicit consent.")
            Text("Relationship to gambling.")
                .bold()
                .padding(.top)
            Text("Use of Application is entirely at your own risk. Application is not a gaming app or a gambling app. We do not operate games or gambling, therefore we do not accept or control your funds or other monies and do not participate in any gambling related transactions. However, no communication or information posted on Application constitutes a recommendation to participate in a game or to place a bet, nor does it constitute legal, tax or other similar advice in connection with gaming or gambling.")
        }
        .padding()
    }
}

struct TermsOfUseView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfUseView()
    }
}
