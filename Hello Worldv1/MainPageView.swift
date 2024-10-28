import SwiftUI

struct MainPageView: View {
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    @Binding var showNewEntrySheet: Bool
    @Binding var showDropdownMenu: Bool
    @ObservedObject var viewModel = JournalViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if showSearchBar {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "#202022") ?? .black)
                            .frame(height: 40)
                            .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
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

                List(viewModel.journalEntries) { entry in
                    JournalEntryRow(entry: entry)
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
                
                Spacer()
                
                Button(action: { showNewEntrySheet = true }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color(hex: "#1F1F22") ?? .black)
                        .clipShape(Circle())
                }
                .foregroundColor(Color(hex: "#D4C8FF"))
                .padding(.top, 200)
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
