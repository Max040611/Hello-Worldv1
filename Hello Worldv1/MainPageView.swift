import SwiftUI


// Custom Button Style for Circle Buttons with Icon
struct CircleButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let iconName: String

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: 35, height: 35)

            Image(systemName: iconName)
                .resizable()
                .frame(width: 18, height: 16.5)
                .foregroundColor(Color(hex: "#D4C8FF"))
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0) // Adds a pressed animation effect
        }
        .opacity(configuration.isPressed ? 0.7 : 1.0) // Adds pressed opacity
    }
}


struct MainPageView: View {
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    @Binding var showNewEntrySheet: Bool
    @Binding var showDropdownMenu: Bool
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        
        
        
        NavigationView {
            VStack {
                // Journal Title and Buttons
                HStack {
                    Text("Journal")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            withAnimation {
                                showDropdownMenu.toggle()
                            }
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(CircleButtonStyle(backgroundColor: Color(hex: "#1F1F22") ?? .black, iconName: "line.3.horizontal.decrease"))
                        
                        Button(action: {
                            showSearchBar = true
                            showNewEntrySheet = true
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(CircleButtonStyle(backgroundColor: Color(hex: "#1F1F22") ?? .black, iconName: "plus"))
                    }
                    .padding(.trailing, 20)
                }
                .padding(.top, 10)

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
                                        .padding(.leading, -35)
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
                        JournalEntryRow(entry: entry)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: viewModel.deleteJournalEntry)
                }
                .listStyle(PlainListStyle())
                .background(Color.black)

                Spacer()
                
                // Plus Button Sheet
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
