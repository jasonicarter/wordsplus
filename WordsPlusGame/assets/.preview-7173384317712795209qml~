import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        Container {
            opacity: wordsPlus.achievedAward
            preferredWidth: 768
            preferredHeight: 70
            topPadding: 10
            background: Color.create("#FFD700")
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                id: achievementWon
                text: "Achievement Won!"
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: statsSheetBigBodyNormalBlue.style
                }
            }
        }
        Container { //middle
            topPadding: 100
            preferredWidth: 720
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            //background: Color.Gray

            Container {
                id: localStats
                Container { // time
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 100
                    leftPadding: 15
                    TextArea {
                        editable: false
                        text: "Your Time/Best Time: "
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
                            text: wordsPlus.lastPuzzleTime + " / " + wordsPlus.puzzleCompletedTime
                            //text: "11:59 / 09:34"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // time
                Divider {
                    opacity: 0
                }
                Container { // ranking
                    background: Color.create("#272727")
                    preferredWidth: 720
                    preferredHeight: 650
                    //leftPadding: 15
                    SegmentedControl {
                        id: segmentedRankingCrtl
                        preferredWidth: 710
                        Option {
                            id: ranking
                            text: "Ranking"
                            value: "ranking"
                            selected: true
                        }
                        Option {
                            id: achievements
                            text: "Achievements"
                            value: "achievements"
                        }
                        onSelectedIndexChanged: {
                            if (segmentedRankingCrtl.selectedValue == "achievements") {
                                position.visible = false;
                                awards.visible = true;
                                awards.removeAll();
                                var awardsContainer = achievementDef.createObject();
                                awards.add(awardsContainer);
                            } else if (segmentedRankingCrtl.selectedValue == "ranking") {
                                awards.visible = false;
                                position.visible = true;
                                position.removeAll();
                                var positionContainer = positionDef.createObject();
                                position.add(positionContainer);
                            }
                        }
                    }
                    Container {
                        id: position
                        //background: Color.LightGray
                        preferredWidth: 720
                        //preferredHeight: 500
                    }
                    Container {
                        id: awards
                        //background: Color.LightGray
                        preferredWidth: 720
                        //preferredHeight: 500
                    }
                } // end of ranking
            }
        } // end of middle container
    } // end of page
    onCreationCompleted: {
        var positionContainer = positionDef.createObject();
        position.add(positionContainer);
    }
    actions: [
        ActionItem {
            title: "Play Again"
            imageSource: "asset:///images/play.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.intializePlayArea();
                puzzleCompletedSheet.close();
            }
        },
        ActionItem {
            title: "Home"
            imageSource: "asset:///images/home.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.InitializeHomePage();
                puzzleCompletedSheet.close();
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
        },
        ComponentDefinition {
            id: achievementDef
            source: "Achievements.qml"
        },
        ComponentDefinition {
            id: positionDef
            source: "PositionLeaderboard.qml"
        }
    ]
}
