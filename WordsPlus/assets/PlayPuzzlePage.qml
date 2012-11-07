import bb.cascades 1.0

Container { // root Container
    id: playPuzzleRootContainer
    Container { //main container
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        background: Color.Black
        preferredWidth: 768
        preferredHeight: 1280
        Container {
            verticalAlignment: VerticalAlignment.Top
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "Puzzles."
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                textStyle {
                    base: puzzlePageTextNormalWhite.style
                }
            }
        }
        Container { // center container
            //background: Color.Green
            horizontalAlignment: HorizontalAlignment.Center
            //verticalAlignment: VerticalAlignment.Center
            Container {
                topPadding: 125
                horizontalAlignment: HorizontalAlignment.Left
                Label {
                    id: timerDisplay
                    text: "TIME: " + wordsPlus.time
                    textStyle {
                        base: puzzlePageSubTitleNormalWhite.style
                    }
                }
            }
            Container {
                objectName: "playAreaContainer"
                bottomPadding: 50
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                topMargin: 30
                preferredWidth: 720
                preferredHeight: preferredWidth
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                //background: Color.Gray
            }
            Container { // Container for words to find
                objectName: "wordsToFind"
                //background: Color.Yellow
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
            }
        } //center container
        BtmNavPanel { // bottom panel
            verticalAlignment: VerticalAlignment.Bottom
        }
    } // main container
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: puzzlePageTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: puzzlePageSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: puzzlePageSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Sheet {
            id: aboutSheet
            AboutSheet {
            }
        },
        Sheet {
            id: helpSheet
            HelpSheet {
            }
        },
        Sheet {
            id: settingsSheet
            SettingsSheet {
            }
        }
    ]
}// root Container
