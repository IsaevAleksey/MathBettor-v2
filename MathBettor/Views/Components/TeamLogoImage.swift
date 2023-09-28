//
//  TeamLogoImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 11.05.2023.
//

import SwiftUI

struct TeamLogoImage: View {
    let teamLogoURL: String
    
    var body: some View {
        CacheAsyncImage(imageURL: teamLogoURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
//                    .frame(width: 30, height: 30)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            case .empty:
                ProgressView()
//                    .frame(width: 30, height: 30)
            case .failure:
                Image(systemName: "xmark.shield")
//                    .frame(width: 30, height: 30)
            @unknown default:
                Image(systemName: "xmark.shield")
//                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct TeamLogoImage_Previews: PreviewProvider {
    static var previews: some View {
        TeamLogoImage(teamLogoURL: "")
    }
}
