import SwiftUI
struct TimesClicou: View {
    var t : Time
    @StateObject var Api = api3()
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
                        AsyncImage(url: URL(string: t.photoTime!)) { image in
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
                        Text(t.nomeTime!)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                    }
                }
                .onAppear(){
                    Api.fetch()
                }
            }
        }
    }
}
