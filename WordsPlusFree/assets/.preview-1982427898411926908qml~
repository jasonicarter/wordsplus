import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle container
            //background: Color.Green
            preferredWidth: 700
            preferredHeight: 1130
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredWidth: 700
                property string category
                Container {
                    Container { // random words
                        background: Color.create("#272727")
                        TextArea {
                            text: "Random Puzzle:"
                            editable: false
                            touchPropagationMode: TouchPropagationMode.None
                            textStyle {
                                color: Color.create("#0098f0")
                            }
                        }
                    }
                    Button {
                        text: "Test"
                        onClicked: {
                            wordsPlus.InitializeWordnik("WordList");
                        }
                    }
                }
                Divider {
                    opacity: 0
                }
                Container { //category section
                    Container {
                        background: Color.create("#272727")
                        TextArea {
                            text: "Select Category:"
                            editable: false
                            touchPropagationMode: TouchPropagationMode.None
                            textStyle {
                                color: Color.create("#0098f0")
                            }
                        }
                    }
                }
                Divider {
                    opacity: 0
                }
                Container {
                    layout: DockLayout {
                    }
                    ListView {
                        id: catList
                        dataModel: XmlDataModel {
                            source: "models/wordsplus.xml"
                        }
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                StandardListItem {
                                    imageSpaceReserved: true
                                    title: ListItemData.category
                                    imageSource: ListItemData.image
                                }
                            }
                        ]
                        onTriggered: {
                            var selectedItem = dataModel.data(indexPath);
                            wordsPlus.category = selectedItem.filename;
                            wordsPlus.cntlyCategory((wordsPlus.category).toLowerCase(), wordsPlus.difficulty.toString());
                            wordsPlus.intializePlayArea();
                            categorySheet.close();
                        }
                    } //listview
                }
            }
        } //middle container
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "categorySheet"
        }
    }
}
