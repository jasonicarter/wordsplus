import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    Container {
        id: theme
        ImageView {
            imageSource: "theme/" + wordsPlus.theme + "/theme_background.jpg"
            //imageSource: "theme/" + "wordsPlus" + "/theme_background.jpg"
        }
    }
    Container {
        layout: AbsoluteLayout {
        }
        //preferredWidth: 500
        ImageView {
            id: puzzleHeart
            objectName: "puzzleHeart"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 500
                positionY: 0
            }          
            imageSource: "theme/" + wordsPlus.theme + "/theme_icon.png"
            //imageSource: "theme/" + "wordsPlus" + "/theme_icon.png"
        }
    }
}
