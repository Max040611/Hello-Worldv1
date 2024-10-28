import SwiftUI

struct NewJournalEntryView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var journalText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Title", text: $title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                
                Text(Date(), style: .date)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(hex: "#202022") ?? .black)
                        .padding(.horizontal, 16)
                        .frame(height: 200)

                    TextField("Type your Journal...", text: $journalText, axis: .vertical)

                       .font(.system(size: 18))
                       .foregroundColor(.white)
                       .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                        .background(Color.clear)
                }
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { presentationMode.wrappedValue.dismiss() }
                        .foregroundColor(Color(hex: "#D4C8FF"))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addJournalEntry(title: title, content: journalText)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color(hex: "#D4C8FF"))
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
