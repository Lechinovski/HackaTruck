import SwiftUI

struct Jogadores: View {
    //var jogador : Jogador
    @StateObject var Api = api()
    var body: some View {
        VStack{
            Text("Jogadores")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            NavigationStack{
                ScrollView {
                    VStack{
                        
                        ForEach(Api.jogadores, id: \.self) {jogador in
                            NavigationLink(destination: JogadorClicou()){
                                HStack{
                                    
                                    AsyncImage(url: URL(string: jogador.photo!)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 125, height: 125)
                                    
                                    Text(jogador.nick!)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .frame(width: 200, height: 50)
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
