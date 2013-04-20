import bb.cascades 1.0

Container {
    preferredHeight: 980
    preferredWidth: 720
    //background: Color.Gray
    layout: DockLayout {
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        bottomPadding: 10
        Container {
            objectName: "puzzlePlayContainer"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            preferredHeight: 638
            preferredWidth: 638
            //background: Color.Black
        }
    }
    Container {
        layout: AbsoluteLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        //background: Color.Gray
        visible: if (sequentTiles.showNext) {
            1
        } else {
            0
        }
        ImageView {
            imageSource: "images/correct_answer.png"
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 42
                positionY: 161
            }
            Container {
                id: nextCorrect
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    nextCorrect.background = Color.Green
                }
                if (event.isUp()) {
                    nextCorrect.background = Color.Transparent
                    sequentTiles.NextGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 380
                positionY: 500
            }
            Container {
                id: resetCorrect
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    resetCorrect.background = Color.Blue
                }
                if (event.isUp()) {
                    resetCorrect.background = Color.Transparent
                    sequentTiles.RedoGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    } //correct answer
    Container {
        layout: AbsoluteLayout {
        }
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        //background: Color.Gray
        visible: if (sequentTiles.showRetry) {
            1
        } else {
            0
        }
        ImageView {
            imageSource: "images/incorrect_answer.png"
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 42
                positionY: 161
            }
            Container {
                id: homeIncorrect
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    homeIncorrect.background = Color.DarkGreen
                }
                if (event.isUp()) {
                    homeIncorrect.background = Color.Transparent
                    sequentTiles.Home();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 380
                positionY: 500
            }
            Container {
                id: resetHome
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    resetHome.background = Color.DarkRed
                }
                if (event.isUp()) {
                    resetHome.background = Color.Transparent
                    sequentTiles.RedoGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    } //incorrect answer

}
