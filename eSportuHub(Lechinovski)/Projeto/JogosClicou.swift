import SwiftUI

struct JogosClicou: View {
    var j : Jogo
    @StateObject var Api = api()
    var body: some View {
        NavigationStack {
            ZStack{
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
                    Spacer(minLength: 50)
                    ScrollView(showsIndicators: false) {
                        SVGImage(url: URL(string: j.photoJogos!)!, size: CGSize(width: 125,height: 125))
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .background(Circle().fill(.gray))
                    Text(j.nameJogos!)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(j.desenvolvedoraJogos!)
                        .foregroundColor(Color.white)
                        .font(.title)
                    
                    Spacer()
                    
                    Text(j.descricaoJogos!)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Text("Top Players")
                        .foregroundColor(Color.white)
                    
                    
                        ForEach(Api.jogadores, id: \.self) { jogador in
                            NavigationLink(destination:  JogadorClicou()) {
                                HStack {
                                    SVGImage(url: URL(string: jogador.photoJogador!)!, size: CGSize(width: 125,height: 125))
                                    .frame(width: 70, height: 70)
                                    
                                    Text(jogador.nameJogador!)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .frame(width: 270, height: 50)
                                        .foregroundColor(Color.white)
                                }
                                .background(Color.gray)
                                .cornerRadius(20)
                                .padding(3)
                            }
                        }
                        
                    }
                }
                .onAppear(){
                    Api.fetch()
                }
            }
        }
    }
}
