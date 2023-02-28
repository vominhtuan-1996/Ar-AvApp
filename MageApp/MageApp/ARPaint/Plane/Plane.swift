//
//  Plane.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 28/02/2023.
//

import Foundation
import ARKit

class Plane: SCNNode {
    
    // MARK: - Properties
    
    var anchor: ARPlaneAnchor
    var focusSquare: FocusSquare?
    
    // MARK: - Initialization
    
    init(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ARKit
    
    func update(_ anchor: ARPlaneAnchor) {
        self.anchor = anchor
    }
        
}

