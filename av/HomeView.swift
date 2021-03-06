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
    @Binding var showContent: Bool
    @State var showUpdate: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                
                HStack {
                    Text("Workouts").modifier(CustomFont())
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                        self.showContent = true
                    }
                }
                    

                
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
                .offset(y: -30)
                
                
                HStack {
                    Text("Programs")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -60)
                       
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
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
        .frame(width: width, height: height)
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

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 44, height: 44, percent: 85, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 mins left").bold().modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 mins today").modifier(FontModifier(style: .caption))
                    
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 33, height: 33, percent: 23, show: .constant(true))
                    
                    .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 33, height: 33, percent: 45, show: .constant(true))
                    
                    .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
