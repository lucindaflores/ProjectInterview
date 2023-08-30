//
//  ProductAlert.swift
//  projectInterview
//
//  Created by Lucinda Flores on 30/08/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    //MARK: - Network Alerts
    static let invalidURL = AlertItem(title: Text("Server error"),
                                      message: Text("There was an issue connecting with the server. Please try again later."),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Server error"),
                                       message: Text("The data received from the server was invalid."),
                                       dismissButton: .default(Text("OK")))
    
//    static let invalidResponse = AlertItem(title: Text("Server error"),
//                                           message: Text("Invalid response from the server. Please try again."),
//                                           dismissButton: .default(Text("OK")))
//    
//    
//    
//    static let unableToComplete = AlertItem(title: Text("Server error"),
//                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
//                                            dismissButton: .default(Text("OK")))
    
    //MARK: - Generic Alerts
    static let genericAlert = AlertItem(title: Text("An Error Ocurred"),
                                       message: Text("We were unable to complete your request at this time. Please try again later."),
                                       dismissButton: .default(Text("OK")))
    
}
