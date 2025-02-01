//
//  LoadScreenView.swift
//  heirloom
//
//  Created by Kristopher on 7/4/24.
//

import SwiftUI
import AVKit
import AVFoundation



import SwiftUI
import AVKit
import AVFoundation

struct LoadScreenView: UIViewControllerRepresentable {
    
    @Binding var isVideoFinished: Bool
    
    func makeUIViewController(context: Context) -> LoadScreenViewController {
        let viewController = LoadScreenViewController()
        viewController.onVideoFinish = {
            DispatchQueue.main.async {
                isVideoFinished = true
            }
        }
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: LoadScreenViewController, context: Context) {
        // No need to update anything for now
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
 

