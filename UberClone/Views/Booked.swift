//
//  Booked.swift
//  UberClone
//
//  Created by Jimmy Leu on 2020/6/12.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct Booked: View {
    @Binding var data : Data
    @Binding var doc : String
    @Binding var loading : Bool
    @Binding var book: Bool
    
    var body: some View {
        
        GeometryReader { reader in
            VStack(spacing:25){
                Image(uiImage: UIImage(data: self.data)!)
                
                Button(action: {
                    self.loading.toggle()
                    self.book.toggle()
                    
                    let db = Firestore.firestore()
                    db.collection("Booking").document(self.doc).delete() { (err) in
                        
                        if err != nil {
                            print((err?.localizedDescription)!)
                            self.loading.toggle()
                            return
                            
                        }
                        self.loading.toggle()
                    }
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .frame(width: reader.size.width / 2 )
                }
                .background(Color.red)
                .clipShape(Capsule())
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        
        }
        .background(Color.black.opacity(0.25).edgesIgnoringSafeArea(.all))
        
    }
    
}

//struct Booked_Previews: PreviewProvider {
//    static var previews: some View {
//        Booked(data: .constant(<#T##value: Data##Data#>), doc: .)
//    }
//}
