//
//  LocalSource.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation
import CoreData

class LocalSource: LocalArticle {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<LocalSource> {
        return NSFetchRequest<LocalSource>(entityName: "LocalSource")
    }

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var article: LocalArticle?
    
    static func addSource(_ source: ArticleSource?) -> LocalSource {
        let localSource = LocalSource(context: CoreDataManager.shared.managedObjectContext)
        localSource.id = source?.id
        localSource.name = source?.name
        return localSource
    }
}
