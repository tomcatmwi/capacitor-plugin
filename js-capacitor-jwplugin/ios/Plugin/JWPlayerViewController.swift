//
//  JWPlayerViewController.swift
//  Plugin
//
//  Created by Jeff Marshall on 2021-01-11.
//  Copyright © 2021 Max Lynch. All rights reserved.
//

import Foundation
import GoogleCast

class JWPlayerViewController: UIViewController, JWCastingDelegate {
    var player: JWPlayerController?
    var castController: JWCastController
    var videoUrl: String
    var availableDevices: [JWCastingDevice]
    
    init(videoUrl: String) {
        self.videoUrl = videoUrl
        JWPlayerController.setPlayerKey("Ew13SYlToctyMrzcCLvl7ZVvn6zSzH2fJlHW/Z7XrtTv5ebC")
        let config = JWConfig()
        config.file = self.videoUrl
        
        player = JWPlayerController(config: config)
        
        castController = JWCastController(player: player!)
        castController.chromeCastReceiverAppID = kGCKDefaultMediaReceiverApplicationID
        availableDevices = []
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        castController.delegate = self
        castController.scanForDevices()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let playerView = player?.view {
            view.addSubview(playerView)
            playerView.constrainToSuperview()
        }
    }
    
    // JWCastController delegate methods
    
    func onCastingDevicesAvailable(_ devices: [JWCastingDevice])
    {
        availableDevices = devices
    }
}

// MARK: - Helper method
extension UIView {
    /// Constrains the view to its superview, if it exists, using Autolayout.
    /// - precondition: For player instances, JWP SDK 3.3.0 or higher.
    @objc func constrainToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[thisView]|",
            options: [],
            metrics: nil,
            views: ["thisView": self]
        )
        
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[thisView]|",
            options: [],
            metrics: nil,
            views: ["thisView": self]
        )
        
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
    }
}
