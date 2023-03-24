//
//  Extention.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 02/12/2022.
//

import UIKit
import ARKit
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UITableView {
    func registerCell(nibName:String) {
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellReuseIdentifier: nibName)
    }
}

extension UICollectionView {
    func registerCell(nibName:String) {
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellWithReuseIdentifier: nibName)
    }
}

extension UIScreen {
    class var screenWidth:CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    class var screenHeight:CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
}

extension UIButton {
    func addRightIcon(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        let length = CGFloat(15)
        titleEdgeInsets.right += length
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.titleLabel!.trailingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: length),
            imageView.heightAnchor.constraint(equalToConstant: length)
        ])
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

protocol AttributedStringComponent {
    var text: String { get }
    func getAttributes() -> [NSAttributedString.Key: Any]?
}

// MARK: String extensions

extension String: AttributedStringComponent {
    var text: String { self }
    func getAttributes() -> [NSAttributedString.Key: Any]? { return nil }
}

extension String {
    func toAttributed(with attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString {
        .init(string: self, attributes: attributes)
    }
}

// MARK: NSAttributedString extensions

extension NSAttributedString: AttributedStringComponent {
    var text: String { string }

    func getAttributes() -> [Key: Any]? {
        if string.isEmpty { return nil }
        var range = NSRange(location: 0, length: string.count)
        return attributes(at: 0, effectiveRange: &range)
    }
}

extension NSAttributedString {

    convenience init?(from attributedStringComponents: [AttributedStringComponent],
                      defaultAttributes: [NSAttributedString.Key: Any],
                      joinedSeparator: String = " ") {
        switch attributedStringComponents.count {
        case 0: return nil
        default:
            var joinedString = ""
            typealias SttributedStringComponentDescriptor = ([NSAttributedString.Key: Any], NSRange)
            let sttributedStringComponents = attributedStringComponents.enumerated().flatMap { (index, component) -> [SttributedStringComponentDescriptor] in
                var components = [SttributedStringComponentDescriptor]()
                if index != 0 {
                    components.append((defaultAttributes,
                                       NSRange(location: joinedString.count, length: joinedSeparator.count)))
                    joinedString += joinedSeparator
                }
                components.append((component.getAttributes() ?? defaultAttributes,
                                   NSRange(location: joinedString.count, length: component.text.count)))
                joinedString += component.text
                return components
            }

            let attributedString = NSMutableAttributedString(string: joinedString)
            sttributedStringComponents.forEach { attributedString.addAttributes($0, range: $1) }
            self.init(attributedString: attributedString)
        }
    }
}

extension UIView {
    func formatBorder(borderWidth : CGFloat, borderColor: UIColor ,cornerRadius: CGFloat)  {
        self.layer.cornerRadius = cornerRadius;
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func shadowView(shadowColor:UIColor , shadowOpacity:Float , shadowOffset:CGSize) {
        // drop shadow
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = self.layer.cornerRadius;
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
    }
    
    func drawCustomShape(fillColor:UIColor) {
        let cornerRadius: CGFloat = 0
        let shapeOffset = self.frame.size.height * 0.2
        
        //create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.lineWidth = 0
        shapeLayer.fillColor = fillColor.cgColor
        
        self.layer.addSublayer(shapeLayer)
        
        //create path
        let path = UIBezierPath()
        
        //top left point
        path.move(to: CGPoint(x: 0, y: self.frame.size.height - 20))
        //top left corner
//        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0),
//                          controlPoint: CGPoint(x: 0, y: 0))
        
        //top right point
        path.addLine(to: CGPoint(x: self.frame.size.width - cornerRadius, y: 10))
        //top right corner
//        path.addQuadCurve(to: CGPoint(x: self.frame.size.width, y: cornerRadius),
//                          controlPoint: CGPoint(x: self.frame.size.width, y: 0))
        
        //bottom right point
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 4))
        //bottom right corner
//        path.addQuadCurve(to: CGPoint(x: self.frame.size.width - cornerRadius, y: self.frame.size.height - shapeOffset),
//                          controlPoint: CGPoint(x: self.frame.size.width, y: self.frame.size.height - shapeOffset))
        
        //bottom left
        path.addLine(to: CGPoint(x: cornerRadius, y: self.frame.size.height))
        //bottom left corner
//        path.addQuadCurve(to: CGPoint(x: 0, y: self.frame.size.height - cornerRadius),
//                          controlPoint: CGPoint(x: 0, y: self.frame.size.height))
        
        path.close()
        
        shapeLayer.path = path.cgPath
    }
    
