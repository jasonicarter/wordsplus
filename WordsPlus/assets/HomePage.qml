import bb.cascades 1.0

Container {
    Container {
        layout: DockLayout {
        }
        preferredHeight: 1280
        background: Color.Black
        Container {
            //background: Color.Yellow
            Container {
                preferredWidth: 768
                background: Color.create("#00629C")
                verticalAlignment: VerticalAlignment.Top
                Label {
                    text: "At Home."
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: bigTextNormalWhite.style
                    }
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                rightPadding: 15
                topPadding: 100
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    rightPadding: 20
                    layout: DockLayout {
                    }
                    //background: Color.Black
                    ImageView {
                        id: redHeart
                        opacity: 1
                        imageSource: "asset:///images/heart.png"
                        onTouch: {
                            invokeWebSite.trigger("bb.action.OPEN");
                        }
                    }
                    //                    ImageView {
                    //                        id: blueHeart
                    //                        opacity: 1
                    //                        imageSource: "asset:///images/heart_blue.png"
                    //                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    topPadding: 40
                    //background: Color.Black
                    ImageView {
                        imageSource: "asset:///images/letters/selected/l.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/o.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/v.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/e.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/m.png"
                    }
                    ImageView {
                        imageSource: "asset:///images/letters/selected/e.png"
                    }
                }
            }
        }
        Container {
            layout: DockLayout {
            }
            topMargin: 30
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            ImageView {
                id: puzzleLetters
                opacity: 1
                imageSource: "asset:///images/homeAnimation/puzzleLetters.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: puzzleLettersAnimation
                }
            }
            ImageView {
                id: wImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/w.png"
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
                imageSource: "asset:///images/homeAnimation/o.png"
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
                imageSource: "asset:///images/homeAnimation/r.png"
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
                imageSource: "asset:///images/homeAnimation/d.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: dAnimation
                }
            }
            ImageView {
                id: pImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/p.png"
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
                imageSource: "asset:///images/homeAnimation/l.png"
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
                imageSource: "asset:///images/homeAnimation/u.png"
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
                imageSource: "asset:///images/homeAnimation/s.png"
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
                imageSource: "asset:///images/homeAnimation/by.png"
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
                imageSource: "asset:///images/homeAnimation/ji.png"
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
                imageSource: "asset:///images/homeAnimation/carter.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomePageAnimation {
                    id: carterAnimation
                }
            }
        }
        Container {
            bottomPadding: 250
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "Total Points Won: " + wordsPlus.score + "\n " + "Total # of Words Found: " + wordsPlus.totalWordsFound
                multiline: true
                textStyle {
                    base: subTitleNormalWhite.style
                    textAlign: TextAlign.Center
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
