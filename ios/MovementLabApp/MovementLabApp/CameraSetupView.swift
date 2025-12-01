import SwiftUI
import AVFoundation

struct CameraSetupView: View {
    
    @State private var isCameraReady = false
    
    var body: some View {
        ZStack {
            // Camera Preview Background
            CameraPreview()
                .ignoresSafeArea()
            
            VStack {
                // Top glass bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.white.opacity(0.12))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text("Camera Setup")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.white.opacity(0.12))
                        .frame(width: 36, height: 36)
                        .overlay(
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        )
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                .background(.ultraThinMaterial.opacity(0.4))
                
                Spacer()
                
                // Bottom control panel (Glass)
                VStack(spacing: 16) {
                    Text("Place cones within the camera view.")
                        .foregroundColor(.white.opacity(0.9))
                        .font(.subheadline)
                    
                    Button(action: {
                        print("Start Test")
                    }) {
                        Text("Start Test")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color("AccentStart"),
                                        Color("AccentEnd")
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                }
                .padding(24)
                .background(.ultraThinMaterial.opacity(0.4))
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}

// Stub camera preview
struct CameraPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct CameraSetupView_Previews: PreviewProvider {
    static var previews: some View {
        CameraSetupView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 15 Pro")
    }
}