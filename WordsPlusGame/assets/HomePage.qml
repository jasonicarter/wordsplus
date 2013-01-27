import bb.cascades 1.0
import bb.system 1.0
//import bb.multimedia 1.0

Container {
    id: homePageContainer
    objectName: "homePageContainer"
    //background: Color.create("#0098f0")
    Container {
        property string scoreLoopUsername
        property string btnName
        id: mainContainer
        layout: DockLayout {
        }
        preferredHeight: 1280
        //        Container { //container background image
        //            ImageView {
        //                imageSource: "asset:///images/tabs.png"
        //            }
        //        }
        Container {
            ImageView {
                id: rotateImageMsg
                objectName: "rotateImageMsg"
                opacity: 0
                imageSource: "asset:///images/hint.png"
            }
        }
        Container {
            id: tabHints
            opacity: 0
            ImageView {
                imageSource: "asset:///images/tabHints.png"
            }
        }
        Container {
            id: tabHelp
            opacity: 0
            ImageView {
                imageSource: "asset:///images/tabHelp.png"
            }
        }
        Container {
            layout: DockLayout {
            }
            //topPadding: 25
            //preferredWidth: 768
            //preferredHeight: 250
            //background: Color.Blue
            Container {
                id: theme
                ImageView {
                    imageSource: "theme/" + "space" + "/theme_background.jpg"
                }
            }
            Container {
                //background: Color.Green
                layout: AbsoluteLayout {
                }
                preferredWidth: 500
                ImageView {
                    id: redHeart
                    objectName: "rotateHeartImage"
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: -190
                        positionY: 0
                    }
                    //imageSource: "asset:///images/heart_large.png"
                    imageSource: "theme/" + "space" + "/theme_icon.png"
                }
            }
            Container {
                ImageView {
                    imageSource: "asset:///images/tabs.png"
                }
            }
            Container {
                layout: AbsoluteLayout {
                }
                Container {
                    id: help
                    preferredHeight: 100
                    preferredWidth: 175
                    //background: Color.Gray
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 600
                        positionY: 0
                    }
                    onTouch: {
                        if (event.isDown()) {
                            tabHelp.opacity = 1;
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            tabHelp.opacity = 0;
                            homeSysToast.body = "Need a menu? Follow your heart\n(...or the pointing arrow)\nSwipe down from the top for options"
                            homeSysToast.show();
                        }
                    }
                    onTouchExit: {
                        tabHelp.opacity = 0;
                    }
                }
                Container {
                    id: hint
                    preferredHeight: 100
                    preferredWidth: 175
                    //background: Color.Blue
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 600
                        positionY: 120
                    }
                    onTouch: {
                        if (event.isDown()) {
                            tabHints.opacity = 1;
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            tabHints.opacity = 0;
                            homeSysToast.body = "Be still my heart. Don't tap me...\n\"Rotate Me\""
                            homeSysToast.show();
                        }
                    }
                    onTouchExit: {
                        tabHints.opacity = 0;
                    }
                }
                Container {
                    id: themes
                    preferredHeight: 100
                    preferredWidth: 175
                    //background: Color.Green
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 600
                        positionY: 230
                    }
                    onTouch: {
                        if (event.isDown()) {
                            tabHints.opacity = 1;
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            tabHints.opacity = 0;
                            homeSysToast.body = "Be still my heart. Don't tap me...\n\"Rotate Me\""
                            homeSysToast.show();
                        }
                    }
                    onTouchExit: {
                        tabHints.opacity = 0;
                    }
                }
            } //tab buttons
        } //background dock container
        //        Container {
        //            //background: Color.Gray //top
        //            Container { //love me container
        //                layout: StackLayout {
        //                    orientation: LayoutOrientation.LeftToRight
        //                }
        //                horizontalAlignment: HorizontalAlignment.Center
        //                Container {
        //                    //background: Color.Green
        //                    layout: AbsoluteLayout {
        //                    }
        //                    preferredWidth: 300
        //                    ImageView {
        //                        id: redHeart
        //                        objectName: "rotateHeartImage"
        //                        layoutProperties: AbsoluteLayoutProperties {
        //                            positionX: -190
        //                            positionY: 0
        //                        }
        //                        imageSource: "asset:///images/heart_large.png"
        //                    }
        //                }
        //            } //end of love me
        //        }
        Container { // center
            layout: DockLayout {
            }
            topPadding: 150
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            //background: Color.Gray
            ImageView {
                id: puzzleLetters
                opacity: 1
                imageSource: "asset:///images/homeAnimation/mainPage_full.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: puzzleLettersAnimation
                }
            }
            ImageView {
                id: wImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_w_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: wAnimation
                    onStarted: {
                        oAnimation.delay = 500
                        oAnimation.play();
                    }
                }
            }
            ImageView {
                id: oImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_o_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: oAnimation
                    onStarted: {
                        rAnimation.delay = 1000
                        rAnimation.play();
                    }
                }
            }
            ImageView {
                id: rImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_r_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: rAnimation
                    onStarted: {
                        dAnimation.delay = 1500
                        dAnimation.play();
                    }
                }
            }
            ImageView {
                id: dImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_d_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: dAnimation
                    onStarted: {
                    }
                }
            }
            ImageView {
                id: pImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_p_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: pAnimation
                    onStarted: {
                        lAnimation.delay = 500
                        lAnimation.play();
                    }
                }
            }
            ImageView {
                id: lImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_l_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: lAnimation
                    onStarted: {
                        uAnimation.delay = 1000
                        uAnimation.play();
                    }
                }
            }
            ImageView {
                id: uImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_u_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: uAnimation
                    onStarted: {
                        sAnimation.delay = 1500
                        sAnimation.play();
                    }
                }
            }
            ImageView {
                id: sImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_s_red.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: sAnimation
                    onStarted: {
                        byAnimation.delay = 2000
                        byAnimation.play();
                    }
                }
            }
            ImageView {
                id: by
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_by_white.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: byAnimation
                    onStarted: {
                        jiAnimation.delay = 2500
                        jiAnimation.play();
                    }
                }
            }
            ImageView {
                id: ji
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_ji_white.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: jiAnimation
                    onStarted: {
                        carterAnimation.delay = 3000
                        carterAnimation.play();
                    }
                }
            }
            ImageView {
                id: carter
                opacity: 0
                imageSource: "asset:///images/homeAnimation/mainPage_carter_white.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: carterAnimation
                    onStarted: {
                    }
                }
            }
        }
        BtmNavPanel { // bottom panel
            verticalAlignment: VerticalAlignment.Bottom
        }
        onCreationCompleted: {
            wAnimation.play();
            pAnimation.play();
            //because score()->start is called after qml creation
            //scoreloop instance created, calls run() which does requestUserCompleted
            //create invokable requestUser and connect in C++ requestUserCompleted to another slot to save off username
            //if you do that, don't need this connnection in qml
            //wordsPlus.scoreLoop().RequestUserCompleted.connect(mainContainer.onScoreloopLoaded);
        }
        //requestUserCompleted has param of string (login/username) which onScoreloopLoaded uses
        function onScoreloopLoaded(username) {
            scoreLoopUsername = username;
            homeSysToast.body = "Welcome to WordsPlus, " + scoreLoopUsername
            homeSysToast.show();
        }
    } //end of main container
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: bigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: bigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: subTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: smallTxtNormalWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Invocation {
            id: invokeWebSite
            query: InvokeQuery {
                mimeType: "text/html"
                uri: "http://www.twocasualcoders.com"
            }
        },
        Invocation {
            id: invokeLeaveReview
            query: InvokeQuery {
                mimeType: "application/x-bb-appworld"
                uri: "appworld://content/19132685"
            }
        }
            ,
            SystemToast {
                    id: homeSysToast
                    body: ""
                    button.label: "Got it!" //btnName
                }
    ]
}//root container