    func addTopDrawing() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.lineWidth = 0
        shapeLayer.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(shapeLayer)
        // ...  let bezierPath = UIBezierPath ()
        let path = UIBezierPath ()
        path.move(to:.zero)
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height -  (self.frame.size.height / 3)))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height -  (self.frame.size.height / 3)) )
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2) )
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0) )
//        path.addCurve(to: CGPoint(x: 40, y: 75),
//                      controlPoint1: CGPoint(
//                        x: self.frame.size.width-40,
//                        y: self.frame.size.height*0.15625),
//                      controlPoint2: CGPoint(
//                        x: self.frame.size.width * 3 / 5,
//                        y: self.frame.size.height * 0.09375))
//        path.addCurve(to: CGPoint(x: 0, y: 50),
//                      controlPoint1: CGPoint(x: 10, y: 75),
//                      controlPoint2: CGPoint(x: 0, y: 65))
        path.addLine(to: .zero)
        
        path.close()
        shapeLayer.path = path.cgPath
        // ...
    }
    
    func addBotDrawing () {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.lineWidth = 0
        shapeLayer.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(shapeLayer)
        let path = UIBezierPath ()
        path.move(to: CGPoint(x: 0, y: self.frame.size.height*0.6875))
        path.addCurve(to: CGPoint(x: self.frame.size.width-40, y: self.frame.size.height-75),
                      controlPoint1: CGPoint(
                        x: 40,
                        y: self.frame.size.height * 0.84375),
                      controlPoint2: CGPoint(
                        x: self.frame.size.width * 2 / 5,
                        y: self.frame.size.height * 0.90625))
        
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - 50),
                      controlPoint1: CGPoint(
                        x: self.frame.size.width - 10,
                        y: self.frame.size.height - 75),
                      controlPoint2: CGPoint(
                        x: self.frame.size.width,
                        y : self.frame.size.height - 65))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height * 0.6875))
        path.close()
        shapeLayer.path = path.cgPath
        // ...
    }
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
}

extension UITextField {
    
    //MARK:- Set Image on the right of text fields
    
    func setupRightImage(imageName:String,tintColors:UIColor){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        imageView.center = imageContainerView.center;
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = tintColors
    }
    
    //MARK:- Set Image on left of text fields
    
    func setupLeftImage(imageName:String,tintColors:UIColor){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        imageView.center = imageContainerView.center;
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        self.tintColor = tintColors
    }
}

extension ARSCNView {
    
    func setup() {
        antialiasingMode = .multisampling4X
//        automaticallyUpdatesLighting = true
        
        preferredFramesPerSecond = 60
        contentScaleFactor = 1.3
        
        if let camera = pointOfView?.camera {
            camera.wantsHDR = true
            camera.wantsExposureAdaptation = true
            camera.exposureOffset = -1
            camera.minimumExposure = -1
            camera.maximumExposure = 3
        }
    }
}

extension SCNScene {
    func enableEnvironmentMapWithIntensity(_ intensity: CGFloat, queue: DispatchQueue) {
        queue.async {
            if self.lightingEnvironment.contents == nil {
                if let environmentMap = UIImage(named: "Models.scnassets/sharedImages/environment_blur.exr") {
                    self.lightingEnvironment.contents = environmentMap
                }
            }
            self.lightingEnvironment.intensity = intensity
        }
    }
}

extension Array where Iterator.Element == Float {
    var average: Float? {
        guard !self.isEmpty else {
            return nil
        }
        
        let sum = self.reduce(Float(0)) { current, next in
            return current + next
        }
        return sum / Float(self.count)
    }
}

extension Array where Iterator.Element ==  SIMD3<Float> {
    var average:  SIMD3<Float>? {
        guard !self.isEmpty else {
            return nil
        }
  
        let sum = self.reduce( SIMD3<Float>(repeating: 0)) { current, next in
            return current + next
        }
        return sum / Float(self.count)
    }
}

extension RangeReplaceableCollection where IndexDistance == Int {
    mutating func keepLast(_ elementsToKeep: Int) {
        if count > elementsToKeep {
            self.removeFirst(count - elementsToKeep)
        }
    }
}

// MARK: - SCNNode extension

extension SCNNode {
    
    func setUniformScale(_ scale: Float) {
        self.simdScale =  SIMD3<Float>(scale, scale, scale)
    }
    
    func renderOnTop(_ enable: Bool) {
        self.renderingOrder = enable ? 2 : 0
        if let geom = self.geometry {
            for material in geom.materials {
                material.readsFromDepthBuffer = enable ? false : true
            }
        }
        for child in self.childNodes {
            child.renderOnTop(enable)
        }
    }
}

