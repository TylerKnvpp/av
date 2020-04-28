//
//  CourseList.swift
//  av
//
//  Created by Tyler Knapp on 4/27/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @State var courses = courseData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Days")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 30)
                
                
                ForEach(courses.indices, id: \.self) { index in
                    GeometryReader { geometry in
                        CourseView(show: self.$courses[index].show, course: self.courses[index])
                            .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                    }
                    .frame(height: 280)
                    .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                }
            }
            .frame(width: screen.width)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
        }
 
    
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Lorem ipsum dolor Lorem ipsum dolor, Lorem ipsum dolor.")
                
                Text("About:")
                    .font(.title).bold()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    
                    ZStack {
                        course.logo
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.bottom, 20)
                Spacer()
                
                course.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
                
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)

            .background(course.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
                self.show.toggle()
            }
        }
        
//        .offset(y: show ? -45 : 0)
            .frame(height: show ? screen.height : 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
         
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: Image
    var logo: Image
    var color: Color
    var show: Bool
}

let courseData = [
    Course(title: "Day One", subtitle: "Chest Day", image: Image("Card1"), logo: Image("Logo1"), color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), show: false), Course(title: "Day Two", subtitle: "Leg Day", image: Image("Card2"), logo: Image("Logo1"), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), show: false),
    Course(title: "Day Three", subtitle: "Back Day", image: Image("Card3"), logo: Image("Logo1"), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), show: false)
]
