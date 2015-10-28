import Foundation

public class InvertFilter : ImageFilterProtocol{

    public init(){}
    
    public func apply(var pixel: Pixel) -> Pixel {

        pixel.red = UInt8(255 - Int(pixel.red))
        pixel.blue = UInt8(255 - Int(pixel.blue))
        pixel.green = UInt8(255 - Int(pixel.green))
        
        return pixel
    }

}