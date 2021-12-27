//
//  APIHandler.swift
//  Ass13
//
//  Created by DCS on 27/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class APIHandler {
    static let shared = APIHandler()
    func search_weather(with name:String) -> [WeatherDetails] {
        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=35172208ce424ecb90750709212207&q=\(name)&aqi=no"){
            do { let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                do{ let jsonWeather = try decoder.decode(WeatherDetails.self, from: data)
                    print(jsonWeather.current.condition.icon)
                    return  [jsonWeather]
                }catch {
                    print(error)
                }
                
            } catch {
                print(error)
            }
        }
        
        return [WeatherDetails]()
    }
}
