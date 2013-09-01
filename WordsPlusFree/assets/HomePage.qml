import bb.cascades 1.0

Container {
    id: homePageContainer
    objectName: "homePageContainer"
    Container {
        property string scoreLoopUsername
        property string btnName
        id: mainContainer
        layout: DockLayout {
        }
        preferredHeight: 1280
        ThemeHomePage {
        }
        Container { // center
            layout: DockLayout {
            }
            topPadding: 150
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            //background: Color.LightGray
            ImageView {
                id: puzzleLetters
                opacity: 1
                imageSource: "theme/" + wordsPlus.theme + "/theme_home.png"
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
        Container {
            bottomPadding: 650
            leftPadding: 50
            verticalAlignment: VerticalAlignment.Center
            //background: Color.Gray
            //horizontalAlignment: HorizontalAlignment.Center
            ImageView {
                imageSource: "/images/wordoftheday.png"
                onTouch: {
                    wordsPlus.InitializeWordnik("WordOfTheDay");
                    wordnikSheet.open();
                }
            }
        }
        BtmNavPanel { // bottom panel
            verticalAlignment: VerticalAlignment.Bottom
        }
        onCreationCompleted: {
            wAnimation.play();
            pAnimation.play();
        }
        Container {
            id: welcomeDialog
            visible: wordsPlus.isFirstTimeUser
            WelcomeDialogBox {
            }
            onTouch: {
                if (event.isUp()) {
                    if (wordsPlus.isFirstTimeUser) {
                       welcomeDialog.visible = false
                       wordsPlus.isFirstTimeUser = false
                    }
                }
            }
        }
    } //end of main container
    attachedObjects: [
        Sheet {
            id: themeSheet
            ThemeSheet {
            }
        },
        Sheet {
            id: wordnikSheet
            WordnikSheet {
            }
        }
    ]
}//root container
