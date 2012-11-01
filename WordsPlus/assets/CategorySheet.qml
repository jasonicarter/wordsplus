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
                    base: bigTextNormalWhite.style
                }
            }
        }
        Container { //middle container
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                id: byLocation
                TextArea {
                    text: "By LOCATION"
                    editable: false
                    enabled: false
                    textStyle {
                        base: SystemDefaults.TextStyles.BodyText
                        color: Color.create("#fafafa")
                    }
                }
                ToggleButton {
                    enabled: true
                }
            }
            Container {
                TextArea {
                    text: "Now there's no limit to the number of different words you can search!"
                    editable: false
                    enabled: false
                    textStyle {
                        base: SystemDefaults.TextStyles.SubtitleText
                        color: Color.create("#555555")
                    }
                }
                TextArea {
                    text: "Location Services must be turned ON for this feature to work correctly"
                    editable: false
                    enabled: false
                    textStyle {
                        base: SystemDefaults.TextStyles.SmallText
                        color: Color.create("#0098f0")
                    }
                }
            }
            Container { //divider
                preferredWidth: 720
                preferredHeight: 3
                background: Color.create("#272727")
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                topPadding: 25
                preferredWidth: 720
                Container {
                    background: Color.create("#272727")
                    horizontalAlignment: HorizontalAlignment.Right
                    TextArea {
                        id: textField
                        text: "Category: " + wordsPlus.category
                        editable: false
                        textStyle {
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#0098f0")
                        }
                    }
                }
                Container {
                    preferredWidth: 720
                    //background: Color.create("#272727")
                    ListView {
                        dataModel: XmlDataModel {
                            source: "models/categories.xml"
                        }
                        topPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        listItemComponents: [
                            ListItemComponent {
                                type: "listItem"
                                Container {
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
//                                    Label {
//                                        //text: listItemData
//                                        textStyle {
//                                            base: SystemDefaults.TextStyles.SubtitleText
//                                            color: Color.create("#fafafa")
//                                        }
//                                    }
                                } // end of Container
                            } // end of second ListItemComponent
                        ] // end of listItemComponents list

                        // When an item is selected, update the text in the TextField
                        // to display the status of the new item
                        onTriggered: {
                            var selectedItem = dataModel.data(indexPath);
                            wordsPlus.category = selectedItem.filename;
                            textField.text = "Category: " + selectedItem.category
                        }
                    } // end of ListView
                }
            }
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

            // When this action is selected, close
            // the sheet
            onTriggered: {
                wordsPlus.intializePlayArea();
                categorySheet.close();
            }
        }
    ]
}
