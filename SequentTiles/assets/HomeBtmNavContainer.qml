import bb.cascades 1.0

Container {
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    Container {
        id:btnGo
        opacity: 0
        leftPadding: 42
        topPadding: 10
        ImageView {
            preferredHeight: 130
            preferredWidth: 300
            imageSource: "images/selected.png"
        }
        onTouch: {
            if (event.isDown()) {
                btnGo.opacity = 1;
            }
            if (event.isUp()) {
                btnGo.opacity = 0;
            }
        }
        onTouchExit: {
            btnGo.opacity = 0;
        }
    }
}
