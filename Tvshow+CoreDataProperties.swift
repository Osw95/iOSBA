//
//  Tvshow+CoreDataProperties.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 19/07/23.
//
//

import Foundation
import CoreData


extension Tvshow {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tvshow> {
        return NSFetchRequest<Tvshow>(entityName: "Tvshow")
    }

    @NSManaged public var favorite: Bool
    @NSManaged public var id: Int64
    @NSManaged public var tvshowToGenre: NSSet?

}

// MARK: Generated accessors for tvshowToGenre
extension Tvshow {

    @objc(addTvshowToGenreObject:)
    @NSManaged public func addToTvshowToGenre(_ value: Genre)

    @objc(removeTvshowToGenreObject:)
    @NSManaged public func removeFromTvshowToGenre(_ value: Genre)

    @objc(addTvshowToGenre:)
    @NSManaged public func addToTvshowToGenre(_ values: NSSet)

    @objc(removeTvshowToGenre:)
    @NSManaged public func removeFromTvshowToGenre(_ values: NSSet)

}
