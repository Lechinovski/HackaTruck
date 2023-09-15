import SwiftUI

struct details: View {
    var information: Course
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: information.foto!)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 450, height: 250)
            Text("Marca: " + information.marca!)
            Text("Modelo: " + information.modelo!)
            Text("Ano: " + information.ano!)
            Text("Cor: " + information.cor!)
            Text("preco: R$" + information.preco!)
            Text("Vaga que se encontra: " + String(information.vaga!))
            
            
        }
    }
}
