import Foundation

public enum ColorFilterTypes{
    case red
    case blue
    case green
}

public class ColorFilter : ImageFilterProtocol{

    private var _colorType : ColorFilterTypes
    
    public init(colorFilterType : ColorFilterTypes){
        _colorType = colorFilterType
    }
    
    public func apply(pixel: Pixel) -> Pixel {
        var pixel = pixel
        var redValue = 0
        var blueValue = 0
        var greenValue = 0
        
        if( _colorType == ColorFilterTypes.red){
        
            redValue = Int(pixel.red)
            greenValue = Int(pixel.green) - 255
            blueValue = Int(pixel.blue) - 255
        }
        else if( _colorType == ColorFilterTypes.green){
            
            redValue = Int(pixel.red) - 255
            greenValue = Int(pixel.green)
            blueValue = Int(pixel.blue) - 255
        }
        else if( _colorType == ColorFilterTypes.blue){
            
            redValue = Int(pixel.red) - 255
            greenValue = Int(pixel.green) - 255
            blueValue = Int(pixel.blue)
        }
        
        pixel.red = UInt8(max(0, min(255, redValue)))
        pixel.blue = UInt8(max(0, min(255, blueValue)))
        pixel.green = UInt8(max(0, min(255, greenValue)))
        
        return pixel
        
    }
}
