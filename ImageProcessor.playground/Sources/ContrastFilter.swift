import Foundation

public class ContrastFilter : ImageFilterProtocol{

    private var _contrast : Double

    //-100 to 100
    public init(contrast : Double = 0 ){
        _contrast = max(-100, min(100, contrast))
        _contrast = (100.0 + _contrast) / 100.0
        _contrast *= _contrast
    }
    
    public func apply(pixel: Pixel) -> Pixel {
        var newPixel = pixel
        newPixel.red = adjustContrast(value: pixel.red)
        newPixel.blue = adjustContrast(value: pixel.blue)
        newPixel.green = adjustContrast(value: pixel.green)
        return newPixel
    }
    
    private func adjustContrast(value : UInt8) -> UInt8{
        var newValue = Double(value)/255.0
        newValue -= 0.5
        newValue *= _contrast
        newValue += 0.5
        newValue *= 255

        return UInt8(max(0, min(255, Int(newValue))))
    }
}
