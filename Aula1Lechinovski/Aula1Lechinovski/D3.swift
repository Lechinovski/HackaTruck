import SwiftUI

struct D3: View {
    @State var name: String = ""
    @State private var showAlert = false
    var body: some View {
        ZStack{
            Image("caminhao")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.2)
                .blur(radius: 2)
            VStack{
                Text("Bem Vindo, \(name)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                TextField("Digite seu nome aqui", text: $name)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 100)
                        .shadow(radius: 10)
                    Image("truck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 100)
                        .shadow(radius: 10)
                }
                Spacer()
                
                Button("Entrar") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("ALERTA!"),
                        message: Text("Você ira iniciar o desafio da aula agora"),
                        dismissButton: .default(Text("Vamos lá!"))
                    )
                }
            }
        }
    }
}

struct D3_Previews: PreviewProvider {
    static var previews: some View {
        D3()
    }
}
