import bb.cascades 1.0

Container {
    property int bbm_personalmessage: 6
    property int bbm_statusmessage: 7
    property int bbm_invitetodownload: 8
    Container { // bottom panel
        background: Color.Gray
        verticalAlignment: VerticalAlignment.Bottom
        Container {
            preferredWidth: 768
            preferredHeight: 5
            background: Color.create("#FF8C00")
        }
        Container {
            preferredWidth: 768
            preferredHeight: 200
            background: Color.Black
            Container {
                //background: Color.Yellow
                preferredWidth: 768
                preferredHeight: 150
                layout: DockLayout {
                }
                Container { // BBM Share
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    Container {
                        ImageView {
                            preferredHeight: 100
                            preferredWidth: 100
                            imageSource: "asset:///images/test.png"
                        }
                        Label {
                            text: "hold me"
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle {
                                base: btmNavPanelSubTitleNormalWhite.style
                            }
                        }
                    }
                    contextActions: [
                        ActionSet {
                            title: "Share The Love."
                            subtitle: "HOW DO YOU BBM?"
                            ActionItem {
                                title: "Invite My Friends"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_invitetodownload);
                                }
                            }
                            ActionItem {
                                title: "I Love WordsPlus!"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_personalmessage);
                                }
                            }
                            ActionItem {
                                title: "I'm Busy Playing"
                                imageSource: "asset:///images/grow_action.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_statusmessage);
                                }
                            }
                        } // end of ActionSet
                    ] // end of contextActions list
                } // share
                Container {
                    topPadding: 15
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        leftPadding: 20
                        verticalAlignment: VerticalAlignment.Center
                        touchPropagationMode: TouchPropagationMode.None //change this later
                        ImageView {
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/p.png"
                        }
                        ImageView {
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/l.png"
                        }
                        ImageView {
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/a.png"
                        }
                        ImageView {
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/y.png"
                        }
                    }
                    Label {
                        text: "swipe me"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        touchPropagationMode: TouchPropagationMode.None //change this later
                        textStyle {
                            base: btmNavPanelSubTitleNormalWhite.style
                        }
                    }
                    onTouch: {
                        wordsPlus.intializePlayArea();
                    }
                }
                Container {
                    //background: Color.Gray
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Right
                    Container {
                        horizontalAlignment: HorizontalAlignment.Center
                        ImageView {
                            preferredHeight: 100
                            preferredWidth: 100
                            imageSource: "asset:///images/test.png"
                        }
                        Label {
                            text: "tap me"
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle {
                                base: btmNavPanelSubTitleNormalWhite.style
                            }
                        }
                    }
                    onTouch: {
                        wordsPlus.InitializeHomePage();
                    }
                }
            }
        }
    } // bottom panel
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: btmNavPanelTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: btmNavPanelSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: btmNavPanelSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
