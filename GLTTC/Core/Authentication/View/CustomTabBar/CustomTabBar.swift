//
//  CustomTabBar.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/29/23.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        
        HStack(alignment: .center) {
            
            Button {
                
            } label: {
                
                GeometryReader {
                    geo in
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width/2, height: 4)
                        .padding(.leading, geo.size.width/4)
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "figure.table.tennis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray )
                        
                        Text("League")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            //.tint(Color("icons-secondary"))
            
            Button {
                
            } label: {
                
                GeometryReader {
                    geo in
                    
//                    Rectangle()
//                        .foregroundColor(.blue)
//                        .frame(width: geo.size.width/2, height: 4)
//                        .padding(.leading, geo.size.width/4)
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray )
                        
                        Text("Account")
                            .foregroundColor(.gray )
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                
            }
            
            //.tint(Color("icons-secondary"))
            
        }
        
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
