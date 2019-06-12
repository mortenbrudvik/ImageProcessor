import Foundation

public protocol ImageFilterProtocol{
    func apply(pixel : Pixel) -> Pixel
}