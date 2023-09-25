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
                        Image(systemName: "magnifyingglass")
                            .colorInvert()
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
                                        
                                        SVGImage(url: URL(string: jogo.photoJogos!)!, size: CGSize(width: 125,height: 125))
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
