//
//  View+Ext.swift
//  CommonExt
//
//  Created by Budi Darmawan on 05/12/21.
//

import Foundation
import UIKit

extension UIView {
  
  public func makeRounded() {
    self.layer.cornerRadius = self.frame.height / 2
    self.clipsToBounds = true
    self.layer.borderWidth = 0.6
    self.layer.borderColor = UIColor.darkGray.cgColor
  }
  
  public func cornerRadius(_ radius: CGFloat) {
    self.layer.cornerRadius = radius
    self.clipsToBounds = true
  }
  
  public func makeShadow(_ radius: CGFloat = 3, _ opacity: Float = 0.5) {
    self.layer.shadowOffset = CGSize(width: 3, height: 3)
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
    self.clipsToBounds = false
  }
  
  public func visible() {
    self.isHidden = false
  }
  
  public func invisible() {
    self.isHidden = true
  }
}
