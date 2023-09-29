import SwiftUI

struct Jogador: Hashable, Decodable{
    
    let nickJogador: String?
    let nameJogador: String?
    let countryJogador: String?
    let countryPhotoJogador: String?
    let birthdayJogador: String?
    let photoJogador: String?
    let teamJogador: String?
    let teamPhotoJogador: String?
}

class api: ObservableObject{
    @Published var jogadores: [Jogador] = []
    func fetch(){
        guard let url = URL(string: "http://192.168.128.243:1880/eSportHubJogadorREAD") else {
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


struct Jogo: Hashable, Decodable{
    
    let nameJogos: String?
    let desenvolvedoraJogos: String?
    let descricaoJogos: String?
    let photoJogos: String?
}

class api2: ObservableObject{
    @Published var jogos: [Jogo] = []
    func fetch(){
        guard let url = URL(string: "http://192.168.128.243:1880/eSportHubJogosREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Jogo].self, from: data)
                
                DispatchQueue.main.async {
                    self?.jogos = parsed
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

struct Time: Hashable, Decodable{
    
    let nomeTime: String?
    let photoTime: String?
    let descricao: String?
}

class api3: ObservableObject{
    @Published var times: [Time] = []
    func fetch(){
        guard let url = URL(string: "http://192.168.128.243:1880/eSportHubTimesREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Time].self, from: data)
                
                DispatchQueue.main.async {
                    self?.times = parsed
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

struct Torneio: Hashable, Decodable{
    
    let nomeCampeonato: String?
    let imagemCampeonato: String?
    let logoCampeonato: String?
    let descricaoCampeonato: String?
    let logoDoJogo: String?
}

class api4: ObservableObject{
    @Published var torneios: [Torneio] = []
    func fetch(){
        guard let url = URL(string: "http://192.168.128.243:1880/eSportHubTorneiosREAD") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Torneio].self, from: data)
                
                DispatchQueue.main.async {
                    self?.torneios = parsed
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
