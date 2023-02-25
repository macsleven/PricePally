//
//  categoryColtnsVCCollectionViewCell.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 21/02/2023.
//

import UIKit

class CategoryColtnsVCell: UICollectionViewCell {
    var img = UIImageView()
    
    let name : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center

        lbl.layer.backgroundColor = UIColor(red: 1, green: 0.93, blue: 0.754, alpha: 1).cgColor
        lbl.font = UIFont(name: "Roboto-Regular", size: 13)
        lbl.layer.cornerRadius = 8
           return lbl
       }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        self.addSubview(img)
        self.addSubview(name)
    }
      
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      
    override func layoutSubviews() {
      super.layoutSubviews()
        contentView.addSubview(img)
        contentView.addSubview(name)
        contentView.bringSubviewToFront(img)
        
      
        img.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        
        
      
      NSLayoutConstraint.activate([
        img.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        name.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        img.bottomAnchor.constraint(equalTo: name.topAnchor, constant: 8),
        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        name.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
        name.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 8),
        name.heightAnchor.constraint(equalToConstant: 50)
      ])
    }
}
