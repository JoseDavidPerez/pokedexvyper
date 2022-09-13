//
//  PokemonViewCell.swift
//  PokedexVyper
//
//  Created by osx on 07/09/22.
//

import Foundation
import UIKit


class PokemonViewCell : UITableViewCell {
    
    static let identifier = "PokemonTableViewCell"
    
    var labelname : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(labelname)
        setupConstraint()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            labelname.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelname.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelname.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelname.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        
        ])
    }
    
    func setup(pokemon: PokemonResponse){
        labelname.text = pokemon.name
    }
    
}
