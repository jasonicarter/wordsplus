import bb.cascades 1.0

Page {
    actions: [
        ActionItem {
            title: "T20 This Week"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
            }
        },
        ActionItem {
            title: "T20 This Month"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
            }
        },
        ActionItem {
            title: "Your Position"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
            }
        }
    ]
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "Your Stats."
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: bigTextNormalWhite.style
                }
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container { //puzzle section
                preferredHeight: 300
                Container {
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 70
                    topPadding: 10
                    leftPadding: 15
                    Label {
                        text: "Puzzle Stats:"
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                Label {
                    text: "Total points won: " + wordsPlus.score + "\n" + "Best Puzzle Time: " + wordsPlus.puzzleCompletedTime + "\n" + "Total # of Words Found: " + wordsPlus.totalWordsFound
                    multiline: true
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
            Container { //leader section
                topMargin: 100
                Container {
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 70
                    topPadding: 10
                    leftPadding: 15
                    Label {
                        text: "Top 20 Leaders of All Time:"
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                Container {
                    preferredWidth: 720
                    //preferredHeight: 500
                    ListView {
                        id: categoryListView
                        dataModel: XmlDataModel {
                            source: "models/test.xml"
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
        }
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}