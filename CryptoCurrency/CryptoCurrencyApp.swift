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
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
