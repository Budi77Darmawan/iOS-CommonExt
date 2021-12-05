//
//  CustomError+Ext.swift
//  CommonExt
//
//  Created by Budi Darmawan on 05/12/21.
//

import Foundation

enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }

}
