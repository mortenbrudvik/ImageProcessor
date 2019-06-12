import Foundation

public class BrightnessFilter : ImageFilterProtocol{

    private var _brightness : Int

    // -255 to 255
    public init(brightnessFactor: Int = 50){
        _brightness = brightnessFactor
    }
    
    public func apply(pixel: Pixel) -> Pixel {
        
        var pixel = pixel
        pixel.red = UInt8(max(1, min(255, Int(pixel.red) + _brightness)))
        pixel.blue = UInt8(max(1, min(255, Int(pixel.blue) + _brightness)))
        pixel.green = UInt8(max(1, min(255, Int(pixel.green) + _brightness)))
        
        return pixel
    }
    

}
