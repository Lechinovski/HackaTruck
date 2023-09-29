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
                            .padding(10)
                        
                        Text("Informações")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(20)
                        
                        HStack{
                            Text("Nome:")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(j.nameJogador!)
                                .foregroundColor(Color.white)
                            
                        }
                        
                        HStack{
                            
                            Text("País:")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(j.countryJogador!)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            AsyncImage(url: URL(string: j.countryPhotoJogador!)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 20, height: 20)
                            
                        }
                        
                        HStack{
                            
                            Text("Time:")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(j.teamJogador!)
                                .foregroundColor(Color.white)
                            
                            AsyncImage(url: URL(string: j.teamPhotoJogador!)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 20, height: 20)
                            
                        }
                        
                        HStack{
                            
                            Text("Aniversario:")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text(j.birthdayJogador!)
                                .foregroundColor(Color.white)

                            
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

