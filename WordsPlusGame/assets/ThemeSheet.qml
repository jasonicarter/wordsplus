import bb.cascades 1.0
import bb.system 1.0

Page {
    property string seletedTheme
    Container {
        layout: DockLayout {
        }
        background: Color.create("#0098f0")
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        Container { //middle
            topPadding: 100
            preferredWidth: 720
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredWidth: 768
                preferredHeight: 70
                horizontalAlignment: HorizontalAlignment.Center
                background: Color.create("#272727")
                Label {
                    id: themeSwitch
                    text: "A CHANGE OF HEART"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: statsSheetBigBodyNormalBlue.style
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container {
                //background: Color.create("#272727")
                preferredHeight: 720
                ListView {
                    id: myList
                    //property string seletedTheme
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
                        } else if (selectedItem.price == "pay") {
                            //themeDialog.show();
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
                                    wordsPlus.theme = seletedTheme;
                                }
                            }
                        }
                    ]
                } //end of listview
            }
        } // end of middle container
    } // end of page
    onCreationCompleted: {
        //        var positionContainer = positionDef.createObject();
        //        position.add(positionContainer);
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.InitializeHomePage();
                themeSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: statsSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
