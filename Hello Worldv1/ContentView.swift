import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var showSearchBar = false
    @State var showNewEntrySheet = false
    @State var showDropdownMenu = false
    @ObservedObject var viewModel = JournalViewModel() // Observing JournalViewModel
    
    var body: some View {
        if viewModel.journalEntries.isEmpty {
            EmptyStateView(
                searchText: $searchText,
                showSearchBar: $showSearchBar,
                showNewEntrySheet: $showNewEntrySheet
            )
            .environmentObject(viewModel) // Provide the view model to EmptyStateView
        } else {
            MainPageView(
                searchText: $searchText,
                showSearchBar: $showSearchBar,
                showNewEntrySheet: $showNewEntrySheet,
                showDropdownMenu: $showDropdownMenu,
                viewModel: viewModel // Pass the view model to MainPageView
            )
        }
    }
}

#Preview {
    ContentView()
}
