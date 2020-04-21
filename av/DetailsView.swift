//
//  DetailsView.swift
//  av
//
//  Created by Tyler Knapp on 4/20/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                     .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            .navigationBarTitle(update.title)
        }
     .listStyle(GroupedListStyle())
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
