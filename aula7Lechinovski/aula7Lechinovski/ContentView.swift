import SwiftUI

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var searchText = ""
    @State private var searchScope = SearchScope.inbox
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredMessages, id: \.self) { course in
                    NavigationLink(destination: details(information: course)) {
                        HStack{
                            Text(course.modelo!)
                                .bold()
                        }
                        .padding(3)
                    }
                }
            }
            .navigationTitle("WebMotors")
            .searchable(text: $searchText)
            .searchScopes($searchScope) {
                ForEach(SearchScope.allCases, id: \.self) { scope in
                    Text(scope.rawValue.capitalized)
                }
            }

        }
        .onAppear{
            viewModel.fetch()
        }
    }
    
    var filteredMessages: [Course] {
        if searchText.isEmpty {
            return viewModel.courses
        } else {
            return viewModel.courses.filter { $0.modelo!.localizedCaseInsensitiveContains(searchText) }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
