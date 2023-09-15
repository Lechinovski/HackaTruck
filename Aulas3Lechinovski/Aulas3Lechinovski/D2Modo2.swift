import SwiftUI

struct D2Modo2: View {
    @State var name: String = ""
    var body: some View {
        
        NavigationStack {
            VStack{
                TextField("Name", text: $name)
                
                Text("Estamos percorrendo um caminho \(name)")
                
                NavigationLink("Acessar Tela", destination: D2Modo2_1(name1: name))
            }
        }
        
    }
}

struct D2Modo2_Previews: PreviewProvider {
    static var previews: some View {
        D2Modo2()
    }
}
