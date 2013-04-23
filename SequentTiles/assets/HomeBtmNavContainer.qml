import bb.cascades 1.0

Container {
    layout: DockLayout {

    }
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Center
        defaultImageSource: "images/buttons/play.png"
        pressedImageSource: "images/buttons/play_selected.png"
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
}
