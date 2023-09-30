//
//  CompetitionImage.swift
//  MathBettor
//
//  Created by Алексей Исаев on 03.05.2023.
//

import SwiftUI

struct CompetitionImage: View {
    let imageURL: String
    let imageSize: CGSize
//    let cornerRadius: CGFloat
//    let shadowIsOn: Bool
        
    var body: some View {
        CacheAsyncImage(imageURL: imageURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
            case .empty:
                ProgressView()
                    .frame(width: imageSize.width, height: imageSize.height)
            case .failure:
                Image(systemName: "xmark.shield")
                    .frame(width: imageSize.width, height: imageSize.height)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    .cornerRadius(5)
                    .shadow(radius: 10)
            @unknown default:
                Image(systemName: "xmark.shield")
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
            }
        }
    }
}

struct CompetitionImage_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionImage(imageURL: "", imageSize: CGSize(width: 150, height: 150))
    }
}
