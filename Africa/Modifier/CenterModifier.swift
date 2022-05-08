//
//  CenterModifier.swift
//  Africa
//
//  Created by Алмаз Кусаинов on 03.05.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            
            content
            
            Spacer()
        }//: HStack
    }
}
