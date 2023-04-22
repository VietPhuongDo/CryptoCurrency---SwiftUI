//
//  CryptoCurrencyApp.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 02/04/2023.
//

import SwiftUI

@main
struct CryptoCurrencyApp: App {
    @State private var  vm = HomeViewModel()
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
