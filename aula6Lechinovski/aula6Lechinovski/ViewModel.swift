import Foundation

struct Course: Hashable, Decodable{
    let title: String
    let thumbnail: String
    let short_description: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let release_date: String
}

class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    func fetch(){
        guard let url = URL(string: "https://www.freetogame.com/api/games") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self?.courses = parsed
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