// MARK: - float4x4 extensions

extension float4x4 {
    /// Treats matrix as a (right-hand column-major convention) transform matrix
    /// and factors out the translation component of the transform.
    var translation:  SIMD3<Float> {
        let translation = self.columns.3
        return  SIMD3<Float>(translation.x, translation.y, translation.z)
    }
}

// MARK: - SCNMaterial extensions

extension SCNMaterial {
    
    static func material(withDiffuse diffuse: Any?, respondsToLighting: Bool = true) -> SCNMaterial {
        let material = SCNMaterial()
        material.diffuse.contents = diffuse
        material.isDoubleSided = true
        if respondsToLighting {
            material.locksAmbientWithDiffuse = true
        } else {
            material.ambient.contents = UIColor.black
            material.lightingModel = .constant
            material.emission.contents = diffuse
        }
        return material
    }
}

// MARK: - CGPoint extensions

extension CGPoint {
    
    init(_ size: CGSize) {
        self.init()
        self.x = size.width
        self.y = size.height
    }
    
    init(_ vector: SCNVector3) {
        self.init()
        self.x = CGFloat(vector.x)
        self.y = CGFloat(vector.y)
    }
    
    func distanceTo(_ point: CGPoint) -> CGFloat {
        return (self - point).length()
    }
    
    func length() -> CGFloat {
        return sqrt(self.x * self.x + self.y * self.y)
    }
    
    func midpoint(_ point: CGPoint) -> CGPoint {
        return (self + point) / 2
    }
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    static func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }
    
    static func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }
    
    static func / (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x / right, y: left.y / right)
    }
    
    static func * (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x * right, y: left.y * right)
    }
    
    static func /= (left: inout CGPoint, right: CGFloat) {
        left = left / right
    }
    
    static func *= (left: inout CGPoint, right: CGFloat) {
        left = left * right
    }
}

// MARK: - CGSize extensions

extension CGSize {
    init(_ point: CGPoint) {
        self.init()
        self.width = point.x
        self.height = point.y
    }

    static func + (left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width + right.width, height: left.height + right.height)
    }

    static func - (left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width - right.width, height: left.height - right.height)
    }

    static func += (left: inout CGSize, right: CGSize) {
        left = left + right
    }

    static func -= (left: inout CGSize, right: CGSize) {
        left = left - right
    }

    static func / (left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width / right, height: left.height / right)
    }

    static func * (left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width * right, height: left.height * right)
    }

    static func /= (left: inout CGSize, right: CGFloat) {
        left = left / right
    }

    static func *= (left: inout CGSize, right: CGFloat) {
        left = left * right
    }
}

// MARK: - CGRect extensions

extension CGRect {
    var mid: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

func rayIntersectionWithHorizontalPlane(rayOrigin:  SIMD3<Float>, direction:  SIMD3<Float>, planeY: Float) ->  SIMD3<Float>? {
    
    let direction = simd_normalize(direction)

    // Special case handling: Check if the ray is horizontal as well.
    if direction.y == 0 {
        if rayOrigin.y == planeY {
            // The ray is horizontal and on the plane, thus all points on the ray intersect with the plane.
            // Therefore we simply return the ray origin.
            return rayOrigin
        } else {
            // The ray is parallel to the plane and never intersects.
            return nil
        }
    }
    
    // The distance from the ray's origin to the intersection point on the plane is:
    //   (pointOnPlane - rayOrigin) dot planeNormal
    //  --------------------------------------------
    //          direction dot planeNormal
    
    // Since we know that horizontal planes have normal (0, 1, 0), we can simplify this to:
    let dist = (planeY - rayOrigin.y) / direction.y

    // Do not return intersections behind the ray's origin.
    if dist < 0 {
        return nil
    }
    
    // Return the intersection point.
    return rayOrigin + (direction * dist)
}


// MARK: - float3 extensions

extension  SIMD3<Float> {
    func length() -> Float {
        return sqrtf(x * x + y * y + z * z)
    }
    
    static func + (left:  SIMD3<Float>, right:  SIMD3<Float>) ->  SIMD3<Float> {
        return  SIMD3<Float>(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func - (left:  SIMD3<Float>, right:  SIMD3<Float>) ->  SIMD3<Float> {
        return  SIMD3<Float>(left.x - right.x, left.y - right.y, left.z - right.z)
    }

}

// MARK: - SCNVector3 extensions

extension SCNVector3 {
    
    func length() -> Float {
        return sqrtf(x * x + y * y + z * z)
    }
    
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



