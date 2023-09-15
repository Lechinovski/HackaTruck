import SwiftUI

struct D1Home: View {
    var body: some View {
            VStack{
                List(1...20, id: \.self){
                        Text("Item \($0)")
                }
            }
    }
}

struct D1Home_Previews: PreviewProvider {
    static var previews: some View {
        D1Home()
    }
}
