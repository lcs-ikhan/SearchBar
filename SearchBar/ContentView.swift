//
//  ContentView.swift
//  SearchBar
//
//  Created by Isaad Khan on 2023-04-17.
//

import SwiftUI

struct ContentView: View {
    
    //The list of items to show
    @State var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    // The search term the user has provided
    @State var searchText = ""
    
    var filteredItems: [String] {
        
        if searchText.isEmpty {
            
            return items 
        } else {
            
            // Create an empty array
            var matchingItems: [String] = []
            
            // Iterate over orrignal array
            for item in items {
                if item.contains(searchText) {
                    if item.lowercased().contains(searchText.lowercased()){
                        matchingItems.append(item)
                    }
                    
                }
            }
            return matchingItems
        }
    }
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Text("Searching on: \(searchText)")
                List(filteredItems, id: \.self) { currentItem in Text(currentItem)
                            }
                            .searchable(text: $searchText)
            }
            
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
