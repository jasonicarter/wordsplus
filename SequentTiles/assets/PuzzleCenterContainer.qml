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
        layout: DockLayout {
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
            preferredHeight: 980
            preferredWidth: 720
            topPadding: 160
            leftPadding: 40
            //background: Color.Green
            Container {
                id: testContainer
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    testContainer.background = Color.Green
                }
                if (event.isUp()) {
                    testContainer.background = Color.Transparent
                    sequentTiles.NextGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }

        Container {
            preferredHeight: 980
            preferredWidth: 720
            topPadding: 500
            leftPadding: 380
            Container {
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Gray
            }
            onTouch: {
                if (event.isDown()) {
                    testContainer.background = Color.Green
                }
                if (event.isUp()) {
                    testContainer.background = Color.Transparent
                    //sequentTiles.RedoGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    }

}
