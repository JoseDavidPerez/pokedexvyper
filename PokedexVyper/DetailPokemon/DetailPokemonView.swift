//
//  DetailPokemonView.swift
//  PokedexVyper
//
//  Created by Jose David Torres Perez on 20/09/22.
//

import Foundation
import UIKit
import CoreData

class DetailPokemonView : UIViewController {

    var presenter : DetailPokemonPresenter?
    var pokemonData : PokemonResponse?
    
    func conexion()-> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    var imgicon : UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "star.fill")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    var imagenpokemon : UIImageView = {
      let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFit
        return imagen
    }()
    
     var labeldescription : UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    var labeltype: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 22)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        gestureUI()
        setupUI()
        constrainstsUI()
        setup(pokemon: pokemonData!)
        
    }
    
    func setupUI(){
        view.addSubview(imagenpokemon)
        view.addSubview(labeldescription)
        view.addSubview(labeltype)
        view.addSubview(imgicon)
        
    }
    func gestureUI(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.addFavorite))
            imgicon.addGestureRecognizer(tap)
            imgicon.isUserInteractionEnabled = true
    }
    func constrainstsUI(){
        
        NSLayoutConstraint.activate([
            
            imagenpokemon.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imagenpokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imagenpokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imagenpokemon.heightAnchor.constraint(equalToConstant: 120),
            
            labeldescription.topAnchor.constraint(equalTo: imagenpokemon.bottomAnchor, constant: 20),
            labeldescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labeldescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labeltype.topAnchor.constraint(equalTo: labeldescription.bottomAnchor, constant: 20),
            labeltype.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            labeltype.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            imgicon.topAnchor.constraint(equalTo: labeltype.bottomAnchor, constant: 10),
            imgicon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imgicon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imgicon.heightAnchor.constraint(equalToConstant: 50),
            imgicon.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
    func setup(pokemon: PokemonResponse){
        imagenpokemon.loadFrom(URLAddres: pokemon.imageURL)
        labeldescription.text = pokemon.description
        labeltype.text = " Tipo : \(pokemon.type)"
    }
    
    
    @objc func addFavorite(){
        let contexto = conexion()
        var entidadPokemon = NSEntityDescription.insertNewObject(forEntityName: "Pokemon", into: contexto) as! PokemonResponse
        entidadPokemon.type = labeltype.text ?? ""
        entidadPokemon.description = labeldescription.text ?? ""
        do {
            try contexto.save()
            print("Save")
        }catch let error as NSError {
            print("Error al guardar", error.localizedDescription)
        }
    }
}

extension DetailPokemonView : DetailPokemonViewProtocol {
    
}
