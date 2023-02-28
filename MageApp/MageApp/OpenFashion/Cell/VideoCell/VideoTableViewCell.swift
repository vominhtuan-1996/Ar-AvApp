//
//  VideoTableViewCell.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 06/12/2022.
//

import UIKit
import AVFoundation
class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    var player:AVPlayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.videoView.frame.size = CGSize(width: UIScreen.screenWidth, height: self.videoView.frame.size.height)
        //1. Create a URL
    }

    func initPlayVideo(link:String) {
        if let url = URL(string: link) {
            //2. Create AVPlayer object
            let asset = AVAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            self.player = AVPlayer(playerItem: playerItem)
            
            //3. Create AVPlayerLayer object
            let playerLayer = AVPlayerLayer(player: self.player)
            playerLayer.frame = self.videoView.frame //bounds of the view in which AVPlayer should be displayed
            playerLayer.videoGravity = .resizeAspectFill
            
            //4. Add playerLayer to view's layer
            self.videoView.layer.addSublayer(playerLayer)
            
            //5. Play Video
            self.player?.play()
        }
    }
    
}
