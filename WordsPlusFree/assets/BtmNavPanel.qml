import bb.cascades 1.0

Container {
    property int bbm_personalmessage: 6
    property int bbm_statusmessage: 7
    property int bbm_invitetodownload: 8
    Container { // bottom panel
        //background: Color.create("#0098f0")
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
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container { // profile
            preferredHeight: 150
            preferredWidth: 150
            //background: Color.create("#0091f0")
            horizontalAlignment: HorizontalAlignment.Left
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    id: profileImage
                    objectName: "rotateProfileImage"
                    topMargin: 0
                    bottomMargin: 0
                    imageSource: "images/profileEdit_blk.png"
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
                        profileImage.imageSource = "images/profileEdit_white.png"
                        wordsPlus.playSound("letterSelected");
                    }
                    if (event.isUp()) {
                        profileImage.imageSource = "images/profileEdit_blk.png"
                        //shareSheet.open();
                    }
                }
                onTouchExit: {
                    profileImage.imageSource = "images/profileEdit_blk.png"
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
                    id: homeImage
                    objectName: "rotateHomeImage"
                    topMargin: 0
                    bottomMargin: 0
                    imageSource: "images/home_blk.png"
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
                    homeImage.imageSource = "images/home_white.png"
                    wordsPlus.playSound("letterSelected");
                }
                if (event.isUp() && isHome) {
                    isHome = false;
                    homeImage.imageSource = "images/home_blk.png"
                    wordsPlus.stopTimer();
                    wordsPlus.InitializeHomePage();
                }
            }
            onTouchExit: {
                homeImage.imageSource = "images/home_blk.png"
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
                    imageSource: "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                    onTouch: {
                        if (event.isDown()) {
                            pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/highlight/p.png"
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                        }
                    }
                }
                ImageView {
                    id: lLetter
                    preferredHeight: 75
                    preferredWidth: 75
                    rightMargin: 0
                    leftMargin: 0
                    imageSource: "asset:///theme/" + "wordsPlus" + "/letters/l.png"
                    onTouchEnter: {
                        if (pLetter.imageSource == "asset:///theme/" + "wordsPlus" + "/letters/highlight/p.png") {
                            lLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/highlight/l.png"
                            wordsPlus.playSound("letterSelected");
                        }
                    }
                    onTouch: {
                        if (event.isUp()) {
                            pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                            lLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/l.png"
                        }
                    }
                }
                ImageView {
                    id: aLetter
                    preferredHeight: 75
                    preferredWidth: 75
                    rightMargin: 0
                    leftMargin: 0
                    imageSource: "asset:///theme/" + "wordsPlus" + "/letters/a.png"
                    onTouchEnter: {
                        if (lLetter.imageSource == "asset:///theme/" + "wordsPlus" + "/letters/highlight/l.png") {
                            aLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/highlight/a.png"
                            wordsPlus.playSound("letterSelected");
                        }
                    }
                    onTouch: {
                        if (event.isUp()) {
                            pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                            lLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/l.png"
                            aLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/a.png"
                        }
                    }
                }
                ImageView {
                    id: yLetter
                    preferredHeight: 75
                    preferredWidth: 75
                    rightMargin: 0
                    leftMargin: 0
                    imageSource: "theme/" + "wordsPlus" + "/letters/y.png"
                    onTouchEnter: {
                        if (aLetter.imageSource == "asset:///theme/" + "wordsPlus" + "/letters/highlight/a.png") {
                            yLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/highlight/y.png"
                            wordsPlus.playSound("letterSelected");
                        }
                    }
                    onTouchExit: {
                        pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                        lLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/l.png"
                        aLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/a.png"
                        yLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/y.png"
                        //wordsPlus.intializePlayArea();
                        categorySheet.open();
                    }
                    onTouch: {
                        if (event.isUp()) {
                            if (yLetter.imageSource == "asset:///theme/" + "wordsPlus" + "/letters/highlight/y.png") {
                                pLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/p.png"
                                lLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/l.png"
                                aLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/a.png"
                                yLetter.imageSource = "asset:///theme/" + "wordsPlus" + "/letters/y.png"
                               // wordsPlus.intializePlayArea();
                                categorySheet.open();
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
        TextStyleDefinition {
            id: btmNavPanelSmallNormalWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Invocation {
            id: invokeLeaveReview
            query {
                invokeTargetId: "sys.appworld"
                uri: "appworld://content/24752875"
            }
        },
        Sheet {
            id: categorySheet
            CategorySheet {
            }
        }
    ]
}
