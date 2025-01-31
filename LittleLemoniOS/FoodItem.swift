
import SwiftUI

struct FoodItem: View {
    
    let dish: MenuItem
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 16).weight(.heavy))
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(dish.descr ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 14))
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                Text("$" + (dish.price ?? ""))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 14).weight(.medium))
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}
