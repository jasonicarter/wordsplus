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
            ImageView {
                imageSource: "asset:///images/titles/tobragabout.png"
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            //background: Color.Gray
            Container {
                preferredWidth: 720
                DropDown {
                    id: statsDropDown
                    title: "Stats"
                    Option {
                        id: dropDwnYourStats
                        text: "YOUR STATS"
                        description: "Best time, # of words, etc"
                        selected: true
                        onSelectedChanged: {
                            if (selected == true) {
                                localStats.visible = true;
                                leaderBoard.visible = false;
                                leaderBoard.removeAll();
                            }
                        }
                    }
                    Option {
                        id: dropDwnTopLeaders
                        text: "TOP LEADERS"
                        description: "All-time top notch word finders. "
                        onSelectedChanged: {
                            if (selected == true) {
                                var LeadersContainer = leaderDef.createObject();
                                leaderBoard.add(LeadersContainer);
                                leaderBoard.visible = true;
                                localStats.visible = false;
                            }
                        }
                    }
                    Option {
                        id: dropDwnYourPosition
                        text: "YOUR POSITION"
                        description: "How do you measure up to the rest?"
                        onSelectedChanged: {
                            if (selected == true) {
                                localStats.visible = false;
                                leaderBoard.removeAll();
                                var positionContainer = positionDef.createObject();
                                leaderBoard.add(positionContainer);
                            }
                        }
                    }
                }
            } //diff buttons
            Divider {
                opacity: 0
            }
            Container {
                Container {
                    id: leaderBoard
                    visible: false
                    //background: Color.LightGray
                    preferredWidth: 720
                    preferredHeight: 800
                    attachedObjects: [
                        ComponentDefinition {
                            id: leaderDef
                            source: "TopLeaderboard.qml"
                        },
                        ComponentDefinition {
                            id: positionDef
                            source: "PositionLeaderboard.qml"
                        }
                    ]
                }
                Container {
                    id: localStats
                    //visible: false
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
            title: "Close"
            imageSource: "asset:///images/close.png"
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
