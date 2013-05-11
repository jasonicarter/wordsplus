import bb.cascades 1.0

Container { // root Container
    id: playPuzzleRootContainer
    objectName: "playPuzzleRootContainer"
    Container { //main container
        layout: DockLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        Container { //highlight word list only for school theme
            visible: false
            bottomPadding: 120
            verticalAlignment: VerticalAlignment.Top
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
        Container { // Container for words to find
            id: wordsToFind
            objectName: "wordsToFind"
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
        }
        Container{
            id: puzzleShortcuts
            opacity: 0
            leftPadding: 10
            Label {
                text: "<html><span style='font-size:xx-small'><b>SHORTCUTS:</b> p [play] h [home]</span></html>" + "<html><span style='font-size:xx-small'> menu [Swipe down from the top]</span></html>"
                textStyle {
                    base: btmNavPanelSmallNormalWhite.style
                }
            }
        }
        Container {
            id: puzzleInfo
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            opacity: 0
            topPadding: 10
            leftPadding: 10
            //preferredWidth: 720
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
                        base: puzzlePagePuzzleInfoText.style
                    }
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.RightToLeft
                }
                leftPadding: 20
                horizontalAlignment: HorizontalAlignment.Right
                Label {
                    id: letterDisplay
                    text: wordsPlus.selectedLetters
                    //text: "TEST"
                    textStyle {
                        base: puzzlePageBodyBlack.style
                    }
                    onTextChanged: {
                        if(wordsPlus.selectedLetters != "") {
                            puzzleInfo.opacity = 1
                            puzzleShortcuts.opacity = 1
                            wordsToFind.opacity = 0.3
                        } else if (wordsPlus.selectedLetters == "") {
                            puzzleInfo.opacity = 0
                            puzzleShortcuts.opacity = 0
                            wordsToFind.opacity = 1
                        }
                        
                    }
                }
            }
        }
        Container { // center container
            id: centerContainer
            objectName: "centerPuzzleContainer"
            //background: Color.Green
            horizontalAlignment: HorizontalAlignment.Center
            Divider {
                opacity: 0
            }
            Container {
                id: playAreaContainer
                objectName: "playAreaContainer"
                //background: Color.Gray
                topMargin: 100
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }

                preferredWidth: 720
                preferredHeight: preferredWidth
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            }
        } //center container
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
            id: puzzlePageBodyBlack
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#272727")
            fontSize: FontSize.Large
        },
        TextStyleDefinition {
            id: puzzlePagePuzzleInfoText
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#fafafa")
            fontSize: FontSize.Large
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
