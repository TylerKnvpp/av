//
//  HomeView.swift
//  av
//
//  Created by Tyler Knapp on 4/15/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Workouts")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                            .rotation3DEffect(Angle(degrees:
                                Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0.0, y: 1.0, z: 0.0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 25)
            }
                   
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("\(section.title)")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image("\(section.logo)")
            }
            Text("\(section.text)".uppercased())
                .foregroundColor(Color(#colorLiteral(red: 0.8490039861, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Day One", text: "8 Exercises", logo: "Logo1", image: Image("Card1"), color: Color("card1")), Section(title: "Day Two", text: "7 Exercises", logo: "Logo1", image: Image("Card2"), color: Color("card2")), Section(title: "Day Three", text: "10 Exercises", logo: "Logo1", image: Image("Card3"), color: Color("card3")), Section(title: "Day Four", text: "8 Exercises", logo: "Logo1", image: Image("Card4"), color: Color("card4")), Section(title: "Day Five", text: "6 Exercises", logo: "Logo1", image: Image("Card5"), color: Color("card5"))
]
