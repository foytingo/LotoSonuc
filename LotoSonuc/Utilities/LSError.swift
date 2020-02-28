//
//  LSError.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation

enum LSError: String,Error {
    case invalidGameNameOrDate = "Game or date is invalid. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
