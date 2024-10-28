import SwiftUI

struct EmptyStateView: View {
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    @Binding var showNewEntrySheet: Bool
    @EnvironmentObject var viewModel: JournalViewModel // Access shared view model
    @State private var showDropdownMenu = false // State for showing filter options

    var body: some View {
        VStack {
            Text("Journal")
                .font(.system(size: 34))
                .foregroundColor(.white)
                .bold()
                .padding(.top, 130)
                .padding(.leading, -180)
            
            Image("Journal1")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 150)
                .padding(.bottom, 20)
            
            Text("Begin Your Journal")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "#D4C8FF"))
                .bold()
            
            Text("Craft your personal diary, tap the \n plus icon to begin")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
            
            Spacer()
            
            // Filter and Plus Buttons
            ZStack(alignment: .topTrailing) {
                HStack {
                    Spacer()
                    
                    // Filter Button with dropdown menu
                    Button(action: {
                        withAnimation {
                            showDropdownMenu.toggle() // Toggle dropdown visibility
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#1F1F22") ?? .black)
                                .frame(width: 35, height: 35)
                            
                            Image(systemName: "line.3.horizontal.decrease")
                                .resizable()
                                .frame(width: 18, height: 15)
                                .foregroundColor(Color(hex: "#D4C8FF"))
                        }
                    }
                    .padding(.trailing, 10)
                    
                    // Plus Button
                    Button(action: {
                        showSearchBar = true
                        showNewEntrySheet = true
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#1F1F22") ?? .black)
                                .frame(width: 35, height: 35)
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(Color(hex: "#D4C8FF"))
                        }
                    }
                    .sheet(isPresented: $showNewEntrySheet) {
                        NewJournalEntryView(viewModel: viewModel) // Pass viewModel to NewJournalEntryView
                    }
                    
                    Spacer()
                }
                
                // Dropdown Menu directly below the filter button
                if showDropdownMenu {
                    VStack(alignment: .leading, spacing: 5) {
                        Button("Bookmark") {
                            print("Bookmark selected")
                            showDropdownMenu = false
                        }
                        .padding()
                        .background(Color(hex: "#202022"))
                        .cornerRadius(5)
                        .frame(width: 150, height: 40)
                        
                        Button("Journal Date") {
                            print("Journal Date selected")
                            showDropdownMenu = false
                        }
                        .padding()
                        .background(Color(hex: "#202022"))
                        .cornerRadius(5)
                        .frame(width: 150, height: 40)
                    }
                    .background(Color(hex: "#202022"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.trailing, 240)
                }
            }
            .padding(.top, -635)
            .padding(.leading, 300)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
