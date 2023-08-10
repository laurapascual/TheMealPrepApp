//
//  ListView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var listViewModel: ListViewModel
    @AppStorage("isDark") private var isDark = false
    @State private var buttonAnimation = false
    
    init(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("Filter by area", selection: $listViewModel.filterOption) {
                    ForEach(AreaEnum.allCases, id: \.self){
                        area in
                        Text(area.rawValue)
                    }
                }.navigationTitle(Text("Meals list"))
                    .navigationBarTitleDisplayMode(.inline)
                .accessibilityLabel("Filter by area")
                .accessibilityHint("Display the picker to choose the recipes by area")
                
                switch (listViewModel.statusList) {
                    
                case StatusList.loading:
                    ZStack(){
                        Color.clear
                        VStack() {
                            Spacer()
                            ProgressView("Looking for meals...🔍")
                                .font(.system(size:16))
                            Spacer()
                        }
                    }
                    
                case StatusList.loaded:
                    ForEach(listViewModel.searchedMeals) { meal in
                        NavigationLink {
                            MealDetailView(meal: meal)
                        } label: {
                            ListCellView(meal: meal)
                                .accessibilityLabel("Filter by area")
                        }
                    }.navigationTitle(Text("Meals list")) .navigationBarTitleDisplayMode(.inline) .listRowSeparator(.hidden)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [15.0])))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Toggle("Dark", isOn: $isDark)
                        .accessibilityAddTraits([.isButton])
                        .accentColor(.orange)
                        .accessibilityLabel("Dark mode button")
                        .accessibilityHint("Change dark mode")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        rootViewModel.goToHome()
                    } label: {
                        if isDark {
                            Image(systemName: "arrowshape.backward")
                                .resizable()
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "arrowshape.backward")
                                .resizable()
                                .foregroundColor(.black)
                        }
                    }.rotation3DEffect(.degrees(buttonAnimation ? 10 : -10), axis: (x: 20, y: 20, z: 10))
                        .offset(y: buttonAnimation ? -10 : 0)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)){
                                buttonAnimation.toggle()
                            }
                        }
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Back button")
                        .accessibilityHint("Press to return to HomeView")
                }
                
            }
            
        }.scrollContentBackground(.hidden)
            .searchable(text: $listViewModel.searchText)
            .accessibilityLabel("Search recipes by name")
            .accessibilityHint("Write the recipe you are looking for")
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(listViewModel: ListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
        }
    }
}
