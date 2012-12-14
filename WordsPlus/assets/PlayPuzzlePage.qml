import bb.cascades 1.0

Container { // root Container
    id: playPuzzleRootContainer
    Container { //main container
        id: mainContainer
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        background: Color.Black
        preferredWidth: 768
        preferredHeight: 1280
        Container {
            id: title
            verticalAlignment: VerticalAlignment.Top
            background: Color.create("#00629C")
            preferredWidth: 768
            ImageView {
                imageSource: "asset:///images/titles/withpuzzles.png"
            }
        }
        Container { // center container
            id: centerContainer
            objectName: "centerPuzzleContainer"
            //background: Color.Green
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                id: puzzleInfo
                layout: DockLayout {
                }
                topPadding: 125
                //background: Color.Green
                preferredWidth: 720
                Label {
                    id: timerDisplay
                    text: {
                        if (wordsPlus.difficulty == 8) {
                            "HARD: " + wordsPlus.time
                        } else if (wordsPlus.difficulty == 4) {
                            "MEDIUM: " + wordsPlus.time
                        } else if (wordsPlus.difficulty == 2) {
                            "EASY: " + wordsPlus.time
                        }
                    }
                    //text: "TIME: "
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: puzzlePageSubTitleBlue.style
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.RightToLeft
                    }
                    horizontalAlignment: HorizontalAlignment.Right
                    ImageView {
                        id: heart
                        objectName: "puzzleHeart"
                        imageSource: "asset:///images/heart.png"
                    }
                    Label {
                        id: letterDisplay
                        text: wordsPlus.selectedLetters
                        horizontalAlignment: HorizontalAlignment.Right
                        textStyle {
                            base: puzzlePageBurntOrgange.style
                        }
                    }
                }
            }
            Container {
                id: playAreaContainer
                objectName: "playAreaContainer"
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                topMargin: 20
                bottomPadding: 30
                preferredWidth: 750
                preferredHeight: preferredWidth
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                //background: Color.Gray
            }
            Container { // Container for words to find
                id: wordsToFind
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
        Container {
            id: btmNav
            verticalAlignment: VerticalAlignment.Bottom
            BtmNavPanel {
                verticalAlignment: VerticalAlignment.Bottom
            }
        }
    } // main container
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: puzzlePageBodyWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: puzzlePageSubTitleBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: puzzlePageSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: puzzlePageBurntOrgange
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#CC3F10")
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
