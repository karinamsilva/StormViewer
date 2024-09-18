//
//  MainViewModel.swift
//  HackingWithSwiftDayOne
//
//  Created by Karina on 18/09/24.
//

import Foundation

class MainViewModel {
    
    var pictures = [String]()
    
    func getImages() {
        let myFileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! myFileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
    }
    
    init(pictures: [String] = [String]()) {
        self.pictures = pictures
        getImages()
    }
}
