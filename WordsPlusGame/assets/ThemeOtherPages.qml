import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    Container {
        id: theme
        ImageView {
            imageSource: "theme/" + wordsPlus.theme + "/theme_background.jpg"
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
            imageSource: "theme/" + wordsPlus.theme + "/theme_icon.png"
        }
    }
}
