//
//  TopTabBar.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/30/23.
//

import SwiftUI

enum TopTabs: Int{
    case ponging = 0
    case onDeck = 1
    case waiting = 2
    case players = 3
}

struct TopTabBar: View {
    
    @Binding var selectedTab: TopTabs
    var body: some View {
        
        HStack(alignment: .center) {
            
            Button {
                selectedTab = .ponging
               } label: {
                   GeometryReader {geo in
                    if selectedTab == .ponging {
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4) {
                        Text("Ponging")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .onDeck
               } label: {
                GeometryReader {
                    geo in
                    if selectedTab == .onDeck {
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4) {
                        Text("On Deck")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .waiting
               } label: {
                GeometryReader {
                    geo in
                    if selectedTab == .waiting {
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4) {
                        Text("Waiting")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
            Button {
                selectedTab = .players
               } label: {
                GeometryReader {
                    geo in
                    if selectedTab == .players {
                        
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(width: geo.size.width/2, height: 4)
                            .padding(.leading, geo.size.width/4)
                    }
                    
                    VStack (alignment: .center, spacing: 4) {
                        Text("Players")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            
        }
        
        .frame(height: 50)
    }
}
struct TopTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TopTabBar(selectedTab: .constant(.ponging))
    }
}
