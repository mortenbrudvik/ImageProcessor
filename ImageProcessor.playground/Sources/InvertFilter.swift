import Foundation

public class InvertFilter : ImageFilterProtocol{

    public init(){}
    
    public func apply( pixel: Pixel) -> Pixel {
        
        var pixel = pixel
        pixel.red = UInt8(255 - Int(pixel.red))
        pixel.blue = UInt8(255 - Int(pixel.blue))
        pixel.green = UInt8(255 - Int(pixel.green))
        
        return pixel
    }

}
