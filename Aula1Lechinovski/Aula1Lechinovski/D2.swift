import SwiftUI

struct D2: View {
    var body: some View {
        VStack() {
            Image("caminhao")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: -30)
                .padding(-20)
            
            Image("caminhao")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .offset(y: 40)
                .overlay{
                    Circle().stroke(.black, lineWidth: 5)
                        .offset(y: 40)
                }
                .shadow(radius: 20)
            
            Text("HackaTruck")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.blue)
                .offset(y: -140)
            
            Rectangle()
                .offset(y: 50)
                .frame(maxHeight: 100)
                .frame(maxWidth: 250)
            HStack {
                Text("Maker")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(Color.yellow)
                    .offset(y: -30)
                
                Text("Space")
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(Color.red)
                    .offset(y: -30)
            }
            
        }
        .padding()
    }
}

struct D2_Previews: PreviewProvider {
    static var previews: some View {
        D2()
    }
}
