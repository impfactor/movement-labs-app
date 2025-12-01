import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Apple Fitness+ gradient style background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("AccentStart"),
                        Color("AccentEnd")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {

                    // Title / Logo section
                    VStack(spacing: 8) {
                        Text("Movement Lab")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)

                        Text("Test & Performance")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white.opacity(0.85))
                    }
                    .padding(.top, 30)

                    // Main test cards
                    VStack(spacing: 18) {

                        GlassCard(title: "Hop Test Battery",
                                  subtitle: "Single, Triple, Crossover")

                        GlassCard(title: "LESS Landing Analysis",
                                  subtitle: "Auto-detect landing errors")

                        GlassCard(title: "Acceleration ¡÷ Deceleration",
                                  subtitle: "Peak decel, braking efficiency")

                        GlassCard(title: "Change of Direction (COD)",
                                  subtitle: "Cut angle, stability, deficit")
                    }

                    Spacer()

                    // Bottom actions
                    HStack(spacing: 24) {
                        NavigationLink(destination: Text("History Screen")) {
                            BottomButton(label: "History")
                        }

                        NavigationLink(destination: Text("Settings Screen")) {
                            BottomButton(label: "Settings")
                        }
                    }
                    .padding(.bottom, 40)
                }
                .padding(.horizontal, 20)
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Components

struct GlassCard: View {
    let title: String
    let subtitle: String

    var body: some View {
        ZStack {
            // Glass background (Ultra-thin material effect)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.07))
                .background(.ultraThinMaterial)
                .blur(radius: 0.2)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.12), lineWidth: 1)
                )

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.85))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
        }
        .frame(height: 70)
    }
}

struct BottomButton: View {
    let label: String

    var body: some View {
        Text(label)
            .font(.subheadline)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.white.opacity(0.12))
            .foregroundColor(.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
            )
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 15 Pro")
    }
}