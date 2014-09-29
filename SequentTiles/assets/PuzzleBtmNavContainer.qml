import bb.cascades 1.0
import bb.system 1.0

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Left
        defaultImageSource: "images/buttons/done.png"
        pressedImageSource: "images/buttons/done_selected.png"
        onTouch: {
            //            if (event.isDown()) {
            //            }
            if (event.isUp()) {
                sequentTiles.Submit();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Right
        defaultImageSource: "images/buttons/reset.png"
        pressedImageSource: "images/buttons/reset_selected.png"
        onTouch: {
            //            if (event.isDown()) {
            //            }
            if (event.isUp()) {
                sequentTiles.RedoGame();
                levelToast.show();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
    attachedObjects: [
        SystemToast {
            id: levelToast
            body: "RESET FOR ~ Level " + sequentTiles.userLevel
            onFinished: {
            }
        }
    ]
}
