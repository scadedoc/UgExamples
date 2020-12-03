import ScadeKit
import Foundation
#if os(Android)	
	import FoundationNetworking
#endif

// MARK: - WeatherInfo
struct WeatherInfo: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let pressure, humidity: Int
    let tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}


class WeatherClient {
	
	 let urlString = "http://api.openweathermap.org/data/2.5/weather?q=Mumbai&appid=7275fea764870ee8ed436727cc750088"
	
	 func getTemperaturFor(city:String, onWeatherDataRetrieved:@escaping (Double) -> () ) {
		 
		// create UrlRequest
		let req = URLRequest(url: URL(string: urlString)!)
     	// create UrlSession
        let task = URLSession(configuration: .default).dataTask(with: req) { (data, response, error) in
				var temp : Double = 0.0
				
				if let dataResponse = data {
					do {
						let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: dataResponse)
						temp = weatherInfo.main.temp - 273.15 
					} catch {
						print(error)
					}
	        	}
				
				onWeatherDataRetrieved(temp)
            }
		
        task.resume()
	 }
	 
	 
}
