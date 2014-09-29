import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        horizontalAlignment: HorizontalAlignment.Center
        Container { //middle
            preferredWidth: 700
            topPadding: 100
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                DropDown {
                    id: statsDropDown
                    title: "Review"
                    Option {
                        id: dropDwnYourStats
                        text: "YOUR STATS"
                        description: "Best time, # of words, games played, etc"
                        selected: true
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.visible = false;
                                leaderBoard.removeAll();
                                localStats.visible = true;
                            }
                        }
                    }
                    Option {
                        id: dropDwnYourAchievements
                        enabled: wordsPlus.isPaid
                        text: "ACHIEVEMENTS"
                        description: "Get them all!"
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var achievementContainer = achievementDef.createObject();
                                leaderBoard.add(achievementContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
                                wordsPlus.cntlyScoreloop("achievements");
                            }
                        }
                    }
                    Option {
                        id: dropDwnTopLeaders
                        text: "TOP 50 LEADERS"
                        description: "All-time top notch word finders."
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var LeadersContainer = leaderDef.createObject();
                                leaderBoard.add(LeadersContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
                                wordsPlus.cntlyScoreloop("leaders");
                            }
                        }
                    }
                    Option {
                        id: dropDwnYourPosition
                        enabled: wordsPlus.isPaid
                        text: "YOUR POSITION"
                        description: "How do you measure up against the rest?"
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var positionContainer = positionDef.createObject();
                                leaderBoard.add(positionContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
                                wordsPlus.cntlyScoreloop("ranking");
                            }
                        }
                    }
                    Option {
                        id: dropDwnBuddyPosition
                        enabled: wordsPlus.isPaid
                        text: "FRIENDS"
                        description: "See how your friends are doing."
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var buddyContainer = buddyListDef.createObject();
                                leaderBoard.add(buddyContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
                                wordsPlus.cntlyScoreloop("friends");
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
                    preferredHeight: 800
                    attachedObjects: [
                        ComponentDefinition {
                            id: leaderDef
                            source: "TopLeaderboard.qml"
                        },
                        ComponentDefinition {
                            id: positionDef
                            source: "PositionLeaderboard.qml"
                        },
                        ComponentDefinition {
                            id: achievementDef
                            source: "Achievements.qml"
                        },
                        ComponentDefinition {
                            id: buddyListDef
                            source: "BuddyListLeaderboard.qml"
                        }
                    ]
                }
                ScrollView {
                    touchPropagationMode: TouchPropagationMode.None //prevent user from scrolling the local stats
                    Container {
                        id: localStats
                        //preferredHeight: 800
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
                                text: "Total # of Words Found: "
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
                    } // local stats
                }
            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "statsSheet"
        }
    }
    attachedObjects: [
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
        }
    ]
}
