//
//  Extension.swift
//  PokedexVyper
//
//  Created by Jose David Torres Perez on 20/09/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(URLAddres: String) {
        
        guard let url = URL(string: URLAddres) else { return }
        
            DispatchQueue.main.async {
                if let imagenData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imagenData){
                        self.image = loadedImage
                }
            }
        }
    }
}
