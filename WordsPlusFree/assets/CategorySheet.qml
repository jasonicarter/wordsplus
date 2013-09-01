import bb.cascades 1.0
import bb.system 1.0

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
                            progressToast.show();
                            wordsPlus.InitializeWordnik("WordList");
                            //wordsPlus.intializePlayArea();
                            //categorySheet.close();
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
                            progressToast.show();
                            var selectedItem = dataModel.data(indexPath);
                            wordsPlus.category = selectedItem.filename;
                            wordsPlus.cntlyCategory((wordsPlus.category).toLowerCase(), wordsPlus.difficulty.toString());
                            wordsPlus.intializePlayArea();
                            //categorySheet.close();
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
    attachedObjects: [
        SystemToast {
            id: progressToast
            body: "Hold on a minute, I'm doing \"stuff\"";
            onFinished: {
                categorySheet.close();
            }
        }
//        SystemProgressToast {
//            id: progressToast
//            
//            //body: "Hold on a minute, I'm doing \"stuff\""
//            onFinished: {
//                categorySheet.close();
//            }
//        }
    ]
}
