//
//  Readdatajson.swift
//  beentogetherhihi
//
//  Created by Nguyễn Minh Hiếu on 10/23/19.
//  Copyright © 2019 Nguyễn Minh Hiếu. All rights reserved.
//

import Foundation

class ReadData{
    static let share = ReadData()
    
    func parejson() ->[password]{
        var json = [password]()
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json"){
            do{
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                json = try! JSONDecoder().decode([password].self, from: data)
                return json
            }
            catch{}
        }
        return [password]()
    }
}
