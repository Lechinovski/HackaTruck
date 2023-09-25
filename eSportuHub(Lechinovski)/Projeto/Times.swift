import SwiftUI

struct Times: View {
    //var jogador : Jogador
    @StateObject var Api = api3()
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
                    Text("Times")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    ScrollView {
                        VStack{
                            
                            ForEach(Api.times, id: \.self) {time in
                                NavigationLink(destination: TimesClicou()){
                                    HStack{
                                        
                                        SVGImage(url: URL(string: time.photoTime!)!, size: CGSize(width: 125,height: 125))
                                            .frame(width: 70, height: 70)
                                        
                                        Text(time.nomeTime!)
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
