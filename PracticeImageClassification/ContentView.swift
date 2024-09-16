import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            HStack{
                Text("Prediction: ")
                Text(viewModel.prediction)
                //Bottom of Hstacks
            }
            HStack{
                Text("Confidence: ")
                Text(viewModel.confidence)
                //Bottom of Hstack
            }
            
            //Camera preview that the app uses to display the preview
            CameraPreview(session: viewModel.session)
                .onAppear{
                    DispatchQueue.global().async {
                        self.viewModel.setupSession()
                        
                        //The above code explanation: onAppear ensures setupSession() method is called when the CameraPreview view appears.
                        //DispatchQueue.global().async runs setupSession() on the background to avoid freezing the UI
                        //setupSession() is resonsible for configuring the camera session, rnsuring the app is ready to display a live camera feed.
                    }
                }
        }
        .background(
            Image(.bluBD)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ContentView()
}
