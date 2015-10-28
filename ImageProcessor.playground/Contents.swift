//: Playground - noun: a place where people can play
import UIKit

let image = UIImage(named: "sample")!

// Process the image!

let imageProcessor = ImageProcessor(image: image)

imageProcessor.apply(GreyscaleFilter(factor: 3)).getImage()

imageProcessor.restore().apply(InvertFilter()).getImage()

imageProcessor.restore().apply(ContrastFilter(contrast: 20.0)).getImage()

imageProcessor.restore().apply(BrightnessFilter(brightnessFactor: 100)).getImage()

imageProcessor.restore().apply(ColorFilter(colorFilterType: ColorFilterTypes.blue)).getImage()


// Applying both ColorFilter and InvertFilter
imageProcessor.restore().apply(ColorFilter(colorFilterType: ColorFilterTypes.red)).apply(InvertFilter()).getImage()

// Calling by string name
imageProcessor.restore().apply("ContrastFilter").getImage()












