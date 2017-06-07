//: Playground - noun: a place where people can play
import UIKit

let image = UIImage(named: "sample")!

// Process the image!

let imageProcessor = ImageProcessor(image: image)

imageProcessor.apply(filter: GreyscaleFilter(factor: 3)).getImage()

imageProcessor.restore().apply(filter: InvertFilter()).getImage()

imageProcessor.restore().apply(filter: ContrastFilter(contrast: 20.0)).getImage()

imageProcessor.restore().apply(filter: BrightnessFilter(brightnessFactor: 100)).getImage()

imageProcessor.restore().apply(filter: ColorFilter(colorFilterType: ColorFilterTypes.blue)).getImage()


// Applying both ColorFilter and InvertFilter
imageProcessor.restore().apply(filter: ColorFilter(colorFilterType: ColorFilterTypes.red)).apply(filter: InvertFilter()).getImage()

// Calling by string name
imageProcessor.restore().apply(filterType: "ContrastFilter").getImage()












