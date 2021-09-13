import ScadeKit

extension MainPageAdapter {
  var verticalview1: SCDWidgetsListView {
    return self.page?.getWidgetByName("verticalview1") as! SCDWidgetsListView
  }

  var bitmap1: SCDWidgetsImage {
    return self.page?.getWidgetByName("bitmap1") as! SCDWidgetsImage
  }

  var horizontalview1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalview1") as! SCDWidgetsRowView
  }

  var chooseFromLibraryButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("chooseFromLibraryButton") as! SCDWidgetsButton
  }

  var takePhotoButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("takePhotoButton") as! SCDWidgetsButton
  }

  var uploadButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("uploadButton") as! SCDWidgetsButton
  }
}