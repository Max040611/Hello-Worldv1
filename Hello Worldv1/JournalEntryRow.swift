import SwiftUI

struct JournalEntryRow: View {
    let entry: JournalEntry

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "#D4C8FF"))

                Text(entry.date, style: .date)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "#9F9F9F"))

                Text(entry.content)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .padding(.top, 4)
            }
            Spacer()
            Image(systemName: "bookmark")
                .foregroundColor(Color(hex: "#D4C8FF"))
                .frame(width: 25, height: 29)
        }
        .padding()
        .background(Color(hex: "#1F1F22") ?? .black)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
#Preview {
    ContentView()
}
