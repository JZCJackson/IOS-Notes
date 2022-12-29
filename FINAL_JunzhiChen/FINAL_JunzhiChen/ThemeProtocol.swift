//
//  ThemeProtocol.swift
//  theme2
//
//  Created by Orange on 2022-12-18.
//

import UIKit

protocol ThemeProtocol{
    var mainFontName: String {get}
    var textColor: UIColor {get}
    var accent: UIColor {get}
    var background: UIColor {get}
    var tint: UIColor {get}
    
}
