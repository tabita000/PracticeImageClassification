//
//  CameraPreview.swift
//  PracticeImageClassification
//
//  Created by Tabita Sadiq on 9/15/24.
//

import Foundation
import SwiftUI
import AVKit

struct CameraPreview: UIViewRepresentable {
    var session: AVCaptureSession
    
    func makeUIView(context: Context) -> UIView { // creating a function that will display the camera feed
        let view = UIView(frame: UIScreen.main.bounds) //UIScreen.main.bounds - this means that I am creating a UIView that will take up the entire screen
        let previewLayer = AVCaptureVideoPreviewLayer(session: session) // this creates a layer that shows the live camera feed. It is linked to the session so that it displays the video from the camera.
        previewLayer.frame = view.frame // this ensures that the camera feed will fit the entire screen
        previewLayer.videoGravity = .resizeAspectFill // this makes sure that the video feed stretches to fill the entire view without distorting the aspect ratio
        view.layer.addSublayer(previewLayer)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
}

/// summary: CameraPreview is a view that shows the live feed from the camera on the screen. The session manages the camera feed and the Camerapreview take care of displaying that feed using theUIView. the camera feed fills the whole screen, and it adjusts the video so it doesn't look squished, even though parts of it might be cropped
