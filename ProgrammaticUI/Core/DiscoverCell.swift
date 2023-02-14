//
//  DiscoverCell.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 8.02.2023.
//

import UIKit

class DiscoverCell: UITableViewCell {
    
    var img = UIImageView()
    
    var title = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(img)
        addSubview(title)
        
        configureImageView()
        configureTitleView()
        setImageConstraints()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView(){
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
    }
    
    func configureTitleView(){
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
    }
    
    func set(photo: Photo){
        DispatchQueue.global().async {
            let image = try? Data(contentsOf: URL(string: photo.url)!)
            DispatchQueue.main.async {
                guard let image = image else { return }
                self.img.image = UIImage(data: image)
                self.title.text = photo.title
            }
        }
    }
    
    func setImageConstraints(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        img.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        img.heightAnchor.constraint(equalToConstant: 100).isActive = true
        img.widthAnchor.constraint(equalTo: img.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleConstraints(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 80).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
