import SwiftUI

struct JournalEntryRow: View {
    let entry: JournalEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entry.title)
                .font(.headline)
                .foregroundColor(Color(hex: "#D4C8FF"))
            Text(entry.date, style: .date)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(entry.content)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(3)
        }
        .padding()
        .background(Color(hex: "#1F1F22") ?? .black)
        .cornerRadius(8)
    }
}

#Preview {
    JournalEntryRow(entry: JournalEntry(title: "Sample Title", date: Date(), content: "Sample content"))
}
