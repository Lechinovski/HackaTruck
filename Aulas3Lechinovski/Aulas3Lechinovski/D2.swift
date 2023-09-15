import SwiftUI

struct D2: View {
    @State private var Modo3 = false
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink("Modo 1", destination: D2Modo1())
                NavigationLink("Modo 2", destination: D2Modo2())
                
                Button(action: {
                    Modo3.toggle()
                }) {
                    Text("Modo 3")
                }
                .sheet(isPresented: $Modo3,
                       onDismiss: didDismiss) {
                    VStack {
                        Text("Edilson")
                        Text("Almeida")
                        Text("hackatruck.com.br")
                        Text("edilsonalmeida__")
                        
                    }
                }
            }
        }
        
    }
    func didDismiss() {
    }
    
    struct D2_Previews: PreviewProvider {
        static var previews: some View {
            D2()
        }
    }
}
