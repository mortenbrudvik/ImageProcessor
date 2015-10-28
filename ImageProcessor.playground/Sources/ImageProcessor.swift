import Foundation
import UIKit

public class ImageProcessor{

    private var _image : RGBAImage
    private var _oldImage : UIImage
    
    public init(image : UIImage){
        _image = RGBAImage(image: image)!
        _oldImage = image
    }

    public func apply(filter : ImageFilterProtocol) -> ImageProcessor{
        for y in 0..<_image.height{
            for x in 0..<_image.width{
                let index = y * _image.width + x
                
                let pixel = _image.pixels[index]
                
                _image.pixels[index] = filter.apply(pixel)
            }
        }
        
        return self
    }
    
    public func apply(filterType : String ) -> ImageProcessor{
        switch filterType{
            case "ColorFilter":
                return self.apply(ColorFilter(colorFilterType: ColorFilterTypes.blue))
            case "ContrastFilter":
                return self.apply(ContrastFilter(contrast: 50.0))
            case "GreyscaleFilter":
                return self.apply(GreyscaleFilter(factor: 3))
            case "InvertFilter":
                return self.apply(InvertFilter())
        default:
            return self
        }
    }
    
    public func getImage() -> UIImage{
        return _image.toUIImage()!
    }
    
    public func restore() -> ImageProcessor{
        _image = RGBAImage(image: _oldImage)!
        
        return self
    }
}
