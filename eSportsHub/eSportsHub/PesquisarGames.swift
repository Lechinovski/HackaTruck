import SwiftUI

struct PesquisarGames: View {
    @State private var textValue = "0"
    @State private var text = ""
    @StateObject var Api = api2()
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    Text("Pesquisar")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .offset(y:-90)
                        .padding(.top)
                    
                    
                    ScrollView {
                        VStack{
                            ForEach(filteredGames, id: \.self) {Game in
                                NavigationLink(destination: JogosClicou(j: Game)){
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: Game.photoJogos!)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 70, height: 70)
                                        
                                        Text(Game.nameJogos!)
                                            .fontWeight(.bold)
                                            .frame(width: 270, height: 50)
                                            .foregroundColor(Color.white )
                                    }
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                    .padding(3)
                                }
                                
                            }
                            
                        }
                        
                        .onAppear{
                            Api.fetch()
                            
                        }
                    }
                    .searchable(text: $text, prompt: "Jogos")
                    .foregroundColor(Color.white)
                }
            }
        }
        
        
    }
    
    var filteredGames: [Jogo] {
        if text.isEmpty {
            return Api.jogos
        } else {
            return Api.jogos.filter { $0.nameJogos!.localizedCaseInsensitiveContains(text) }
        }
    }
    
}



