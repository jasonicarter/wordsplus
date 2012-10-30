import bb.cascades 1.0

Page {
    Container {
        background: Color.Black
        Container {
            Label {
                text: "Welcome."
                textStyle {
                    base: bigTextNormalWhite.style
                }
            }
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container { //divider
            bottomMargin: 50
            preferredWidth: 600
            preferredHeight: 3
            background: Color.create("#ff8c00")
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
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
                animations: HomeTabAnimation {
                    id: puzzleLettersAnimation
                }
            }
            ImageView {
                id: wImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/w.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
                    id: dAnimation
//                    onStarted: {
//                        //pAnimation.delay = 500
//                        pAnimation.play();
//                    }
                }
            }
            ImageView {
                id: pImageView
                opacity: 0
                imageSource: "asset:///images/homeAnimation/p.png"
                preferredWidth: 500
                preferredHeight: 500
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
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
                animations: HomeTabAnimation {
                    id: carterAnimation
                }
            }
        }
        Container {
            topMargin: 50
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "Total points won: 4638 \n" + 
                "Total # of Words Found: " + wordsPlus.totalWordsFound;
                multiline: true
                textStyle {
                    base: subTitleNormalBlue.style
                    textAlign: TextAlign.Center
                }
            }
        }
//        Container { //divider
//            bottomMargin: 50
//            preferredWidth: 600
//            preferredHeight: 3
//            background: Color.create("#ff8c00")
//            verticalAlignment: VerticalAlignment.Center
//            horizontalAlignment: HorizontalAlignment.Center
//        }
        onCreationCompleted: {
            wAnimation.play();
            pAnimation.play();
        }
    }
}
