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
            preferredHeight: 3
            //background: Color.create("#FF8C00")
            //background: Color.create("#CC3F10")
            //background: Color.create("#00629C")
            background: Color.create("#262626")
            //background: Color.Black
        }
        Container { // whole panel
            preferredWidth: 768
            preferredHeight: 100
            //background: Color.Black
            background: Color.create("#00629C")
            Container { // image panel
                //background: Color.Yellow
                preferredWidth: 768
                preferredHeight: 150
                layout: DockLayout {
                }
                Container {
                    topPadding: 20
                    //background: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Left
                    preferredHeight: 150
                    preferredWidth: 150
                    ImageView {
                        preferredHeight: 81
                        preferredWidth: 81
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "asset:///images/share.png"
                    }
                    Label {
                        text: "Hold Me"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: btmNavPanelSubTitleNormalWhite.style
                        }
                    }
                    //}
                    contextActions: [
                        ActionSet {
                            title: "Share The Love."
                            subtitle: "HOW DO YOU BBM?"
                            ActionItem {
                                title: "Invite My Friends"
                                imageSource: "asset:///images/invite.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_invitetodownload);
                                }
                            }
                            ActionItem {
                                title: "I Love WordsPlus!"
                                imageSource: "asset:///images/heart_small.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_personalmessage);
                                }
                            }
                            ActionItem {
                                title: "I'm Busy Playing"
                                imageSource: "asset:///images/busy.png"
                                onTriggered: {
                                    wordsPlus.ControlsForBBM(bbm_statusmessage);
                                }
                            }
                        } // end of ActionSet
                    ] // end of contextActions list
                }
                Container { //play container
                    property bool isSwipe: true
                    layout: DockLayout {
                    }
                    //background: Color.Gray
                    topPadding: 20
                    //preferredHeight: 150
                    verticalAlignment: VerticalAlignment.Top
                    horizontalAlignment: HorizontalAlignment.Center
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        ImageView {
                            id: pLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/p.png"
                            onTouch: {
                                if (event.isDown()) {
                                    pLetter.imageSource = "asset:///images/letters/highlight/p.png"
                                    wordsPlus.playSound("letterSelected");
                                } else if (event.isUp()) {
                                    pLetter.imageSource = "asset:///images/letters/p.png"
                                }
                            }
                        }
                        ImageView {
                            id: lLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/l.png"
                            onTouchEnter: {
                                if (pLetter.imageSource == "asset:///images/letters/highlight/p.png") {
                                    lLetter.imageSource = "asset:///images/letters/highlight/l.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    pLetter.imageSource = "asset:///images/letters/p.png"
                                    lLetter.imageSource = "asset:///images/letters/l.png"
                                }
                            }
                        }
                        ImageView {
                            id: aLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/a.png"
                            onTouchEnter: {
                                if (lLetter.imageSource == "asset:///images/letters/highlight/l.png") {
                                    aLetter.imageSource = "asset:///images/letters/highlight/a.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    pLetter.imageSource = "asset:///images/letters/p.png"
                                    lLetter.imageSource = "asset:///images/letters/l.png"
                                    aLetter.imageSource = "asset:///images/letters/a.png"
                                }
                            }
                        }
                        ImageView {
                            id: yLetter
                            preferredHeight: 75
                            preferredWidth: 75
                            imageSource: "asset:///images/letters/y.png"
                            onTouchEnter: {
                                if (aLetter.imageSource == "asset:///images/letters/highlight/a.png") {
                                    yLetter.imageSource = "asset:///images/letters/highlight/y.png"
                                    wordsPlus.playSound("letterSelected");
                                }
                            }
                            onTouchExit: {
                                pLetter.imageSource = "asset:///images/letters/p.png"
                                lLetter.imageSource = "asset:///images/letters/l.png"
                                aLetter.imageSource = "asset:///images/letters/a.png"
                                yLetter.imageSource = "asset:///images/letters/y.png"
                                wordsPlus.intializePlayArea();
                            }
                            onTouch: {
                                if (event.isUp()) {
                                    if (yLetter.imageSource == "asset:///images/letters/highlight/y.png") {
                                        pLetter.imageSource = "asset:///images/letters/p.png"
                                        lLetter.imageSource = "asset:///images/letters/l.png"
                                        aLetter.imageSource = "asset:///images/letters/a.png"
                                        yLetter.imageSource = "asset:///images/letters/y.png"
                                        wordsPlus.intializePlayArea();
                                    }
                                }
                            }
                        }
                    }
                    Container {
                        topPadding: 87
                        horizontalAlignment: HorizontalAlignment.Center
                        overlapTouchPolicy: OverlapTouchPolicy.Allow
                        Label {
                            text: "Swipe Me"
                            //verticalAlignment: VerticalAlignment.Bottom
                            horizontalAlignment: HorizontalAlignment.Center
                            touchPropagationMode: TouchPropagationMode.None //change this later
                            textStyle {
                                base: btmNavPanelSubTitleNormalWhite.style
                            }
                        }
                    }
                } // end of letter container
                Container {
                    property bool isHome: false
                    topPadding: 20
                    //background: Color.Gray
                    preferredHeight: 150
                    preferredWidth: 150
                    horizontalAlignment: HorizontalAlignment.Right
                    ImageView {
                        preferredHeight: 81
                        preferredWidth: 81
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "asset:///images/home.png"
                    }
                    Label {
                        text: "Tap Me"
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: btmNavPanelSubTitleNormalWhite.style
                        }
                    }
                    onTouch: {
                        if (event.isDown()) {
                            isHome = true;
                        }
                        if (event.isUp() && isHome) {
                            isHome = false;
                            wordsPlus.stopTimer();
                            wordsPlus.InitializeHomePage();
                        }
                    }
                }
            } // image panel
            Container { //divider
                preferredWidth: 768
                preferredHeight: 50
                background: Color.create("#00629C")
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // whole panel
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
