import bb.cascades 1.0

Container {
    preferredHeight: 980
    preferredWidth: 720
    //background: Color.Gray
    layout: DockLayout {
    }
    PuzzleBackgroundContainer {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        bottomPadding: 10
        Container {
            layout: AbsoluteLayout {
            }
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
        verticalAlignment: VerticalAlignment.Bottom
        ImageView {
            imageSource: "images/buttons/hint_skip.png"
        }
        ImageView {
            id: hint_selected
            visible: false
            imageSource: "images/buttons/hint_selected.png"
        }
        ImageView {
            id: skip_selected
            visible: false
            imageSource: "images/buttons/skip_selected.png"
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            preferredHeight: 100
            preferredWidth: 500
            //background: Color.Red
            horizontalAlignment: HorizontalAlignment.Center
            Container { //hint
                preferredHeight: 100
                preferredWidth: 250
                //background: Color.Green
                onTouch: {
                    if (event.isDown()) {
                        hint_selected.visible = true
                    }
                    if (event.isUp()) {
                        hint_selected.visible = false
                        if (sequentTiles.coinCount >= 75) {
                            customDialog.dialogType = "hint"
                            customDialog.dialogTitle = "Need a Hint?"
                            customDialog.dialogMsg = "75 Coins required for a hint"
                            customDialog.coinToSubtract = 75
                            customDialog.open();
                        } else {
                            customDialog.dialogType = "coins"
                            customDialog.dialogTitle = "Coins Required!"
                            customDialog.dialogMsg = "Would you like to buy more?"
                            customDialog.coinToSubtract = 0
                            customDialog.open();
                        }
                    }
                }
                onTouchExit: {
                    hint_selected.visible = false
                }
            }
            Container { //skip
                preferredHeight: 100
                preferredWidth: 250
                //background: Color.Black
                onTouch: {
                    if (event.isDown()) {
                        skip_selected.visible = true
                    }
                    if (event.isUp()) {
                        skip_selected.visible = false
                        if (sequentTiles.coinCount >= 150) {
                            customDialog.dialogType = "skip"
                            customDialog.dialogTitle = "Skip a Level?"
                            customDialog.dialogMsg = "150 Coins required to skip"
                            customDialog.coinToSubtract = 150
                            customDialog.open();
                        } else {
                            customDialog.dialogType = "coins"
                            customDialog.dialogTitle = "Coins Required!"
                            customDialog.dialogMsg = "Would you like to buy more?"
                            customDialog.coinToSubtract = 0
                            customDialog.open();
                        }
                    }
                }
                onTouchExit: {
                    skip_selected.visible = false
                }
            }
        }

        attachedObjects: [

            CustomDialogBox {
                id: customDialog
                onOpened: {
                }
                onClosed: {
                }
            }
        ]
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
                positionY: 162
            }
            Container {
                //id: nextCorrect
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Red
                ImageView {
                    id: nextCorrect
                    visible: false
                    imageSource: "images/buttons/selected.png"
                }
            }
            onTouch: {
                if (event.isDown()) {
                    nextCorrect.visible = true
                }
                if (event.isUp()) {
                    nextCorrect.visible = false
                    sequentTiles.NextGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
        Container {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 379
                positionY: 502
            }
            Container {
                //id: resetCorrect
                preferredHeight: 300
                preferredWidth: 300
                //background: Color.Red
                ImageView {
                    id: resetCorrect
                    visible: false
                    imageSource: "images/buttons/selected.png"
                }
            }
            onTouch: {
                if (event.isDown()) {
                    resetCorrect.visible = true
                }
                if (event.isUp()) {
                    resetCorrect.visible = false
                    sequentTiles.RedoGame();
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    } //correct answer
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Top
        //background: Color.Gray
        visible: if (sequentTiles.showRetry) {
            1
        } else {
            0
        }
        ImageView {
            imageSource: "images/incorrect_answer.png"
        }

    } //incorrect answer

}
