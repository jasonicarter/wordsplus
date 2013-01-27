import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    Container {
        id: theme
        ImageView {
            imageSource: "theme/" + "space" + "/theme_background.jpg"
        }
    }
    Container {
        layout: AbsoluteLayout {
        }
        ImageView {
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 500
                positionY: 0
            }
            objectName: "puzzleHeart"
            //imageSource: "asset:///images/heart_large.png"
            imageSource: "theme/" + "space" + "/theme_icon.png"
        }
    }
}
