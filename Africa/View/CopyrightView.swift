//
//  CopyrightView.swift
//  Africa
//
//  Created by Алмаз Кусаинов on 03.05.2022.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Almaz Kussainov
    All rights reserved
    Better Apps ❤️ Less Code
    """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        CopyrightView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
