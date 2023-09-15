import SwiftUI

struct D1: View {
    @State var pesoS: String = ""
    @State var alturaS: String = ""
    @State var imc: String = ""
    @State var cor: Color = .white
    var body: some View {
        VStack{
            Text("Calculadora de IMC")
                .font(.title)
            
            TextField("Seu Peso", text: $pesoS)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.white.cornerRadius(10))
                .frame(width: 350, height: 50)
            
            TextField("Sua altura", text: $alturaS)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.white.cornerRadius(10))
                .frame(width: 350, height: 90)
            
            Button("Calcular") {
                if let pesoD = Double(pesoS), let alturaD = Double(alturaS){
                    let imcCalc = pesoD / (alturaD * alturaD)
                    
                    if imcCalc <= 18.5 {
                        imc = "Baixo peso"
                        cor = Color("Baixopeso")
                    } else if imcCalc < 24.99 {
                        imc = "Normal"
                        cor = Color("Normal")
                    } else if imcCalc < 29.99 {
                        imc = "Sobrepeso"
                        cor = Color("Sobrepeso")
                    } else {
                        imc = "Obesidade"
                        cor = Color("Obesidade")
                    }
                }
                
                
            }
            .padding()
            .background(Color.blue.cornerRadius(10))
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 50)
            
            Spacer()
            VStack{
                Text("\(imc)")
                    .font(.title)
                    .padding()
            }
            Spacer()
            VStack{
                Image("tabela")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 200)
            }
        }
        .background(cor)
    }
}

struct D1_Previews: PreviewProvider {
    static var previews: some View {
        D1()
    }
}

