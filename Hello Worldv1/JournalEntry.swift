import SwiftUI

// MARK: - Model
struct JournalEntry: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var content: String
}

// MARK: - ViewModel
class JournalViewModel: ObservableObject {
    @Published var journalEntries: [JournalEntry] = []
    
    func addJournalEntry(title: String, content: String) {
        let newEntry = JournalEntry(title: title, date: Date(), content: content)
        journalEntries.insert(newEntry, at: 0)
    }
}
#Preview {
    ContentView()
}
