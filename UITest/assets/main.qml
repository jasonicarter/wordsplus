// Default empty project template
import bb.cascades 1.0
import bb.system 1.0

// creates one page with a label

Page {
    property string seletedTheme
    Container {
        id: main
        //background: Color.create("#272727")
        preferredHeight: 720
        Label {
            id: themeSwitch
            text: "Theme"
        }
        ListView {
            id: myList
            dataModel: XmlDataModel {
                source: "models/themes.xml"
            }
            scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
            horizontalAlignment: HorizontalAlignment.Center
            layout: StackListLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            // Add appearance definitions for the list items using the
            // listItemComponents list
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    Container {
                        rightPadding: 30
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            topPadding: 2
                            rightPadding: 2
                            leftPadding: 2
                            bottomPadding: 2
                            background: Color.Black
                            ImageView {
                                imageSource: ListItemData.image
                            }
                        }
                    }
                }
            ] //end of components
            onTriggered: {
                var selectedItem = myList.dataModel.data(indexPath);
                seletedTheme = selectedItem.name;
                if (selectedItem.price == "free") {
                    themeDialog.show();
                }
            }
            attachedObjects: [
                SystemDialog {
                    id: themeDialog
                    title: "Switching Themes"
                    body: "You are about to switch your theme to " + seletedTheme
                    onFinished: {
                        if (themeDialog.result == SystemUiResult.CancelButtonSelection) {
                            //on cancel do nothing
                        }
                        if (themeDialog.result == SystemUiResult.ConfirmButtonSelection) {
                            //on confirm set c++ property
                            themeSwitch.text = seletedTheme;
                        }
                    }
                }
            ]
        } //end of listview
    }
}
