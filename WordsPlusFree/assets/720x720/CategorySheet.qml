import bb.cascades 1.0
import bb.system 1.0
import com.sample.payment 1.0

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
//            topPadding: 100
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
                        topPadding: 10
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            ImageView {
                                visible: wordsPlus.isPaid
                                imageSource: "/images/randompuzzle.png"

                            }
                            Label {
                                visible: !wordsPlus.isPaid
                                preferredWidth: 150
                                text: "Tap here to unlock."
                                multiline: true
                                touchPropagationMode: TouchPropagationMode.None
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Left
                                textStyle {
                                    base: categorySheetSubTitleNormalWhite.style
                                }
                            }
                            ImageView {
                                visible: !wordsPlus.isPaid
                                imageSource: "/images/lock.png"
                            }
                            onTouch: {
                                if (!wordsPlus.isPaid) {
                                    cateogryPayDialog.show();
                                }
                            }
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
                        text: "Internet Access Required. Powered by Wordnik.\n" 
                        multiline: true
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: categorySheetSubTitleNormalWhite.style
                        }
                    }
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
        },
        SystemDialog {
            id: cateogryPayDialog
            title: "A Change of Heart"
            body: "Dictionary puzzles, Achievements, Ranking and Theme Skins are only available with the full upgrade.\n\nWould you like to continue?"
            onFinished: {
                if (cateogryPayDialog.result == SystemUiResult.CancelButtonSelection) {
                    //on cancel do nothing
                }
                if (cateogryPayDialog.result == SystemUiResult.ConfirmButtonSelection) {
                    paymentControl.id = "28487887"
                    paymentControl.sku = "full_upgrade"
                    paymentControl.name = "WordsPlus Full Upgrade"
                    paymentControl.metadata = "full_upgrade"
                    paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                    paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
                }
            }
        },
        PaymentServiceControl {
            id: paymentControl
            property string id
            property string sku
            property string name
            property string metadata
            onPriceResponseSuccess: {
            }
            onPurchaseResponseSuccess: {
                wordsPlus.isPaid = true;
                wordsPlus.cntlyIAP(metadata, 0.99);
            }
            onExistingPurchasesResponseSuccess: {
            }
            onCheckStatusResponseSuccess: {
            }
            onInfoResponseError: {
            }
        }
    ]
}
