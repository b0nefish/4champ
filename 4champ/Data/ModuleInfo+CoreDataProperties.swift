//
//  ModuleInfo+CoreDataProperties.swift
//  ampplayer
//
//  Created by Aleksi Sitomaniemi on 13/04/2019.
//  Copyright © 2019 boogie. All rights reserved.
//
//

import Foundation
import CoreData


extension ModuleInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModuleInfo> {
        return NSFetchRequest<ModuleInfo>(entityName: "ModuleInfo")
    }

    @NSManaged public var added: NSDate?
    @NSManaged public var lastPlayed: NSDate?
    @NSManaged public var modAuthor: String?
    @NSManaged public var modDLStatus: NSNumber?
    @NSManaged public var modFavorite: NSNumber?
    @NSManaged public var modId: NSNumber?
    @NSManaged public var modLocalPath: String?
    @NSManaged public var modName: String?
    @NSManaged public var modSize: NSNumber?
    @NSManaged public var modType: String?
    @NSManaged public var modURL: String?
    @NSManaged public var playCount: NSNumber?
    @NSManaged public var preview: NSNumber?
    @NSManaged public var radioOnly: NSNumber?
    @NSManaged public var shared: NSDate?
    @NSManaged public var playlists: NSSet?

}

// MARK: Generated accessors for playlists
extension ModuleInfo {

    @objc(addPlaylistsObject:)
    @NSManaged public func addToPlaylists(_ value: Playlist)

    @objc(removePlaylistsObject:)
    @NSManaged public func removeFromPlaylists(_ value: Playlist)

    @objc(addPlaylists:)
    @NSManaged public func addToPlaylists(_ values: NSSet)

    @objc(removePlaylists:)
    @NSManaged public func removeFromPlaylists(_ values: NSSet)

}