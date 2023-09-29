import SwiftUI

struct Calendario : Identifiable {
    let id = UUID()
    let torneio: String
    let datajogo: String
    let nome: String
    let img: String
    let nome2: String
    let img2: String
}


struct Home: View {
    @State var data = [ Calendario(torneio: "VCT Game Changers", datajogo: "27/09/2023", nome:"Loud", img:"https://logodownload.org/wp-content/uploads/2020/07/loud-logo-0.png", nome2: "mibr", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "27/09/2023", nome:"Complexity", img:"https://liquipedia.net/commons/images/0/03/Heroic_2023_allmode.png", nome2: "Monte", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "27/09/2023", nome:"Complexity", img:"https://upload.wikimedia.org/wikipedia/ru/thumb/d/d6/NIP_Logo.svg/800px-NIP_Logo.svg.png", nome2: "Vitality", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "27/09/2023", nome:"Natus Vincere", img:"https://liquipedia.net/commons/images/0/03/Heroic_2023_allmode.png", nome2: "Eternal Fire", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "28/09/2023", nome:"G2", img:"https://static.draft5.gg/teams/35-G2-c1046c45f6.png", nome2: "Mouz", img2: "https://cdn.escharts.com/uploads/public/617/c53/d55/617c53d55e268945798052.png"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "28/09/2023", nome:"Ence", img:"https://liquipedia.net/commons/images/b/ba/ENCE_2020_full_lightmode.png", nome2: "Movistar Riders", img2: "https://liquipedia.net/commons/images/b/ba/Movistar_Riders_2023_full_allmode.png"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "28/09/2023", nome:"Furia", img:"https://gamerlegion.gg/wp-content/uploads/2023/04/Core-Logo-White-Black-III.png", nome2: "Mibr", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "29/09/2023", nome:"Heroic", img:"https://static.draft5.gg/teams/35-G2-c1046c45f6.png", nome2: "Astralis", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "29/09/2023", nome:"FaZe", img:"https://liquipedia.net/commons/images/b/ba/ENCE_2020_full_lightmode.png", nome2: "Cloud9", img2: "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/71/Isurus_GamingOldlogo.png/revision/latest?cb=20181108014745"),
                        Calendario(torneio: "CS:GO Tour", datajogo: "29/09/2023", nome:"GamerLegion", img:"https://gamerlegion.gg/wp-content/uploads/2023/04/Core-Logo-White-Black-III.png", nome2: "Ninjas in Pyjamas", img2: "https://upload.wikimedia.org/wikipedia/ru/thumb/d/d6/NIP_Logo.svg/800px-NIP_Logo.svg.png")]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size: 40))
                        Text("eSportsHub")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                        NavigationLink(destination: Pesquisar()){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.white)
                        }
                    }
                    Spacer()
                    VStack {
                        Spacer()
                        Text("Próximas partidas")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        ScrollView{
                            ForEach(data) {index in
                                VStack{
                                    Text("\(index.datajogo)")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.title2)
                                    Text("\(index.torneio)")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.title2)
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: "\(index.img)"))
                                        { image in image.resizable() } placeholder: { Color.gray } .frame(width: 80, height: 80)
                                        Spacer()
                                        Text("vs")
                                            .foregroundColor(.white)
                                            .font(.title)
                                        Spacer()
                                        AsyncImage(url: URL(string: "\(index.img2)"))
                                        { image in image.resizable() } placeholder: { Color.gray } .frame(width: 80, height: 80)
                                    }.padding(30.0)
                                        .background(.gray)
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .cornerRadius(10)
                                        .padding(.vertical/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                    .padding(.all, 1.0)
                    
                }
                
                
            }
        }
    }
}
