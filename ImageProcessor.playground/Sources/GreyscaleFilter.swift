import Foundation

public class GreyscaleFilter : ImageFilterProtocol{

    private var _factor : Int
    
    public init(factor : Int = 3){
        _factor = factor
    }
    
    public func apply(var pixel: Pixel) -> Pixel {
        let red = Int(pixel.red)
        let blue = Int(pixel.blue)
        let green = Int(pixel.green)
        
        let avg = max(0, min(255,(red + blue + green)/_factor))
        
        pixel.red = UInt8(avg)
        pixel.blue = UInt8(avg)
        pixel.green = UInt8(avg)
        
        return pixel
    }

}