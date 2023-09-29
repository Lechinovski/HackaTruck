import SwiftUI

struct Pesquisar: View {
    @State private var textValue = "0"
    @State private var text = ""
    @StateObject var Api = api()
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
                            ForEach(filteredPlayers, id: \.self) {jogador in
                                NavigationLink(destination: JogadorClicou(j: jogador)){
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: jogador.photoJogador!)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 70, height: 70)
                                        
                                        Text(jogador.nickJogador!)
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
                    .searchable(text: $text, prompt: "Jogadores")
                    .foregroundColor(Color.white)
                }
            }
        }
        
        
    }
    
    var filteredPlayers: [Jogador] {
        if text.isEmpty {
            return Api.jogadores
        } else {
            return Api.jogadores.filter { $0.nickJogador!.localizedCaseInsensitiveContains(text) }
        }
    }
    
}
