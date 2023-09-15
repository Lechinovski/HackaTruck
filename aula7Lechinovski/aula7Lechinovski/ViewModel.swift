import Foundation

struct Estacionamento : Decodable, Hashable {
    let carro : [Course]
}
struct Course: Hashable, Decodable{
    
    let foto: String?
    let marca: String?
    let modelo: String?
    let ano: String?
    let cor: String?
    let preco: String?
    let endereco: String?
    let vaga: Int?
}

class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/lechinovskiREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.courses = parsed[0].carro
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

