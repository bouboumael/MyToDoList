//
//  HomeView.swift
//  MyToDoList
//
//  Created by Mael Chariault on 12/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                VStack {
                    Text("Bienvenue \n dans \n My Todo List")
                        .font(.title)
                        .underline()
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    Spacer()
                    NavigationLink(destination: TodoListView()){
                        Text("Voir ma todo liste")
                            .bold()
                            .padding()
                            .foregroundColor(.primary)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .frame(width: 200, height: 50)
                            .padding(10)
                            .padding(.bottom, 60)
                    }
                }
            }
            .background(.cyan)
            .navigationTitle("Accueil")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.primary)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
