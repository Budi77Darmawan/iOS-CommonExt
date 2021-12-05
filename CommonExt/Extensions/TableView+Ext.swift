//
//  TableView+Ext.swift
//  CommonExt
//
//  Created by Budi Darmawan on 05/12/21.
//

import Foundation
import UIKit

extension UITableView {
  public func reloads() {
    DispatchQueue.main.async {
      self.reloadData()
    }
  }
  
  public func endRefreshControl() {
    DispatchQueue.main.async {
      self.refreshControl?.endRefreshing()
    }
  }
  
  public func setBackground(imageName: String, messageImage: String?) {
    DispatchQueue.main.async {
      let parentView = UIView()
      parentView.frame = self.frame
      
      let imageView = UIImageView()
      imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
      imageView.image = UIImage(named: imageName)
      imageView.contentMode = .scaleAspectFill
      
      let labelImage = UILabel()
      labelImage.text = messageImage ?? "Internal Server Error"
      labelImage.numberOfLines = 0
      labelImage.textAlignment = .center
      
      let stackView = UIStackView(arrangedSubviews: [imageView, labelImage])
      stackView.axis = .vertical
      stackView.alignment = .center
      stackView.spacing = 10
      
      let rootStackView = UIStackView(arrangedSubviews: [stackView])
      rootStackView.axis = .horizontal
      rootStackView.alignment = .center
      rootStackView.translatesAutoresizingMaskIntoConstraints = false
      
      parentView.addSubview(rootStackView)
      NSLayoutConstraint.activate([
        rootStackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 15),
        rootStackView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -15),
        rootStackView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0),
        rootStackView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0)
      ])
      
      self.backgroundView = parentView
      self.separatorStyle = .none
      self.reloads()
      self.endRefreshControl()
    }
  }
  
  public func clearBackground(separator: UITableViewCell.SeparatorStyle = .singleLine) {
    self.backgroundView = nil
    self.separatorStyle = separator
  }
}
