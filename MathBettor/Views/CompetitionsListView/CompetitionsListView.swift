//
//  CompetitionsListView.swift
//  MathBettor
//
//  Created by Алексей Исаев on 24.04.2023.
//

import SwiftUI

struct CompetitionsListView: View {
    @StateObject var viewModel: CompetitionsListViewModel
    @State private var showAbout = false
    @State private var searchText = ""
    
    var searchResults: [CompetitionViewModel] {
        if searchText.isEmpty {
            return viewModel.rows
        } else {
            let filtredForCountry = viewModel.rows.filter { $0.competitionCountry.contains(searchText) }
            let filtredForCompetition = viewModel.rows.filter { $0.competitionName.contains(searchText) }
            
            if !filtredForCountry.isEmpty {
                return filtredForCountry
            } else {
                if !filtredForCompetition.isEmpty {
                    return filtredForCompetition
                } else {
                    return viewModel.rows
                }
            }
        }
    }
    
    var body: some View {
        if viewModel.rows.isEmpty {
            VStack(spacing: 20.0) {
                ProgressView()
                Text("Download...")
            }
            .task {
                await viewModel.fetchCompetitionsList()
//                print("загружается список лиг")
            }
        } else {
            NavigationView {
                ZStack {
                    Color("NavigationViewBackground")
                        .ignoresSafeArea()
                    List(searchResults, id: \.competitionsId) { competitionViewModel in
                        NavigationLink(destination: CompetitionView(viewModel: competitionViewModel)) {
                            CompetitionRow(
                                competitionName: competitionViewModel.competitionName,
                                competitionCountry: competitionViewModel.competitionCountry,
                                competitionImageURL: competitionViewModel.competitionsLogoUrl
                            )
                        }
                    }
                    .navigationTitle("Select competition")
                    .toolbarBackground(Color("NavigationViewBackground"), for: .navigationBar)
                    .listStyle(.plain)
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
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Toggle("Hide canceled", isOn: $hiddenCanceled)
                    }
                }
            }
            .preferredColorScheme(.light)
            .accentColor(.white)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "search by country or competition"
                )
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
            CompetitionsListView(viewModel: CompetitionsListViewModel())
    }
}
