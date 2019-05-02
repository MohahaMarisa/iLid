//
//  VideoPlay.swift
//  VisionFaceTrack
//
//  Created by Marisa Lu on 5/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
//
//  VideoPlay.swift
//  VisionFaceTrack
//
//  Created by Marisa Lu on 4/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

//import Foundation
import UIKit
import AVFoundation

class VideoPlay: UIView {
    private var player : AVPlayer!
    private var playerLayer : AVPlayerLayer!
    
    init() {
        super.init(frame: CGRect.zero)
        self.initializePlayerLayer()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializePlayerLayer()
        self.autoresizesSubviews = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializePlayerLayer()
    }
    
    private func initializePlayerLayer(){
        playerLayer = AVPlayerLayer()
        playerLayer.backgroundColor = UIColor.black.cgColor
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        self.layer.addSublayer(playerLayer)
        playerLayer.frame = self.bounds
        
    }
    
    func playVideoWithURL(url: URL) {
        player = AVPlayer(url: url)
        //player.isMuted = true
        
        playerLayer.player = player
        
        player.play()
        
        loopVideo(videoPlayer: player)
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil){ notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }
}
