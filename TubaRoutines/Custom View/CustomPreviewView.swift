//
//  CustomPreviewView.swift
//  TubaRoutines
//
//  Created by Alexander Burdiss on 9/28/20.
//  Copyright © 2020 Alex Burdiss. All rights reserved.
//

import SwiftUI

/**
 A view that shows the current exercise in the picker, and provides functionality for exiting the view. This view should be used as a sheet.
 */
struct CustomPreviewView: View {
    /**
     The user selected favorites
     */
    @EnvironmentObject var favorites: Favorites
    
    /**
    The image name to display.
    */
    var image: String
    
    /**
     State variable passed in from the view's parent that determines whether the current sheet is showing.
     */
    @Binding var isPresented: Bool
       
   /**
    The user interface
    */
    var body: some View {
        NavigationView {
            VStack{
                Image(self.image)
                    .resizable()
                    .scaledToFit()
            }
            .navigationBarTitle("\(self.image)")
            .navigationBarItems(leading:
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.yellow)
                    Text("Return")
                        .foregroundColor(.yellow)
                },
                trailing: Button(action: {
                    if self.favorites.contains(self.image) {
                        self.favorites.remove(self.image)
                   } else {
                       self.favorites.add(self.image)
                   }
                }) {
                   favorites.contains(image)
                   ?
                   Image(systemName: "heart.fill")
                       .foregroundColor(.red)
                   :
                   Image(systemName: "heart")
                       .foregroundColor(.yellow)
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct CustomPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPreviewView(image: "1", isPresented: .constant(true))
    }
}

