import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "Word List."
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: categorySheetBigTextNormalWhite.style
                }
            }
        }
        Container { //middle container
            preferredWidth: 720
            preferredHeight: 1000
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                topPadding: 50
                preferredWidth: 720
                Container {
                    background: Color.create("#272727")
                    horizontalAlignment: HorizontalAlignment.Right
                    TextArea {
                        id: textField
                        preferredHeight: 100
                        text: "By Category: " + wordsPlus.category
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: categorySheetBigBodyNormalBlue.style
                        }
                    }
                }
                Container {
                    preferredWidth: 720
                    preferredHeight: 800
                    ListView {
                        id: categoryListView
                        dataModel: XmlDataModel {
                            source: "models/categories.xml"
                        }
                        horizontalAlignment: HorizontalAlignment.Center

                        // When an item is selected, update the text in the TextField
                        // to display the status of the new item
                        onTriggered: {
                            var selectedItem = dataModel.data(indexPath);
                            wordsPlus.category = selectedItem.filename;
                            textField.text = "By Category: " + selectedItem.category
                        }
                    } // end of ListView
                }
            }
//            Container {
//                id: byLocation
//                layout: DockLayout {
//                }
//                background: Color.create("#272727")
//                preferredWidth: 720
//                preferredHeight: 100
//                leftPadding: 15
//                Label {
//                    text: "By Location: "
//                    verticalAlignment: VerticalAlignment.Center
//                    horizontalAlignment: HorizontalAlignment.Left
//                    touchPropagationMode: TouchPropagationMode.None
//                    textStyle {
//                        base: categorySheetBigBodyNormalBlue.style
//                    }
//                }
//                Container {
//                    rightPadding: 15
//                    verticalAlignment: VerticalAlignment.Center
//                    horizontalAlignment: HorizontalAlignment.Right
//                    ToggleButton {
//                        enabled: true
//                        onCheckedChanged: {
//                            if (checked == true) { 
//                                categoryListView.enabled = false;
//                                locationTxt.textStyle.color = Color.create("#fafafa");
//                            } 
//                            else {
//                                categoryListView.enabled = true;
//                                locationTxt.textStyle.color = Color.create("#555555");
//                            }
//                        }
//                    }
//                }
//            }
//            Container {
//                TextArea {
//                    id: locationTxt
//                    text: "Now there's no limit to the number of different words you can search! \n\n" + "Location Services must be turned ON for this feature to work correctly"
//                    editable: false
//                    touchPropagationMode: TouchPropagationMode.None
//                    textStyle {
//                        base: categorySheetSubTitleNormalWhite.style
//                        color: Color.create("#555555");
//                    }
//                }
//            }
        } //middle container
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    actions: [
        ActionItem {
            title: "Close"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.intializePlayArea();
                categorySheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: categorySheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: categorySheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: categorySheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: categorySheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
