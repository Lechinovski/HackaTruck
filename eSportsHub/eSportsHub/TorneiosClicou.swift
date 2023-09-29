import SwiftUI
struct TorneioClicou: View {
    var t : Torneio
    @StateObject var Api = api4()
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
                        NavigationLink(destination: PesquisarTorneios()){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 50)
                    ScrollView(showsIndicators: false) {
                        AsyncImage(url: URL(string: t.imagemCampeonato!)) { image in
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
                        
                        AsyncImage(url: URL(string: t.logoDoJogo!)) { image in
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
                        Text(t.nomeCampeonato!)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(20)
                        
           
                        
                        Text(t.descricaoCampeonato!)
                            .foregroundColor(Color.white)
                            .font(.headline)
                        
                        
                    }
                }
                .onAppear(){
                    Api.fetch()
                }
            }
        }
    }
}

