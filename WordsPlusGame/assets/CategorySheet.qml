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
                            text: "Fancy New Words..."
                            editable: false
                            touchPropagationMode: TouchPropagationMode.None
                            textStyle {
                                color: Color.create("#0098f0")
                            }
                        }
                    }
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        topPadding: 25
                        ImageView {
                            imageSource: "/images/randompuzzle.png"

                        }
                        Button {
                            enabled: wordsPlus.isPaid
                            text: "Create Puzzle"
                            onClicked: {
                                progressToast.show();
                                wordsPlus.InitializeWordnik("WordList");
                                wordsPlus.cntlyDictionaryPuzzle();
                                //wordsPlus.intializePlayArea();
                                //categorySheet.close();
                            }
                        }
                    }
                    Label {
                        text: "Internet Access Required. Powered by Wordnik.\n" + "NOTE: Random dictionary words. Some words may not be suitable for all ages."
                        multiline: true
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: categorySheetSubTitleNormalWhite.style
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
                            text: "OR 10+ Categories:"
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
        TextStyleDefinition {
            id: categorySheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        SystemToast {
            id: progressToast
            body: "Please wait a few seconds, I'm doing \"stuff\""
            onFinished: {
                categorySheet.close();
            }
        }
    ]
}
