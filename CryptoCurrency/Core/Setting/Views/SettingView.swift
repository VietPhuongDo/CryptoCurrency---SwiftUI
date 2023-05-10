//
//  SettingView.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 10/05/2023.
//

import SwiftUI

struct SettingView: View {
    
    let youtubeURL = URL(string:"https://www.youtube.com/watch?v=TTYKL6CfbSs&list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu")
    let defaultURL = URL(string:"http://www.google.com ")
    let coingeckoURL = URL(string:"http://www.coingecko.com")
    let githubURL = URL(string:"https://github.com/VietPhuongDo/CryptoCurrencyBySwiftUI")
    
    var body: some View {
        NavigationView{
            List{
                infoAppSection
                infoAPISection
            }
            .font(.headline)
            .accentColor(.blue)
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

extension SettingView{
    
    private var infoAppSection: some View{
        Section(header: Text("About CryptoCurrency")){
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Thanks for @SwiftfulThinking course on Youtube.This is my first app with SwiftUI and MVVM architecture.It also helps me to know more about Combine, Core Data and API!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            Link("About the course 🔍",destination: youtubeURL!)
            Link("About Github for this mini project 💻 ",destination: githubURL!)
        }
    }
    
    private var infoAPISection: some View{
        Section(header: Text("About CoinGecko")){
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes frome a free API from CoinGecko!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            Link("About CoinGecko 🐸",destination: youtubeURL!)
        }
    }
}

