import SwiftUI

struct D2Modo2_1: View {
    @State var name1: String
    var body: some View {
        Text("Volte \(name1)")
    }
}

struct D2Modo2_1_Previews: PreviewProvider {
    
    @State static var name: String = "" 
    static var previews: some View {
        D2Modo2_1(name1: "")
    }
}
