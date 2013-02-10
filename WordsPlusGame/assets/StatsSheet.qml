import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        //background: Color.create("#0098f0")
        //preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        Container { //highlight word list only for school theme
            ImageView {
                id: highlightWords
                //imageSource: "theme/" + "school" + "/highlight_list.png"
                imageSource: {
                    if (wordsPlus.theme == "school") {
                        "theme/" + wordsPlus.theme + "/highlight_list.png"
                    } else {
                        ""
                    }
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
                preferredWidth: 720
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
                        text: "ACHIEVEMENTS"
                        description: "Get them all!"
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var achievementContainer = achievementDef.createObject();
                                leaderBoard.add(achievementContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
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
                            }
                        }
                    }
                    Option {
                        id: dropDwnYourPosition
                        text: "YOUR POSITION"
                        description: "How do you measure up against the rest?"
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var positionContainer = positionDef.createObject();
                                leaderBoard.add(positionContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
                            }
                        }
                    }
                    Option {
                        id: dropDwnBuddyPosition
                        text: "FRIENDS"
                        description: "See how your friends are doing."
                        onSelectedChanged: {
                            if (selected == true) {
                                leaderBoard.removeAll();
                                var buddyContainer = buddyListDef.createObject();
                                leaderBoard.add(buddyContainer);
                                localStats.visible = false;
                                leaderBoard.visible = true;
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
