import SwiftUI

struct D1Search: View {
    @State var Search: String = ""
    var body: some View {
            VStack{
                Text("SEARCH")
                    .font(.largeTitle)
                    .fontWeight(.black)
                TextField("Search", text: $Search)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.gray.cornerRadius(30))
                    .frame(width: 350, height: 50)
                Spacer()
            }

    }
}

struct D1Search_Previews: PreviewProvider {
    static var previews: some View {
        D1Search()
    }
}
