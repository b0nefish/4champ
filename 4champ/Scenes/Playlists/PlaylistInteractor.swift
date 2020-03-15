//
//  PlaylistInteractor.swift
//  4champ
//
//  Created by Aleksi Sitomaniemi on 15.3.2020.
//  Copyright (c) 2020 boogie. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import CoreData

protocol PlaylistBusinessLogic
{
  func selectPlaylist(request: Playlists.Select.Request)
}

protocol PlaylistDataStore
{
  //var name: String { get set }
}

class PlaylistInteractor: NSObject, PlaylistBusinessLogic, PlaylistDataStore
{
  var presenter: PlaylistPresentationLogic?
  var selectedPlaylistId: String?
  var frc: NSFetchedResultsController<Playlist>?
  //var name: String = ""

  
  override init() {
    super.init()
    let filterString = "plId != 'radioList'"

    let fetchRequest = NSFetchRequest<Playlist>.init(entityName: "Playlist")
    fetchRequest.sortDescriptors = []
    fetchRequest.predicate = NSPredicate.init(format: filterString)
    frc = moduleStorage.createFRC(fetchRequest: fetchRequest, entityName: "Playlist")
    frc?.delegate = self
    try! frc?.performFetch()
    
    if selectedPlaylistId == nil {
      selectedPlaylistId = "default"
    }
  }
  
  // MARK: Interactions
  func selectPlaylist(request: Playlists.Select.Request) {
    if request.playlistId.count > 0 {
      selectedPlaylistId = request.playlistId
    }
    doPresent()
  }
  
  private func doPresent() {
    if let pl = frc?.fetchedObjects?.first(where: { ($0 as Playlist).plId == selectedPlaylistId }) {
      let resp = Playlists.Select.Response(selectedPlaylist: pl)
      presenter?.presentPlaylist(response: resp)
    }
  }
}

extension PlaylistInteractor: NSFetchedResultsControllerDelegate {
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("Controller will change content")
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("Controller did change content")
    doPresent()
  }
}
