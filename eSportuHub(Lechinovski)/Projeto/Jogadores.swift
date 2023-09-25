import SwiftUI

struct Jogadores: View {
    //var jogador : Jogador
    @StateObject var Api = api()
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size: 40))
                        Text("eSportsHub")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .colorInvert()
                    }
                    Spacer(minLength: 20)
                    Text("Jogadores")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    ScrollView {
                        VStack{
                            
                            ForEach(Api.jogadores, id: \.self) {jogador in
                                NavigationLink(destination: JogadorClicou()){
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
                            
                        }.onAppear{
                            Api.fetch()
                        }
                    }
                    
                }
                
            }
            
        }
    }
}
