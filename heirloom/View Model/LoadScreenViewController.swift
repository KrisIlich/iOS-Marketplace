//
//  LoadScreenViewController.swift
//  heirloom
//
//  Created by Kristopher on 7/4/24.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class LoadScreenViewController: UIViewController {
    
    let playerController = AVPlayerViewController()
    let logoImageView = UIImageView(image: UIImage(named: "logo"))
    var onVideoFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogoImageView()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        playVideo()
    }
    
    private func setupLogoImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    

    
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "testvideo2", ofType: "mp4") else {
            debugPrint("testvideo.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        playerController.showsPlaybackControls = false
        playerController.player = player
        playerController.videoGravity = .resizeAspectFill
        
        addChild(playerController)
        playerController.view.frame = view.bounds
        view.insertSubview(playerController.view, at: 0)
        playerController.didMove(toParent: self)
        
        
        player.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        
    }
    
    
    
    @objc func playerDidFinishPlaying(note: NSNotification){
        print("Method , video is finished")
        onVideoFinish?()
    }
    
    
    
    
    
}



    

/* private var player: AVPlayer
 let playerController = AVPlayerViewController()*/


/*private func playVideo() {
    guard let path = Bundle.main.path(forResource: "testvideo", ofType: "mp4") else {
        debugPrint("testvideo.mp4 not found")
        return
    }
    let player = AVplayer(url: URL(fileURLWithPath: path))
    
    playerController.showsPlaybackControls = false
    playerController.player = player
    playerController.videoGravity = .resizeAspectFill
    
    present(playerController, animated: true) {
        player.play()
    }*/

    
    
    /*  init() {
     if let path = Bundle.main.path(forResource: "testvideo", ofType: "mp4") {
     player = AVPlayer(url: URL(fileURLWithPath: path))
     } else {
     player = AVPlayer()
     }
     } */
    
    
    /*
    var body: some View {
        VStack {
            if isActive {
                HomeScreenView()
            } else {
                ZStack {
                    VideoPlayer(player: player)
                        .resizeAspectFill
                        .onAppear {
                            player.play()
                            DispatchQueue.main.asyncAfter(deadline: .now() + player.currentItem!.duration.seconds) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                    VStack {
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        
                        Spacer()
                    }
                }
            }
        }
    } */




/* struct LoadScreenView_Previews: PreviewProvider {
     static var previews: some View{
         LoadScreenView()
     }
 } */
 

