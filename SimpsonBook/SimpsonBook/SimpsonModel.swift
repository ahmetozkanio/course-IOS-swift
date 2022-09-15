//
//  SimpsonModel.swift
//  SimpsonBook
//
//  Created by Ahmet Ozkan on 15.09.2022.
//

import Foundation
import UIKit

class Simpson{
    var name: String?
    var job: String?
    var image: UIImage
    
    init(nameSimpson: String, jobSimpson: String, imageSimpson: UIImage) {
        self.name = nameSimpson
        self.job = jobSimpson
        self.image = imageSimpson
    }
}
