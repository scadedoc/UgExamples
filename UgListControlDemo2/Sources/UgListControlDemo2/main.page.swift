import ScadeKit

extension SCDWidgetsWidget {

  var backgroundSvgImage: SCDSvgImage? {
    return self.backgroundSvgElement as? SCDSvgImage
  }

  var backgroundSvgRect: SCDSvgRect? {
    return self.backgroundSvgElement as? SCDSvgRect
  }

  private var backgroundSvgElement: SCDSvgElement? {
    let background = (self.drawing as? SCDSvgContainerElement)?.children[0]
    if let container = (background as? SCDSvgContainerElement), !container.children.isEmpty {
      return container.children[0]
    } else {
      return nil
    }
  }

}

class MainPageAdapter: SCDLatticePageAdapter {

  var dogs: [Dog] = []

  // page adapter initialization
  override func load(_ path: String) {

    super.load(path)

    self.list1.elementProvider = SCDWidgetsElementProvider { (dog: Dog, template) in

      (template.getWidgetByName("dogName") as? SCDWidgetsLabel)?.text = dog.name

      (template.getWidgetByName("dogBreed") as? SCDWidgetsLabel)?.text = dog.breed

      (template.getWidgetByName("dogId") as? SCDWidgetsLabel)?.text = dog.id
    }

    list1.items = Array(Dogs().dogs.prefix(100))

    // listen to itemSelected events
    list1.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { event in
        if let dog = event?.item as? Dog {
          print("Hello \(dog.name)")
        }
      }
    )

    list1.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { [weak self] event in

        if let listElement = event?.element as? SCDWidgetsListElement,
          let backgroundColor = listElement.backgroundColor,
          let self = self
        {
          // We want to animate bacground color from gold to the original color
          let fromColor = SCDSvgRGBColor.gold
          let toColor = self.colorConvert(backgroundColor)

          // Lets animate fill property
          let anim = SCDSvgPropertyAnimation("fill", from: fromColor, to: toColor)
          anim.duration = 0.4
          anim.repeatCount = 1
          anim.delay = 0.2
          anim.deleteOnComplete = true

          listElement.backgroundSvgRect?.animations.append(anim)
        }
      })
  }

  func colorConvert(_ color: SCDGraphicsRGB) -> SCDSvgRGBColor {
    return SCDSvgRGBColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
  }

}
