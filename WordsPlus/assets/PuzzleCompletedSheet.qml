import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#0098f0")
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            layout: AbsoluteLayout {
            }
            ImageView {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 500
                    positionY: 0
                }
                imageSource: "asset:///images/heart_large.png"
            }
        }
        AdContainer {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
        }
        //                Container {
        //                    preferredHeight: 100
        //                    preferredWidth: 768
        //                    background: Color.White
        //                }
        Container { //middle
            topPadding: 100
            preferredWidth: 720
            //preferredHeight: 900
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            //background: Color.Gray
            Container {
                Container {
                    id: localStats
                    //visible: false
                    Label {
                        text: "PUZZLE COMPLETED!"
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: statsSheetBigBodyNormalWhite.style
                        }
                    }
                    Container { // time
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Puzzle Time: "
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
                                text: wordsPlus.lastPuzzleTime
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
                    Container { // time
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Your Best Time: "
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
            }
        } // end of middle container
        //        Container {
        //            preferredWidth: 720
        //            bottomPadding: 200
        //            rightPadding: 15
        //            verticalAlignment: VerticalAlignment.Center
        //            horizontalAlignment: HorizontalAlignment.Center
        //            //background: Color.create("#22fafafa")
        //            //visible: wordsplus.getAchievedAward
        //            overlapTouchPolicy: OverlapTouchPolicy.Allow
        //            ImageView {
        //                horizontalAlignment: HorizontalAlignment.Right
        //                imageSource: "asset:///images/awardNotification.png"
        //            }
        //        }
    } // end of page
    onCreationCompleted: {
        var positionContainer = positionDef.createObject();
        position.add(positionContainer);
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.intializePlayArea();
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
