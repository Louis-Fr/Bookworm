//
//  DetailView.swift
//  BookwormBook
//
//  Created by Louis REY on 29/01/2023.
//

import SwiftUI

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                
                
                
                Text(book.genre?.uppercased() ??  "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknow author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknow Book")
        .navigationBarTitleDisplayMode(.inline)
    }
}


