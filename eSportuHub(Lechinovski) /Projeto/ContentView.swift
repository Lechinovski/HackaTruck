import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack{
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1))
            }
            VStack{
                
                TabView{
                    Home()
                        .tabItem{
                            Label("Home", systemImage: "house.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                    Jogos()
                        .tabItem{
                            Label("Jogos", systemImage: "gamecontroller.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                    Jogadores()
                        .tabItem{
                            Label("Jogadores", systemImage: "person.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                    Times()
                        .tabItem{
                            Label("Times", systemImage: "shield.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                    Torneios()
                        .tabItem{
                            Label("Torneios", systemImage: "trophy.fill")
                        }
                        .toolbar(.visible, for: .tabBar)
                    
                }
            }
        }
        .onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 3)
            {
                withAnimation{
                    self.showSplash = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
