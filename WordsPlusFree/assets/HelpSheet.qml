import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle
            preferredWidth: 700
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container { //points section
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Points:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: helpSheetBigBodyNormalBlue.style
                        }
                    }
                }
            }
            Label {
                text: "You gain points by completing puzzles. The higher the difficulty level " + "and the faster the time completed, the more points you'll be rewarded. Different categories to not provide more points."
                multiline: true
                touchPropagationMode: TouchPropagationMode.None
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Left
                textStyle {
                    base: helpSheetSubTitleNormalWhite.style
                }
            }
            Divider {
                opacity: 0
            }
            Container { //pausing section
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Pausing:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: helpSheetBigBodyNormalBlue.style
                        }
                    }
                }
            }
            Label {
                bottomMargin: 50
                text: "During your hours of continuous game play you may feel the need to use the rest room. " + "For such occasions, you can pause your intense game by 'minimizing' or 'thumbnailing' WordsPlus. " + "When you return, just re-open and your game will resume where you left off."
                multiline: true
                touchPropagationMode: TouchPropagationMode.None
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Left
                textStyle {
                    base: helpSheetSubTitleNormalWhite.style
                }
            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "helpSheet"
        }
    } //end of main container
    attachedObjects: [
        TextStyleDefinition {
            id: helpSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: helpSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
