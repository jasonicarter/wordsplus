import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle
            preferredWidth: 700
            topPadding: 100
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
                    text: "arpeggio6lop by plagasul via freesound.org\n" + "sweetalertsound1 + 2 by kizilsungur via freesound.org"
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
                        text: "Website, Twitter & Email Support:"
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
                    text: "Help improve WordsPlus by sending any requests, suggestions or issues to: \n\n" + "Twitter: @jasonicarter\n" + "http://twocasualcoders.com/contact\n" + "http://facebook.com/WordsPlusGame"
                    textStyle {
                        base: aboutSheetSubTitleNormalWhite.style
                    }
                }
            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "aboutSheet"
        }
    }
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
