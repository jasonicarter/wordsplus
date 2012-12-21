import bb.cascades 1.0

Container {
    property int bbm_personalmessage: 6
    property int bbm_statusmessage: 7
    property int bbm_invitetodownload: 8
    Container { // bottom panel
        background: Color.create("#0098f0")
        //verticalAlignment: VerticalAlignment.Bottom
        preferredHeight: 150
        preferredWidth: 768
        layout: DockLayout {
        }
        Container {
            preferredWidth: 768
            preferredHeight: 45
            background: Color.create("#262626")
            verticalAlignment: VerticalAlignment.Bottom
        }
        Container { // profile
            preferredHeight: 150
            preferredWidth: 150
            //background: Color.create("#0091f0")
            horizontalAlignment: HorizontalAlignment.Left
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    topMargin: 0
                    bottomMargin: 0
                    imageSource: "asset:///images/profileEdit_blk.png"
                }
                Label {
                    topMargin: 0
                    bottomMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "HOLD ME"
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    }
                }
            }
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
                    ActionItem {
                        title: "Leave A Review"
                        imageSource: "asset:///images/review.png"
                        onTriggered: {
                            invokeLeaveReview.trigger("bb.action.OPEN");
                        }
                    }
                } // end of ActionSet
            ] // end of contextActions list
        } // end of profile
        Container { // home
            property bool isHome: false
            preferredHeight: 150
            preferredWidth: 150
            //background: Color.create("#0091f0")
            horizontalAlignment: HorizontalAlignment.Right
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    topMargin: 0
                    bottomMargin: 0
                    imageSource: "asset:///images/home_blk.png"
                }
                Label {
                    topMargin: 0
                    bottomMargin: 0
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "TAP ME"
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
            }
            onTouch: {
                if (event.isDown()) {
                    isHome = true;
                    wordsPlus.playSound("letterSelected");
                }
                if (event.isUp() && isHome) {
                    isHome = false;
                    wordsPlus.stopTimer();
                    wordsPlus.InitializeHomePage();
                }
            }
        } // end of home
        Container {
            preferredHeight: 150
            preferredWidth: 400
            //background: Color.create("#0091f0")
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    id: pLetter
                    preferredHeight: 75
                    preferredWidth: 75
                    rightMargin: 0
                    leftMargin: 0
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
                    rightMargin: 0
                    leftMargin: 0
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
                    rightMargin: 0
                    leftMargin: 0
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
                    rightMargin: 0
                    leftMargin: 0
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
            } // end of letters
            Container {
                topPadding: 40
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "SWIPE ME"
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
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
            id: btmNavPanelSmallNormalWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Invocation {
            id: invokeLeaveReview
            query: InvokeQuery {
                mimeType: "application/x-bb-appworld"
                uri: "appworld://content/19132685"
            }
        }
    ]
}
