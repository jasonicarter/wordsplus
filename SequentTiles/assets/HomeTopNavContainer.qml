import bb.cascades 1.0

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Left
        //defaultImageSource: "images/buttons/play.png"
        //pressedImageSource: "images/buttons/play_selected.png"
        onTouch: {
            //            if (event.isDown()) {
            //            }
            if (event.isUp()) {
                sequentTiles.NewGame();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Right
        //defaultImageSource: "images/buttons/help.png"
        //pressedImageSource: "images/buttons/help_selected.png"
        onTouch: {
            //            if (event.isDown()) {
            //            }
            if (event.isUp()) {
                //sequentTiles.NewGame();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
}
