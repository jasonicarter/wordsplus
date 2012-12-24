import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#0098f0")
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            layout: AbsoluteLayout {
            }
            ImageView {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 500
                    positionY: 0
                }
                imageSource: "asset:///images/heart_large.png"
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
            Container { //music section
                topMargin: 50
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Music:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                }
                Label {
                    multiline: true
                    text: "arpeggio6lop by plagasul via freesound.org\n" +
                    "sweetalertsound1 + 2 by kizilsungur via freesound.org"
                    textStyle {
                        base: aboutSheetSubTitleNormalWhite.style
                    }
                }
            }
            Container { //website section
                topMargin: 50
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
                    text: "Having problems? Want to see a new feature added? \n\n" + "Help improve WordsPlus by sending any requests, suggestions or issues to: " + "twocasualcoders@gmail.com"
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
                topPadding: 50
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/i.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/m.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/p.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/r.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/o.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/v.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/e.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/m.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/e.png"
                }
            }
        }
    }
    actions: [
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
        },
        Invocation {
            id: invokeLeaveReview
            query: InvokeQuery {
                mimeType: "application/x-bb-appworld"
                uri: "appworld://content/19132685"
            }
        }
    ]
}
