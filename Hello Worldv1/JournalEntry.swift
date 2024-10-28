import SwiftUI

struct JournalEntry: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var content: String
    var isBookmarked: Bool = false // Add a bookmark property
}

class JournalViewModel: ObservableObject {
    @Published var journalEntries: [JournalEntry] = []
    
    func addJournalEntry(title: String, content: String) {
        let newEntry = JournalEntry(title: title, date: Date(), content: content)
        journalEntries.insert(newEntry, at: 0)
    }
    
    func deleteJournalEntry(at offsets: IndexSet) {
        journalEntries.remove(atOffsets: offsets)
    }
    
    func editJournal(entry: JournalEntry, newTitle: String, newContent: String) {
        if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
            journalEntries[index].title = newTitle
            journalEntries[index].content = newContent
        }
    }

    func toggleBookmark(for entry: JournalEntry) {
        if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
            journalEntries[index].isBookmarked.toggle()
        }
    }
}
