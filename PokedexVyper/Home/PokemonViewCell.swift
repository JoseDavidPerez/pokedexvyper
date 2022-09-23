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
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 22)
        return label
    }()
    
    var imagenpokemon : UIImageView = {
      let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()

    var stackview : UIStackView = {
        
      let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    var labelattack : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var labeldefense : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        
        setupUI()
        setupConstraint()
    }
    

    
    func setupUI(){
        
        contentView.addSubview(imagenpokemon)
        contentView.addSubview(labelname)
        contentView.addSubview(stackview)
        stackview.addArrangedSubview(labelattack)
        stackview.addArrangedSubview(labeldefense)
        
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
            
            imagenpokemon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imagenpokemon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imagenpokemon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imagenpokemon.heightAnchor.constraint(equalToConstant: 120),
            
            labelname.topAnchor.constraint(equalTo: imagenpokemon.bottomAnchor, constant: 20),
            labelname.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelname.heightAnchor.constraint(equalToConstant: 50),
            
            stackview.topAnchor.constraint(equalTo: labelname.bottomAnchor, constant: 20),
            stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackview.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func setup(pokemon: PokemonResponse){
        imagenpokemon.loadFrom(URLAddres: pokemon.imageURL)
        labelname.text = pokemon.name
        labelattack.text = "Ataque : \(pokemon.attack)"
        labeldefense.text = "Defenza : \(pokemon.defense)"
    }
    
}
