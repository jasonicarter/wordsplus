import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "Your Stats."
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: statsSheetBigTextNormalWhite.style
                }
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            //background: Color.Gray
            Container {
                Container { // points
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Points Won: "
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: statsSheetBigBodyNormalBlue.style
                        }
                    }
                    Container {
                        rightPadding: 15
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        Label {
                            text: wordsPlus.score
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // points
                Divider {
                    opacity: 0
                }
                Container { // found
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Total # Words Found: "
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: statsSheetBigBodyNormalBlue.style
                        }
                    }
                    Container {
                        rightPadding: 15
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        Label {
                            text: wordsPlus.totalWordsFound
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // found
                Divider {
                    opacity: 0
                }
                Container { // played
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Total # of Games Played: "
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: statsSheetBigBodyNormalBlue.style
                        }
                    }
                    Container {
                        rightPadding: 15
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        Label {
                            text: wordsPlus.gamesPlayed
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // played
                Divider {
                    opacity: 0
                }
                Container { // time
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Best Puzzle Time: "
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: statsSheetBigBodyNormalBlue.style
                        }
                    }
                    Container {
                        rightPadding: 15
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        Label {
                            text: wordsPlus.puzzleCompletedTime
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // time
            }
        }
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    actions: [
        ActionItem {
            title: "Your Stats"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
            }
        },
        ActionItem {
            title: "T20 This Week"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
            }
        },
        ActionItem {
            title: "T20 This Month"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
            }
        },
        ActionItem {
            title: "T20 All Time"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
            }
        },
        ActionItem {
            title: "Close"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.startTimer();
                statsSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: statsSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
