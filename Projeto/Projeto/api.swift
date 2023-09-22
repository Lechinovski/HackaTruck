import SwiftUI

struct Jogador: Hashable, Decodable{
    
    let nick: String?
    let name: String?
    let country: String?
    let country_photo: String?
    let birthday: String?
    let photo: String?
    let team: String?
    let team_photo: String?
}

class api: ObservableObject{
    @Published var jogadores: [Jogador] = []
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/eSportHubREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Jogador].self, from: data)
                
                DispatchQueue.main.async {
                    self?.jogadores = parsed
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
