import bb.cascades 1.0

Page {
    Container {
            layout: DockLayout {
            }
        background: Color.Black
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "At Home."
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: bigTextNormalWhite.style
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
            bottomPadding: 50
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "Total points won: 4638 \n" + 
                "Total # of Words Found: " + wordsPlus.totalWordsFound;
                multiline: true
                textStyle {
                    base: subTitleNormalWhite.style
                    textAlign: TextAlign.Center
                }
            }
        }
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
        onCreationCompleted: {
            wAnimation.play();
            pAnimation.play();
        }
    }
}
