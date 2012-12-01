import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            ImageView {
                imageSource: "asset:///images/titles/wordsplusversion.png"
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container { //developer section
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Game Design & Programming:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                }
                Label {
                    text: "by Jason I. Carter"
                    textStyle {
                        base: aboutSheetSubTitleNormalWhite.style
                    }
                }
            }
            Container { //website section
                topMargin: 100
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Website & Email Support:"
                        touchPropagationMode: TouchPropagationMode.None
                        editable: false
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                }
                Label {
                    leftPadding: 25
                    multiline: true
                    text: "Having problems? Want to see a new feature added? \n\n" + 
                        "Help improve WordsPlus by sending any requests, suggestions or issues to: " +
                        "twocasualcoders@gmail.com"
                    textStyle {
                        base: aboutSheetSubTitleNormalWhite.style
                    }
                }
                TextArea {
                    text: "www.twocasualcoders.com"
                    leftPadding: 0
                    editable: false
                    inputMode: TextAreaInputMode.Text
                    textStyle {
                        base: aboutSheetSubTitleNormalWhite.style
                    }
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                rightPadding: 15
                topPadding: 100
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    rightPadding: 20
                    //background: Color.Black
                    ImageView {
                        imageSource: "asset:///images/men_at_work.png"
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    topPadding: 40
                    //background: Color.Black
                    ImageView {
                        imageSource: "asset:///images/letters/selected/i.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/m.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/p.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/r.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/o.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/v.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/e.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/m.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/e.png"
                    }
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
    actions: [
//        InvokeActionItem {
//            title: "Website"
//            imageSource: "asset:///images/earth.png"
//            ActionBar.placement: ActionBarPlacement.OnBar
//            query {
//                mimeType: "text/html"
//                uri: "http://www.twocasualcoders.com"
//                invokeActionId: "bb.action.OPEN"
//            }
//        },
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.startTimer();
                aboutSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: aboutSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: aboutSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: aboutSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: aboutSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
