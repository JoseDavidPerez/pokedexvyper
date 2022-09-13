//
//  HomeView.swift
//  PokedexVyper
//
//  Created by osx on 05/09/22.
//

import Foundation
import UIKit

class HomeView : UIViewController {
    
    var presenter : HomePresenter?
    var pokemonData: [PokemonResponse] = []
    
    
    
    var tableview : UITableView = {
      let table = UITableView()
        table.backgroundColor = .gray
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PokemonViewCell.self, forCellReuseIdentifier: PokemonViewCell.identifier)
      return table
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        //Request es el nombre de una clase
        setupUI()
        constraintsUI()
        self.presenter?.getPokemon()

        
    }
    
    func setupUI(){
        tableview.dataSource = self
        tableview.delegate = self
        view.addSubview(tableview)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    
}

extension HomeView: HomeViewProtocol {
    
    func error(text: String){
        
    }
    
    func reloadData(data: [PokemonResponse]){
        print(data.count)
        self.pokemonData = data
        tableview.reloadData()
    }
    
    
    
    //Estas llamdo a la clase diretamente,Se usa para metodos y propiedades estaticas
    //Request
    //Este una instacia de un objeto , Se usa para crear el objeto
    //Request()
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonViewCell.identifier, for: indexPath) as! PokemonViewCell
        //cell.textLabel?.text = "hola"
        print("Configuracion de Vista")
        print("\(pokemonData[indexPath.row].name)")
        cell.setup(pokemon: pokemonData[indexPath.row])
        cell.labelname.text = pokemonData[indexPath.row].name
        return cell
    }
    
    
    
}

