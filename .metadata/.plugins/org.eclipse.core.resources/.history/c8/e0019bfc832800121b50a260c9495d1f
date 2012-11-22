import bb.cascades 1.0

    Page {
        id: playPuzzlePage
        actions: [
            ActionItem {
                title: "New Puzzle"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    wordsPlus.intializePlayArea();
                }
            },
            ActionItem {
                title: "Category"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    wordsPlus.stopTimer();
                    categorySheet.open();
                }
            }
        ]
        Container {
            id: playPuzzleRootContainer
            layout: DockLayout {
            }
            horizontalAlignment: HorizontalAlignment.Center
            background: Color.Black
            preferredWidth: 768
            Container {
                background: Color.create("#00629C")
                preferredWidth: 768
                Label {
                    text: "Puzzles."
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: textNormalWhite.style
                    }
                }
            }
            Container {
                layout: DockLayout {
                }
                topPadding: 125
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
                Container {
                    horizontalAlignment: HorizontalAlignment.Left
                    Label {
                        id: timerDisplay
                        text: "TIME: " + wordsPlus.time
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
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
            }
            Container { // Container for words to find
                bottomPadding: 100
                objectName: "wordsToFind"
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
            }
            Container { //divider
                preferredWidth: 768
                preferredHeight: 50
                background: Color.create("#00629C")
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // Page
        attachedObjects: [
            TextStyleDefinition {
                id: textNormalWhite
                base: SystemDefaults.TextStyles.BigText
                color: Color.create("#fafafa")
            },
            TextStyleDefinition {
                id: subTitleNormalWhite
                base: SystemDefaults.TextStyles.SubtitleText
                fontWeight: FontWeight.Normal
                fontFamily: "Times New Roman"
                color: Color.create("#fafafa")
            },
            TextStyleDefinition {
                id: subTitleNormalBlue
                base: SystemDefaults.TextStyles.SubtitleText
                fontWeight: FontWeight.Normal
                fontFamily: "Times New Roman"
                color: Color.create("#0098f0")
            },
            Sheet {
                id: categorySheet
                CategorySheet {
                }
            }
        ]
    } //end of page
