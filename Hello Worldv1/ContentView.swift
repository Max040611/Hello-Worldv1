import SwiftUI

struct ContentView: View {
    @State private var hasEntries = false
    @State var searchText = ""
    @State var showSearchBar = false
    @State var showNewEntrySheet = false
    @State var showDropdownMenu = false
    
    var body: some View {
        if hasEntries {
            MainPageView(searchText: $searchText, showSearchBar: $showSearchBar, showNewEntrySheet: $showNewEntrySheet, showDropdownMenu: $showDropdownMenu)
        } else {
            EmptyStateView(searchText: $searchText, showSearchBar: $showSearchBar, showNewEntrySheet: $showNewEntrySheet)
        }
    }
}

#Preview {
    ContentView()
}
