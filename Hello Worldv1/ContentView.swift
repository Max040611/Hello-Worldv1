import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("add tab later")
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(hex: "#1F1F22") ?? .black)
                        .frame(width: 30, height: 30)
                        .padding(.top, 80)
                        .padding(.leading, 300)

                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .frame(width: 15, height: 12)
                        .foregroundColor(Color(hex: "#D4C8FF"))
                        .padding(.top, 80)
                        .padding(.leading, -30)
                }
                
                Button(action: {
                    print("add 2nd tab later")
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(hex: "#1F1F22") ?? .black)
                        .frame(width: 30, height: 30)
                        .padding(.top, 80)

                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(hex: "#D4C8FF"))
                        .padding(.top, 80)
                        .padding(.leading, -30)
                        
                }
            }
    

            Text("Journal")
                .font(.system(size: 34))
                .foregroundColor(.white)
                .bold()
                .position(x: 75, y: 20)

            Image("Journal1")
                .imageScale(.large)
                .position(x: 205, y: 80)

            Text("Begin Your Journal")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "#D4C8FF"))
                .bold()
                .position(x: 205, y: -25)

            Text("Craft your personal diary, tap the \n plus icon to begin")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .position(x: 205, y: -165)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
