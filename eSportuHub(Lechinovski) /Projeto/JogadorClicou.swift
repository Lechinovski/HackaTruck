import SwiftUI
struct JogadorClicou: View {
    var j : Jogador
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
                        NavigationLink(destination: Pesquisar()){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 50)
                    ScrollView(showsIndicators: false) {
                        AsyncImage(url: URL(string: j.photoJogador!)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .background(Circle().fill(.gray))
                        
                        AsyncImage(url: URL(string: j.teamPhotoJogador!)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .background(Circle().fill(.gray))
                        .offset(x: 50, y: -50)
                        Text(j.nickJogador!)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(j.nameJogador!)
                            .foregroundColor(Color.white)
                            .font(.title)
                        
                        Spacer()
                        
                        Text(j.teamJogador!)
                            .foregroundColor(Color.white)
                        
                    }
                }
                .onAppear(){
                    Api.fetch()
                }
            }
        }
    }
}
