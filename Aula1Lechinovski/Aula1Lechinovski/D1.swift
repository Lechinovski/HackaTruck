import SwiftUI

struct D1: View {
    var body: some View {
        VStack() {
            Image("caminhao")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("HackaTruck")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.blue)
            HStack {
                Text("Maker")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(Color.yellow)
                
                Text("Space")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(Color.red)
            }
            
        }
        .padding()
    }
}

struct D1_Previews: PreviewProvider {
    static var previews: some View {
        D1()
    }
}
