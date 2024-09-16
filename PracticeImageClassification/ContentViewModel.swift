//
//  ContentViewModel.swift
//  PracticeImageClassification
//
//  Created by Tabita Sadiq on 9/15/24.
//

import Foundation
import AVKit
import SwiftUI
import Vision // allows to use powerful machine, learning models, and computer vision techniques to analyze and process images and videos. Can be used for face detection and recognition, text recognition, object, detection, and recognition, and image classification, Image alignment, QR code, detection and barcode detection and also for object tracking.

import Combine // this library allows you to work with asynchronous events and data streams, providing a way to handle state changes, user input and other time-based data. In simpler words, this library helps you manage data that changes overtime such as data streams.(e.g. observing changes in a database or state of the app)

class ContentViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var prediction: String = "--"
    @Published var confidence: String = "--"
    
    let session = AVCaptureSession()
    
    func setupSession () {
        guard let device = AVCaptureDevice.default(for: .video) else {return}
        guard let input = try? AVCaptureDeviceInput(device: device) else {return}
        session.sessionPreset = .hd1280x720
        
        let output = AVCaptureAudioDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        session.addInput(input)
        session.addOutput(output)
        session.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        let model = try? VNCoreMLModel(for: MLModel().model) else {return}
    }
}
