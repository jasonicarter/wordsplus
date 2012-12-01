import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            ImageView {
                imageSource: "asset:///images/titles/tosearch.png"
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
                    property int settingHard: 8
                    property int settingMedium: 4
                    property int settingEasy: 2
                    preferredWidth: 720
//                    Label {
//                        text: "testing: " + wordsPlus.difficulty
//                    }
                    DropDown {
                        id: diffDropDown
                        title: "Difficulty:"
                        Option {
                            id: hard
                            text: "Hard"
                            description: "Now we're talking!"
                            value: settingHard
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 8;
                                }
                            }
                        }
                        Option {
                            id: medium
                            text: "Medium"
                            description: "Great place to start"
                            value: settingMedium
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 4;
                                }
                            }
                        }
                        Option {
                            id: easy
                            text: "Easy"
                            description: "Don't pick me, I'm too easy"
                            value: settingEasy
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 2; //settingEasy;
                                }
                            }
                        }
                    }
                    onCreationCompleted: {
                        //diffDropDown.setSelectedOption(easy);
                        if (wordsPlus.difficulty == 2) {
                            diffDropDown.setSelectedOption(easy);
                        } else if (wordsPlus.difficulty == 4) {
                            diffDropDown.setSelectedOption(medium);
                        } else if (wordsPlus.difficulty == 8) {
                            diffDropDown.setSelectedOption(hard);
                        }
                    }
                } //diff buttons
                Divider {
                    opacity: 0
                }
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
            imageSource: "asset:///images/close.png"
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
