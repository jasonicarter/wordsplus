import bb.cascades 1.0

Container { // root Container
    id: playPuzzleRootContainer
    Container { //main container
        id: mainContainer
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        background: Color.create("#0098f0")
        preferredHeight: 1280
        Container {
            layout: AbsoluteLayout {
            }
            ImageView {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 500
                    positionY: 0
                }
                objectName: "puzzleHeart"
                imageSource: "asset:///images/heart_large.png"
            }
        }
//        AdContainer {
//            horizontalAlignment: HorizontalAlignment.Center
//            verticalAlignment: VerticalAlignment.Top
//        }
        Container { // center container
            id: centerContainer
            objectName: "centerPuzzleContainer"
            //background: Color.Green
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                id: puzzleInfo
                layout: DockLayout {
                }
                //background: Color.Green
                topPadding: 100
                leftPadding: 20
                Container {
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
                        //text: "TIME: 2:00"
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: puzzlePageSubTitleNormalWhite.style
                        }
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.RightToLeft
                    }
                    topPadding: 50
                    Label {
                        id: letterDisplay
                        text: wordsPlus.selectedLetters
                        //text: "TEST"
                        textStyle {
                            base: puzzlePageBurntOrgange.style
                        }
                    }
                }
            }
            Container {
                id: playAreaContainer
                objectName: "playAreaContainer"
                //background: Color.Gray
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                topMargin: 70
                preferredWidth: 720
                preferredHeight: preferredWidth
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            }
            Container { // Container for words to find
                id: wordsToFind
                objectName: "wordsToFind"
                topMargin: 20
                //leftPadding: 20
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                //preferredWidth: 720
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
