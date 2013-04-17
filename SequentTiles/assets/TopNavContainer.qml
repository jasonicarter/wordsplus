import bb.cascades 1.0

Container {
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    Container {
        id: btnHome
        opacity: 0
        leftPadding: 42
        topPadding: 10
        ImageView {
            preferredHeight: 120
            preferredWidth: 120
            imageSource: "images/selected.png"
        }
        onTouch: {
            if (event.isDown()) {
                btnHome.opacity = 1;
            }
            if (event.isUp()) {
                btnHome.opacity = 0;
                sequentTiles.Home();
            }
        }
        onTouchExit: {
            btnHome.opacity = 0;
        }
    }
}
