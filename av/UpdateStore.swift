//
//  UpdateStore.swift
//  av
//
//  Created by Tyler Knapp on 4/20/20.
//  Copyright © 2020 Tyler Knapp. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
