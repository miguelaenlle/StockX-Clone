//
//  HomeViewModel.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import Foundation
import FirebaseFirestore
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var selectedCollection = "Sneakers"
}
