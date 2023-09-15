import SwiftUI

struct D1Photos: View {
    
    private var imageList = [
    "hare.fill",
    "tortoise.fill",
    "lizard.fill",
    "bird.fill",
    "ant.fill",
    "ladybug.fill",
    "fish.fill",
    ]
    var body: some View {
        
        ScrollView(showsIndicators: false){
            ForEach(imageList, id: \.self){ index in
                Image(systemName: "\(index)")
                    .font(.system(size: 150))
                    .padding()
            }
        }
    }
}

struct D1Photos_Previews: PreviewProvider {
    static var previews: some View {
        D1Photos()
    }
}
