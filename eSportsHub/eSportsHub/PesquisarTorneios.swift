import SwiftUI

struct PesquisarTorneios: View {
    @State private var textValue = "0"
    @State private var text = ""
    @StateObject var Api = api4()
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
                            ForEach(filteredPlayers, id: \.self) {torneio in
                                NavigationLink(destination: TorneioClicou(t : torneio)){
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: torneio.imagemCampeonato!)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 70, height: 70)
                                        
                                        Text(torneio.nomeCampeonato!)
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
                    .searchable(text: $text, prompt: "Torneios")
                    .foregroundColor(Color.white)
                }
            }
        }
        
        
    }
    
    var filteredPlayers: [Torneio] {
        if text.isEmpty {
            return Api.torneios
        } else {
            return Api.torneios.filter { $0.nomeCampeonato!.localizedCaseInsensitiveContains(text) }
        }
    }
    
}
