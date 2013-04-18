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
        defaultImageSource: "images/buttons/home.png"
        pressedImageSource: "images/buttons/home_selected.png"
        onTouch: {
            //            if (event.isDown()) {
            //            }
            if (event.isUp()) {
                sequentTiles.Home();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Right
        defaultImageSource: "images/buttons/skip.png"
        pressedImageSource: "images/buttons/skip_selected.png"
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
