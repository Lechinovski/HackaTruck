import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    NavigationLink(destination: details(information: course)) { 
                        HStack{
                            AsyncImage(url: URL(string: "\(course.thumbnail)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 130, height: 70)
                            Text(course.title)
                                .bold()
                        }
                        .padding(3)
                    }
                }
            }
            .navigationTitle("Free Games")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
