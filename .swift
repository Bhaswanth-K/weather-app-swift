//
//  CityWeather+CoreDataProperties.swift
//  WeatherApp
//
//  Created by rentamac on 2/5/26.
//
//

public import Foundation
public import CoreData


public typealias CityWeatherCoreDataPropertiesSet = NSSet

extension CityWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityWeather> {
        return NSFetchRequest<CityWeather>(entityName: "CityWeather")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var temperature: Double
    @NSManaged public var iconName: String?

}
