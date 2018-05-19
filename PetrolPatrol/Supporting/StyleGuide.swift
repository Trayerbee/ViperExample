//
//  StyleGuide.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 19/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit

struct StyleGuide {
    static func greenColor() -> UIColor {
        return #colorLiteral(red: 0.2866188884, green: 0.7834976912, blue: 0.2185800076, alpha: 1)
    }
    
    static func greenETATextAttributes() -> [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.foregroundColor: StyleGuide.greenColor(), NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)]
    }
    
    static func blackCellTitleAttributes() -> [NSAttributedStringKey: Any] {
        return [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)]
    }
}
