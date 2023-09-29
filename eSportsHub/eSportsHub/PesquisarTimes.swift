import SwiftUI

struct PesquisarTimes: View {
    @State private var textValue = "0"
    @State private var text = ""
    @StateObject var Api = api3()
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
                            ForEach(filteredPlayers, id: \.self) {times in
                                NavigationLink(destination: TimesClicou(t: times)){
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: times.photoTime!)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 70, height: 70)
                                        
                                        Text(times.nomeTime!)
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
                    .searchable(text: $text, prompt: "Jogadores")
                    .foregroundColor(Color.white)
                }
            }
        }
        
        
    }
    
    var filteredPlayers: [Time] {
        if text.isEmpty {
            return Api.times
        } else {
            return Api.times.filter { $0.nomeTime!.localizedCaseInsensitiveContains(text) }
        }
    }
    
}



