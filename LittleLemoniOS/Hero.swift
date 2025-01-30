import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(Font.custom("Al Firat Regular", size: 40).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("My Chicago")
                        .foregroundColor(.white)
                        .font(Font.custom("Markazi Text Medium", size: 32))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
                    .font(Font.custom("Al Firat Regular", size: 16).weight(.medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("Hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
    }
}
 
