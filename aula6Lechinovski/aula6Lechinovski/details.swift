import SwiftUI

struct details: View {
    var information: Course
    var body: some View {
        
        VStack{
            Text(information.developer)
            Text(information.short_description)
        }
    }
}
