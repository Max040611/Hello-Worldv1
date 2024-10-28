import SwiftUI

struct MainPageView: View {
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    @Binding var showNewEntrySheet: Bool
    @Binding var showDropdownMenu: Bool
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                if showSearchBar {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#202022") ?? .black)
                            .frame(height: 40)
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 20)
                            
                            TextField("Search", text: $searchText)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            if !searchText.isEmpty {
                                Button(action: { searchText = "" }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.top, 10)
                }

                // Journal entries list
                List {
                    ForEach(viewModel.journalEntries) { entry in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(entry.title)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color(hex: "D4C8FF"))

                                Text(entry.date, style: .date)
                                    .font(.footnote)
                                    .foregroundColor(Color(hex: "9F9F9F"))

                                Text(entry.content)
                                    .font(.subheadline)
                                    .foregroundColor(Color(hex: "FFFFFF"))
                                    .lineLimit(3)
                            }
                            
                            Spacer()
                            
                            // Bookmark toggle
                            Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                                .foregroundColor(Color(hex: "#D4C8FF"))
                                .onTapGesture {
                                    viewModel.toggleBookmark(for: entry)
                                }
                        }
                        .padding()
                        .background(Color(hex: "171719"))
                        .cornerRadius(14)
                        .padding(.vertical, 5)
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .leading) {
                            Button("Edit") {
                                viewModel.editJournal(entry: entry, newTitle: "Updated Title", newContent: "Updated Content")
                            }
                            .tint(Color(hex: "#7F81FF"))
                        }
                        .swipeActions(edge: .trailing) {
                            Button("Delete") {
                                if let index = viewModel.journalEntries.firstIndex(where: { $0.id == entry.id }) {
                                    viewModel.deleteJournalEntry(at: IndexSet(integer: index))
                                }
                            }
                            .tint(.red)
                        }
                    }
                    .onDelete(perform: viewModel.deleteJournalEntry)
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
                
                Spacer()
                
                // Plus button to add a new entry
                Button(action: { showNewEntrySheet = true }) {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "#1F1F22") ?? .black)
                            .frame(width: 50, height: 50)
                        Image(systemName: "plus")
                            .foregroundColor(Color(hex: "#D4C8FF"))
                    }
                }
                .padding(.top, 16)
                .sheet(isPresented: $showNewEntrySheet) {
                    NewJournalEntryView(viewModel: viewModel)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
