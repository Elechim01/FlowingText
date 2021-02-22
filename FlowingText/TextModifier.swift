//
//  TextModifier.swift
//  FlowingText
//
//  Created by Michele Manniello on 22/02/21.
//

import Foundation
import SwiftUI

public struct FlowTextModifier : ViewModifier{
    var image : Image
    @State var offset : CGPoint = .zero
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    init(backgorund : Image) {
        self.image = backgorund
    }
    public func body(content: Content) -> some View {
        content.overlay(
            GeometryReader{ geo in
                ZStack(alignment: .center, content: {
                    image
                        .resizable()
                        .offset(x: offset.x - geo.size.width, y: offset.y)
                        .mask(content)
                        .onReceive(timer, perform: { _ in
                            let newOffset = getNextOffset(size: geo.size, offset: offset)
                            if newOffset == .zero{
                                offset = newOffset
                                withAnimation(.linear(duration: 0.5)){
                                    offset = getNextOffset(size: geo.size, offset: newOffset)
                                }
                            }else{
                                withAnimation(.linear(duration:0.5)){
                                    offset = newOffset
                                }
                            }
                        })
                    
                })
            }
        )
    }
    func getNextOffset(size:CGSize,offset :CGPoint) -> CGPoint {
        var nextOffset = offset
        if nextOffset.x > size.width * 2{
            nextOffset.x = 0
        }else{
            nextOffset.x += size.width / 10.0
        }
        return nextOffset
    }
}
