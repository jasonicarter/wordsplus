import bb.cascades 1.0

NavigationPane {
    id: puzzleNav
    Page {
        id: playPuzzlePage
        actions: [
            ActionItem {
                title: "New Puzzle"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    wordsPlus.intializePlayArea();
                }
            },
            ActionItem {
                title: "Category"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    categorySheet.open();
                }
            }
        ]
        Container {
            id: playPuzzleRootContainer
            layout: DockLayout {
            }
            horizontalAlignment: HorizontalAlignment.Center
            background: Color.Black
            preferredWidth: 768
            Container {
                background: Color.create("#00629C")
                preferredWidth: 768
                Label {
                    text: "Puzzles."
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: textNormalWhite.style
                    }
                }
            }
            //            Container { // divider
            //                preferredWidth: 600
            //                preferredHeight: 3
            //                background: Color.create("#ff8c00")
            //                verticalAlignment: VerticalAlignment.Center
            //                horizontalAlignment: HorizontalAlignment.Center
            //            }
            Container {
                layout: DockLayout {
                }
                topPadding: 125
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
                Container {
                    horizontalAlignment: HorizontalAlignment.Left
                    Label {
                        id: timerDisplay
                        text: "TIME: " + wordsPlus.time
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
                    }
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Right
                    Label {
                        text: "SCORE: " + "2734555"
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
                    }
                }
            }
            Container {
                objectName: "playAreaContainer"
                bottomPadding: 50
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                topMargin: 30
                preferredWidth: 700
                preferredHeight: preferredWidth
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            }
            Container { // Container for words to find
                bottomPadding: 100
                objectName: "wordsToFind"
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
            }
            Container { //divider
                preferredWidth: 768
                preferredHeight: 50
                background: Color.create("#00629C")
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // Page
        attachedObjects: [
            TextStyleDefinition {
                id: textNormalWhite
                base: SystemDefaults.TextStyles.BigText
                color: Color.create("#fafafa")
            },
            TextStyleDefinition {
                id: subTitleNormalWhite
                base: SystemDefaults.TextStyles.SubtitleText
                fontWeight: FontWeight.Normal
                fontFamily: "Times New Roman"
                color: Color.create("#fafafa")
            },
            TextStyleDefinition {
                id: subTitleNormalBlue
                base: SystemDefaults.TextStyles.SubtitleText
                fontWeight: FontWeight.Normal
                fontFamily: "Times New Roman"
                color: Color.create("#0098f0")
            },
            Sheet {
                id: categorySheet
                Page {
                    Container {
                        background: Color.Black
                        layout: DockLayout {
                        }
                        Container {
                            background: Color.create("#272727")
                            preferredWidth: 720
                            preferredHeight: 400
                            verticalAlignment: VerticalAlignment.Top
                            horizontalAlignment: HorizontalAlignment.Center
                            layout: AbsoluteLayout {
                            }
                            Label {
                                text: "Pick your Word List Type"
                                textStyle {
                                    color: Color.create("#fafafa")
                                    base: SystemDefaults.TextStyles.TitleText
                                }
                                layoutProperties: AbsoluteLayoutProperties {
                                    positionX: 20
                                    positionY: 20
                                }
                            }
                            RadioGroup {
                                id: radioGroup
                                layoutProperties: AbsoluteLayoutProperties {
                                    positionX: 20
                                    positionY: 75
                                }
                                Option {
                                    id: radioOptionCategory
                                    selected: true
                                }
                                Option {
                                    id: radioOptionLocation
                                }
                                onSelectedIndexChanged: {
                                    if (radioOptionCategory.selected == true) {
                                        byCategory.visible = true;
                                        byCategory.opacity = 1;
                                        byLocation.opacity = 0;
                                    }
                                    if (radioOptionLocation.selected == true) {
                                        byLocation.opacity = 1;
                                        byCategory.opacity = 0;
                                        byCategory.visible = false; //added to avoid issue with overlapping
                                    }
                                }
                            }
                            Label {
                                layoutProperties: AbsoluteLayoutProperties {
                                    positionX: 120
                                    positionY: 100
                                }
                                text: "By Category"
                                textStyle {
                                    color: Color.create("#fafafa")
                                    base: SystemDefaults.TextStyles.BodyText
                                }
                            }
                            Label {
                                layoutProperties: AbsoluteLayoutProperties {
                                    positionX: 120
                                    positionY: 240
                                }
                                text: "By Location"
                                textStyle {
                                    color: Color.create("#fafafa")
                                    base: SystemDefaults.TextStyles.BodyText
                                }
                            }
                        }
                        Container {
                            id: byLocation
                            topPadding: 50
                            preferredWidth: 720
                            background: Color.create("#272727")
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Bottom
                            opacity: 0
                            ToggleButton {
                            }
                            TextArea {
                                text: "By Location wordsearch is an awesome new way to play wordsearh. " + "Now there's no limit to the number of different words you can search!"
                                editable: false
                                textStyle {
                                    base: SystemDefaults.TextStyles.BodyText
                                    color: Color.create("#555555")
                                }
                            }
                            TextArea {
                                text: "Location Services must be turned ON for this feature to work correctly"
                                editable: false
                                textStyle {
                                    base: SystemDefaults.TextStyles.SmallText
                                    color: Color.create("#0098f0")
                                }
                            }
                        }
                        Container {
                            id: byCategory
                            topPadding: 50
                            preferredWidth: 720
                            background: Color.create("#272727")
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Bottom
                            opacity: 1
                            TextArea {
                                id: textField
                                text: "Current category: " + wordsPlus.category
                                editable: false
                                textStyle {
                                    base: SystemDefaults.TextStyles.SubtitleText
                                    color: Color.create("#0098f0")
                                }
                            }
                            ListView {
                                dataModel: XmlDataModel {
                                    source: "models/categories.xml"
                                }
                                preferredHeight: 500
                                listItemComponents: [
                                    ListItemComponent {
                                        type: "listItem"
                                        Container {
                                            layout: StackLayout {
                                                orientation: LayoutOrientation.LeftToRight
                                            }
                                            Label {
                                                text: ListItemData.title
                                                textStyle.color: Color.create("#fafafa")
                                            }
                                        } // end of Container
                                    } // end of second ListItemComponent
                                ] // end of listItemComponents list

                                // When an item is selected, update the text in the TextField
                                // to display the status of the new item
                                onTriggered: {
                                    var selectedItem = dataModel.data(indexPath);
                                    wordsPlus.category = selectedItem.filename;
                                    textField.text = "Current category: " + wordsPlus.category;
                                }
                            } // end of ListView
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
            }
        ]
    } //end of page
}// end of nav
