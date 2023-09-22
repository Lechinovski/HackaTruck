import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(systemName: "gamecontroller.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                
                Text("eSportHub")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
