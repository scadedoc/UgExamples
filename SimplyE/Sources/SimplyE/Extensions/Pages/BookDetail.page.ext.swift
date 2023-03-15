import ScadeKit

extension BookDetailPageAdapter {
  var navigationBar: SCDWidgetsNavigationBar {
    return self.page?.getWidgetByName("navigationBar") as! SCDWidgetsNavigationBar
  }

  var downloadButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("downloadButton") as! SCDWidgetsButton
  }

  var backButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("backButton") as! SCDWidgetsButton
  }

  var detailsLabel: SCDWidgetsLabel {
    return self.page?.getWidgetByName("detailsLabel") as! SCDWidgetsLabel
  }

  var listBookDetails: SCDWidgetsListView {
    return self.page?.getWidgetByName("listBookDetails") as! SCDWidgetsListView
  }

  var horizontalImageView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalImageView") as! SCDWidgetsRowView
  }

  var image: SCDWidgetsImage {
    return self.page?.getWidgetByName("image") as! SCDWidgetsImage
  }

  var viewBookInfo: SCDWidgetsListView {
    return self.page?.getWidgetByName("viewBookInfo") as! SCDWidgetsListView
  }

  var lbBookTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbBookTitle") as! SCDWidgetsLabel
  }

  var lbAuthorName: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbAuthorName") as! SCDWidgetsLabel
  }

  var viewBookPublisherInfo: SCDWidgetsGridView {
    return self.page?.getWidgetByName("viewBookPublisherInfo") as! SCDWidgetsGridView
  }

  var lb1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lb1") as! SCDWidgetsLabel
  }

  var lbPages: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbPages") as! SCDWidgetsLabel
  }

  var lb2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lb2") as! SCDWidgetsLabel
  }

  var lbRating: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbRating") as! SCDWidgetsLabel
  }

  var lb3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lb3") as! SCDWidgetsLabel
  }

  var lbPublished: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbPublished") as! SCDWidgetsLabel
  }

  var lb4: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lb4") as! SCDWidgetsLabel
  }

  var lbLanguage: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbLanguage") as! SCDWidgetsLabel
  }

  var viewBookDescription: SCDWidgetsListView {
    return self.page?.getWidgetByName("viewBookDescription") as! SCDWidgetsListView
  }

  var lbOverviewTitle: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbOverviewTitle") as! SCDWidgetsLabel
  }

  var lbDescription: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lbDescription") as! SCDWidgetsLabel
  }

  var horizontalReadBookButtonView: SCDWidgetsRowView {
    return self.page?.getWidgetByName("horizontalReadBookButtonView") as! SCDWidgetsRowView
  }

  var readBookButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("readBookButton") as! SCDWidgetsButton
  }

  var toolBar: SCDWidgetsToolBar {
    return self.page?.getWidgetByName("toolBar") as! SCDWidgetsToolBar
  }

  var toolBarItem1: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem1") as! SCDWidgetsToolBarItem
  }

  var icon1: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon1") as! SCDWidgetsImage
  }

  var caption1: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption1") as! SCDWidgetsLabel
  }

  var toolBarItem2: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem2") as! SCDWidgetsToolBarItem
  }

  var icon2: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon2") as! SCDWidgetsImage
  }

  var caption2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption2") as! SCDWidgetsLabel
  }

  var toolBarItem3: SCDWidgetsToolBarItem {
    return self.page?.getWidgetByName("toolBarItem3") as! SCDWidgetsToolBarItem
  }

  var icon3: SCDWidgetsImage {
    return self.page?.getWidgetByName("icon3") as! SCDWidgetsImage
  }

  var caption3: SCDWidgetsLabel {
    return self.page?.getWidgetByName("caption3") as! SCDWidgetsLabel
  }
}