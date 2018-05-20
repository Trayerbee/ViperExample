//
//  BorderedSquareButton.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 20/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit

class BorderedSquareButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
}
