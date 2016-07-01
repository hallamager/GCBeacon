//
//  ViewController.swift
//  GCBeacon
//
//  Created by Hallam John Ager on 29/06/2016.
//  Copyright © 2016 Hallam John Ager. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, ESTBeaconManagerDelegate {
    

    

    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.beaconManager.delegate = self

        self.beaconManager.requestAlwaysAuthorization()
        
        let query = MPMediaQuery.songsQuery()
        let predicateByGenre = MPMediaPropertyPredicate(value: "Singer/Songwriter", forProperty: MPMediaItemPropertyGenre)
        query.filterPredicates = (NSSet(object: predicateByGenre) as! Set<MPMediaPredicate>)
        
        let mediaCollection = MPMediaItemCollection(items: query.items!)
        
        let player = MPMusicPlayerController.systemMusicPlayer()
        player.setQueueWithItemCollection(mediaCollection)
        
        player.play()

        
        
    }
    


}

