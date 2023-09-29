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
                        NavigationLink(destination: PesquisarGames()){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 50)
                    ScrollView(showsIndicators: false) {
                        
                        AsyncImage(url: URL(string: "\(j.photoJogos!)")) { image in
                            image.resizable()
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                    
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
                        
                    }
                }
                .onAppear(){
                    Api.fetch()
                }
            }
        }
    }
}

