//
//  ContentView.swift
//  Bookworm
//
//  Created by Louis REY on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title, order: .reverse),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        
        NavigationView {

            List {
                ForEach(books) { book in
                    NavigationLink {
                       // Text(book.title ?? "Unknow")
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknow title")
                                    .font(.headline)
                           
                            
                            Text(book.author ?? "Unknow Author")
                                .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
      
    }
}
