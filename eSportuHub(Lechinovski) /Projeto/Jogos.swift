import SwiftUI

struct Jogos: View {
    @StateObject var Api = api2()
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
                        NavigationLink(destination: Pesquisar()){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 20)
                    Text("Jogos")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    
                    
                    ScrollView {
                        VStack{
                            
                            ForEach(Api.jogos, id: \.self) {jogo in
                                NavigationLink(destination: JogosClicou(j: jogo)){
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: "\(jogo.photoJogos!)")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 70, height: 70)
                                        
                                        Text(jogo.nameJogos!)
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
