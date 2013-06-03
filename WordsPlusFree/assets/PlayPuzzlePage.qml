import bb.cascades 1.0
import bb.cascades.advertisement 1.0

Container { // root Container
    id: playPuzzleRootContainer
    objectName: "playPuzzleRootContainer"
    Container { //main container
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        preferredHeight: 1280
        ThemeOtherPages {
        }
        Container { //highlight timer only for school theme
            topPadding: 60
            ImageView {
                id: highlightTime
                imageSource: {
                    if (wordsPlus.theme == "school") {
                        "theme/" + wordsPlus.theme + "/highlight_time.png"
                    } else {
                        ""
                    }
                }
            }
        }
        Container { //highlight word list only for school theme
            bottomPadding: 120
            verticalAlignment: VerticalAlignment.Bottom
            ImageView {
                id: highlightWords
                //imageSource: "theme/" + "school" + "/highlight_words.png"
                imageSource: {
                    if (wordsPlus.theme == "school") {
                        "theme/" + wordsPlus.theme + "/highlight_words.png"
                    } else {
                        ""
                    }
                }
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
                            base: puzzlePageWhite.style
                            //base: puzzlePageBurntOrgange.style
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
                topMargin: 40
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
            visible: !wordsPlus.isPaid
            horizontalAlignment: HorizontalAlignment.Center
            Banner {
                //zoneId: 117145 //test id
                //zoneId: 155255
                zoneId: 160884 //romain
                //zoneId: 155697 //romain2
                //zoneId: 146983 //romain3
                //zoneId: 185563 //wordsplus 2
                //zoneId: 185564 //wordsplus 3 native
                refreshRate: 30
                preferredWidth: 720
                preferredHeight: 100
                transitionsEnabled: true
                placeHolderURL: "images/AdBanner.png"
                borderColor: Color.Blue
                borderWidth: 2
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
            }
        }
        Container {
            id: btmNav
            verticalAlignment: VerticalAlignment.Bottom
            BtmNavPanel {
                verticalAlignment: VerticalAlignment.Bottom
            }
        }
    } // main container
    onCreationCompleted: {
        wordsPlus.puzzleCompleted.connect(playPuzzleRootContainer.handleSignal)
    }
    function handleSignal() {
        wordsPlus.stopTimer();
        var completedSheet = puzzleCompletedSheetDefinition.createObject();
        completedSheet.open();
    }
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
            id: puzzlePageWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#fafafa")
            //fontSize: FontSize.Large
        },
        TextStyleDefinition {
            id: puzzlePageBurntOrgange
            base: SystemDefaults.TextStyles.BodyText
            //fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#CC3F10")
            fontSize: FontSize.Large
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
        },
        ComponentDefinition {
            id: puzzleCompletedSheetDefinition
            Sheet {
                id: puzzleCompletedSheet
                PuzzleCompletedSheet {
                }
            }
        }
    ]
}// root Container
