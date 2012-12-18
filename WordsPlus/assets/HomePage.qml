import bb.cascades 1.0
import bb.system 1.0

Container {
    id: homePageContainer
    objectName: "homePageContainer"
    Container {
        id: mainContainer
        layout: DockLayout {
        }
        preferredHeight: 1280
        //background: Color.Black
        background: Color.create("#0098f0")
        ImageView {
            objectName: "rotateImageMsg"
            opacity: 0
            verticalAlignment: VerticalAlignment.Center
            imageSource: "asset:///images/hint_image.png"
        }
        Container { //top
            Container { //love me container
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    layout: AbsoluteLayout {
                    }
                    preferredWidth: 400
                    ImageView {
                        id: redHeart
                        objectName: "rotateHeartImage"
                        layoutProperties: AbsoluteLayoutProperties {
                            positionX: -200
                            positionY: 0
                        }
                        opacity: 1
                        imageSource: "asset:///images/heart_large.png"
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    topPadding: 40
                    rightPadding: 30
                    //background: Color.Black
                    ImageView {
                        imageSource: "asset:///images/letters/l.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/o.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/v.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/e.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/m.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/e.png"
                    }
                }
            } //end of love me
        }
        Container { // center
            layout: DockLayout {
            }
            topPadding: 200
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
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
                imageSource: "asset:///images/homeAnimation/mainPage_w.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_o.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_r.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_d.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_p.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_l.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_u.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_s.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_by.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_ji.png"
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
                imageSource: "asset:///images/homeAnimation/mainPage_carter.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: carterAnimation
                    onStarted: {
                    }
                }
            }
        }
        Container { //rotate me container
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            leftPadding: 200
            topPadding: 200
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                Container {
                    ImageView {
                        objectName: "rotateRotateImage"
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "asset:///images/rotate.png"
                    }
                    Label {
                        topMargin: 0
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "ROTATE ME"
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
                    }
                    onTouch: {
                        if (event.isUp()) {
                            homeSysToast.body = "No, no, no...\nRotate the device, silly"
                            homeSysToast.show();
                        }
                    }
                }
                Container {
                    leftMargin: 50
                    ImageView {
                        objectName: "rotateGuideImage"
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "asset:///images/guide.png"
                    }
                    Label {
                        topMargin: 0
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "GUIDE ME"
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
                    }
                    onTouch: {
                        if (event.isUp()) {
                            homeSysToast.body = "Looking for a menu?\nSwipe down from the top to see your options"
                            homeSysToast.show();
                        }
                    }
                }
                Container {
                    leftMargin: 50
                    ImageView {
                        objectName: "rotateReviewImage"
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "asset:///images/review_big.png"
                    }
                    Label {
                        topMargin: 0
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "REVIEW ME"
                        textStyle {
                            base: subTitleNormalWhite.style
                        }
                    }
                    onTouch: {
                        if (event.isUp()) {
                            invokeLeaveReview.trigger("bb.action.OPEN");
                        }
                    }
                }
            }
        } //end of rotate me
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
            mainLoader.stop();
            mainLoader.visible = false;
            welcomeUserLabel.text = qsTr("Welcome") + " " + username + "! \n" + "Total Points Won: " + wordsPlus.score + "\n " + "Total # of Words Found: " + wordsPlus.totalWordsFound
        }
    } //main container
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
            id: subTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
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
        },
        //        SystemToast {
        //            id: homeSysToast
        //            body: ""
        //            //position: TopCenter //'TopCenter'not working
        //            button.label: "Got it!"
        //        },
        Sheet {
            id: aboutSheet
            AboutSheet {
            }
        },
        Sheet {
            id: helpSheet
            HelpSheet {
            }
        },
        Sheet {
            id: settingsSheet
            SettingsSheet {
            }
        }
    ]
}//root container
