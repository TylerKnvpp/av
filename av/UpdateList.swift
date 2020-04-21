//
//  UpdateList.swift
//  av
//
//  Created by Tyler Knapp on 4/20/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card4", title: "New", text: "New new new new", date: "04/21/20"))
    }
    
    var body: some View {
       NavigationView {
        List {
            ForEach(store.updates) { update in
                NavigationLink(destination: DetailsView(update: update)) {
                    HStack {
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                        
                    
                        
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(update.title)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.primary)
                            
                            Text(update.text)
                            .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            
                            Text(update.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
               }
            }
            .onDelete { index in
                self.store.updates.remove(at: index.first!)
            }
            .onMove { (source: IndexSet, destination: Int) in
                self.store.updates.move(fromOffsets: source, toOffset: destination)
            }
         }
        .navigationBarTitle(Text("Updates"))
        .navigationBarItems(leading: Button(action: self.addUpdate) {
                   Text("Add Update")
                   }, trailing: EditButton())
      }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "Lorem ipsum dolor dolor ipsum lorem, lorem ipsum.", date: "04/20/20"),
    Update(image: "Card2", title: "Contentful", text: "Lorem ipsum dolor dolor ipsum lorem, lorem ipsum. Lorem ipsum dolor dolor ipsum lorem, lorem ipsum.", date: "04/20/20"),
    Update(image: "Card3", title: "React", text: "Lorem ipsum dolor dolor ipsum lorem, lorem ipsum. Lorem ipsum dolor dolor ipsum lorem, lorem ipsum. Lorem ipsum dolor dolor ipsum lorem, lorem ipsum.", date: "04/20/20")
]
