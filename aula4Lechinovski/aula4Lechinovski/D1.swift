import SwiftUI

struct Song: Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

struct D1: View {
    @State var arrayMusica: [Song] = [
        Song(id: 1, name: "Corinthians Minha Vida", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 2, name: "Sou Coringão Sou Coringão", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 3, name: "Onde Você São Paulo", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 4, name: "Ai Ai Ai Está Chegando A Hora", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 5, name: "Domingo Eu Vou Lá No Morumbi", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 6, name: "A Maré Tá Cheia", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 7, name: "Le Leleô Corinthians", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5"),
        Song(id: 8, name: "Vou Acompanhar", artist: "Corinthian F.C.", capa: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5")
        
        
        
        
        
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .topLeading, endPoint: .leading)
                    .ignoresSafeArea()
                VStack{
                    ScrollView(showsIndicators: false){
                        Image("capa")
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Text("Fãs Do Corinthian F.C.")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 390, height: 40 ,alignment: .leading)
                        
                        HStack{
                            Image("capa")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                                .clipShape(Circle())
                            
                            Text("Fãs Do Corinthian F.C.")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 340, alignment: .leading)
                        }
                        
                        VStack{
                            Text("29,3 mil ouvintes mensais")
                                .foregroundColor(Color.gray)
                                .frame(width: 380, alignment: .leading)
                                .font(.system(size: 10))
                            
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 30))
                                .frame(width: 340, height: 1, alignment: .trailing)
                                .foregroundColor(.green)
                        }
                        
                        VStack{
                            Text("Popular")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 380, height: 50,alignment: .leading)
                            
                        }
                        
                        VStack{
                            ForEach(Array(arrayMusica.enumerated()), id: \.offset) {index, item in
                                NavigationLink(destination: D1play(musica: item)){
                                    
                                    HStack{
                                        Text("\(index+1)")
                                            .foregroundColor(.white)
                                            .frame(width: 30)
                                        AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 50)
                                        VStack{
                                            Text(item.name)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .frame(width: 290,height: 30 ,alignment: .leading)
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.white)
                                                .frame(width: 300,alignment: .trailing)
                                            Text(item.artist)
                                                .foregroundColor(.white)
                                                .frame(width: 290,height: 10 ,alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack{
                            Text("Mais que talvez você goste")
                                .font(.body)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .frame(height: 80)
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 200, height: 200)
                                    AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 200, height: 200)
                                    AsyncImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b2738553ee03001e98ce946593f5")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 200, height: 200)
                                    
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        D1()
    }
}
