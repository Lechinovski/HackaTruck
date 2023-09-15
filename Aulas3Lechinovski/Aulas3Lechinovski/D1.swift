import SwiftUI

struct D1: View {
    var body: some View {
            VStack{
                TabView {
                    D1Home()
                        .badge("!")
                        .tabItem{
                            Label("Home", systemImage: "homekit")
                        }
                    D1Search()
                        .tabItem{
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    D1Photos()
                        .tabItem{
                            Label("Photos", systemImage: "photo")
                        }
                    D1Messages()
                        .badge(5)
                        .tabItem{
                            Label("Messages", systemImage: "message.fill")
                        }
                    D1Profile()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle.fill")
                        }
                }
            }
    }
}

struct D1_Previews: PreviewProvider {
    static var previews: some View {
        D1()
    }
}
