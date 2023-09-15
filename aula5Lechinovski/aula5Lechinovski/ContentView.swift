import SwiftUI
import MapKit


struct location: Identifiable{
    let id = UUID()
    var name: String
    let coordinate: CLLocationCoordinate2D
    var flag: String
    let description: String
}

struct ContentView: View {
    @State var paises = false
    @State var sheet = false
    @State var nomePaises: location = location(name: "Mundo", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), flag: "https://static.significados.com.br/flags/br.svg", description: "1")
    @State var bandeiraPaises: location = location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.80006852902695, longitude: -47.90195330863831), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Flag_of_the_United_Nations.svg/2560px-Flag_of_the_United_Nations.svg.png", description: "1")
    @State private var region = MKCoordinateRegion(
        
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50)
    )
    
    let locations = [
        location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.80006852902695, longitude: -47.90195330863831), flag: "https://static.significados.com.br/foto/brasil-6f.jpg", description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba. Capital: Brasília"),
        location(name: "Estados Unidos", coordinate: CLLocationCoordinate2D(latitude: 38.90548766367908, longitude: -77.06092034510006), flag: "https://static.significados.com.br/foto/estados-unidos.jpg", description: "1"),
        location(name: "Espanha", coordinate: CLLocationCoordinate2D(latitude: 40.41504807069873, longitude: -3.700092092754783), flag: "https://static.significados.com.br/foto/espanha.jpg", description: "1"),
        location(name: "Itália", coordinate: CLLocationCoordinate2D(latitude: 41.908215210179456, longitude: 12.556706101935958), flag: "https://static.significados.com.br/foto/bandeira-italia-0-cke.jpg", description: "1"),
        location(name: "México", coordinate: CLLocationCoordinate2D(latitude: 19.42464226316567, longitude: -99.13993461459049), flag: "https://static.significados.com.br/foto/mexico.jpg", description: "1"),
        location(name: "Alemanha", coordinate: CLLocationCoordinate2D(latitude: 52.52446475347402, longitude: 13.436865610484801), flag: "https://static.significados.com.br/foto/alemanha.jpg", description: "1"),
        location(name: "Inglaterra", coordinate: CLLocationCoordinate2D(latitude: 51.494112536462026, longitude: -0.09195371363814195), flag: "https://static.significados.com.br/foto/inglaterra.jpg", description: "1")
    ]
    
    @State var aux: location = location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -15.80006852902695, longitude: -47.90195330863831), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Flag_of_the_United_Nations.svg/2560px-Flag_of_the_United_Nations.svg.png", description: "")
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, annotationItems: locations){ p in
                MapAnnotation(coordinate: p.coordinate) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            aux = p
                            sheet.toggle()
                        }
                        .sheet(isPresented: $sheet){
                            Text(aux.name)
                                .font(.title)
                                .fontWeight(.black)
                                
                            AsyncImage(url: URL(string: "\(bandeiraPaises.flag)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 140)
                            Text(aux.description)
                        }
                }
            }
            .frame(width: 400,height: 600)
            VStack{
                Text("capitals of the world")
                    .font(.title)
                    .fontWeight(.black)
                Text("\(nomePaises.name)")
                AsyncImage(url: URL(string: "\(bandeiraPaises.flag)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 40)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(locations) { location in
                            Button("\(location.name)"){
                                paises.toggle()
                                region.center = location.coordinate
                                region.span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
                                nomePaises.name = location.name
                                bandeiraPaises.flag = location.flag
                                
                                
                            }
                            
                            .foregroundColor(.white)
                            .frame(width: 90,height: 30)
                            .background(Color.blue.cornerRadius(50))
                        }
                    }
                }
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
