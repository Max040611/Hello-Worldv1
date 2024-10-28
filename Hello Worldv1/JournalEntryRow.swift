import SwiftUI

struct JournalEntryRow: View {
    let entry: JournalEntry
    var toggleBookmark: () -> Void // Callback to toggle bookmark

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "#D4C8FF"))
                
                Text(entry.date, style: .date)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Text(entry.content)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .padding(.top, 4)
            }
            
            Spacer()
            
            // Bookmark icon
            Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(Color(hex: "#D4C8FF"))
                .onTapGesture {
                    toggleBookmark() // Toggle bookmark when tapped
                }
        }
        .padding()
        .background(Color(hex: "#1F1F22") ?? .black)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        .padding(.horizontal, 16)
    }
}

#Preview {
    JournalEntryRow(entry: JournalEntry(title: "Sample Title", date: Date(), content: "Sample content")) {
        // Preview action
    }
}
