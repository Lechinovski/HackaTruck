import SwiftUI

struct D1play: View {
    var musica: Song
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .topLeading, endPoint: .leading)
                .ignoresSafeArea()
            VStack{
                Spacer()
                
                AsyncImage(url: URL(string: musica.capa)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
                Text(musica.name)
                    .foregroundColor(.white)
                Text(musica.artist)
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Image(systemName: "shuffle")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "play.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}
