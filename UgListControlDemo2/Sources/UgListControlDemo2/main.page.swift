import ScadeKit
import ScadeUI
import ScadeGraphics

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.list1.elementProvider { (item: Dog, element) in

      (element["dogName"] as? SCDWidgetsLabel)?.text = item.name

      (element["dogBreed"] as? SCDWidgetsLabel)?.text = item.breed

      (element["dogId"] as? SCDWidgetsLabel)?.text = item.id
    }

    list1.items = Array(Dogs().dogs.prefix(100))

    list1.onItemSelected { event in
      guard let item = event.item as? Dog,
            let element = event.element as? SCDWidgetsListElement,
            let backgroundColor = element.backgroundColor else { return }

      print("Hello \(item.name)")

      // We want to animate bacground color from gold to the original color
      let fromColor = SCDSvgRGBColor.gold
      let toColor = SCDSvgRGBColor(widgetRGB: backgroundColor)

      // Lets animate fill property
      let anim = SCDSvgPropertyAnimation("fill", from: fromColor, to: toColor)
      anim.duration = 0.4
      anim.repeatCount = 1
      anim.delay = 0.2
      anim.deleteOnComplete = true

      element.backgroundRect?.animations.append(anim)
    }
  }
}
