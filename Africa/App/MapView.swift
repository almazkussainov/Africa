//
//  MapView.swift
//  Africa
//
//  Created by Алмаз Кусаинов on 27.04.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - #1 BASIC MAP
//        Map(coordinateRegion: $region)
        
        //MARK: - #2 MAP WITH ANNOTATIONS
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) PIN: OLD STYLE (always static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
           // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 42, height: 42, alignment: .center)
            
            // (D) OPTION MAP ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotatinView(location: item)
            } //: ANNOTATION
        }//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
