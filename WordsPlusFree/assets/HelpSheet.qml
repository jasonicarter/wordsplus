import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        AdWordsPlusPaid {
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container { // wordsearch
                layout: DockLayout {
                }
                background: Color.create("#272727")
                preferredWidth: 720
                preferredHeight: 100
                leftPadding: 15
                Label {
                    text: "Points:"
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: helpSheetBigBodyNormalBlue.style
                    }
                }
            } // wordsearch
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
            Container { // wordsearch
                layout: DockLayout {
                }
                background: Color.create("#272727")
                preferredWidth: 720
                preferredHeight: 100
                leftPadding: 15
                Label {
                    text: "Pausing:"
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: helpSheetBigBodyNormalBlue.style
                    }
                }
            } // wordsearch
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
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 40
                //background: Color.Black
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/r.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/e.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/a.png"
                }
                ImageView {
                    preferredHeight: 75
                    preferredWidth: 75
                    imageSource: "asset:///images/letters/selected/d.png"
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
                helpSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: helpSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: helpSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: helpSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
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