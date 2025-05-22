//
//  ContentView.swift
//  visionariOSPOC1
//
//  Created by Lucas Dantas de Moura Carvalho on 21/05/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        
        /// The width and height for the frame of each shape view.
        let shapeScale: CGFloat = 100.0
        
        
        /// A width for all the lines in each shape.
        let strokeWidth: CGFloat = 5.0
        
        
        /// The upper-leading corner of the triangle.
        let vertex1 = CGPoint(x: 0.0, y: 0.0)
        
        
        /// The lower-trailing corner of the triangle.
        let vertex2 = CGPoint(x: shapeScale, y: shapeScale)
        
        
        /// The lower-leading corner of the triangle.
        let vertex3 = CGPoint(x: 0.0, y: shapeScale)
        
        
        // ...
        
        VStack {
            Text("POC do lucao")
                .padding(50)
            HStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(50)
                
//                if let url = Bundle.main.url(forResource: "iphone", withExtension: "usdz") {
//                    Model3D(url: url)
//                        .frame(width: 200, height: 200)
//                } else {
//                    Text("Modelo não encontrado.")
//                }
                
                Model3D(named: "iphone", bundle: realityKitContentBundle)
                
                Triangle(vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
                    .stroke(lineWidth: strokeWidth)
                    .frame(width: shapeScale, height: shapeScale)
            }
            Text("Hello, world!")
        }
        .padding()
    }
}

struct Triangle: Shape {
    let vertex1: CGPoint
    let vertex2: CGPoint
    let vertex3: CGPoint


    // ...
    
    func path(in bounds: CGRect) -> Path {
        /// The drawing path for the triangle shape.
        var path = Path()


        // Start at the first vertex.
        path.move(to: vertex1)


        // Draw the triangle's first two sides.
        path.addLine(to: vertex2)
        path.addLine(to: vertex3)
        
        // Draw the triangle's third side by returning to the first vertex.
        path.closeSubpath()


        return path
    }
}

struct Line: Shape {
    let endPoint1: CGPoint
    let endPoint2: CGPoint
    
    
    // ...
    
    func path(in bounds: CGRect) -> Path {
        /// The drawing path for the triangle shape.
        var path = Path()
        
        // Draw the line between the two endpoints.
        path.move(to: endPoint1)
        path.addLine(to: endPoint2)
        
        
        return path
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
