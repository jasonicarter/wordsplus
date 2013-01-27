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
        //background: Color.Green
        layout: AbsoluteLayout {
        }
        preferredWidth: 500
        ImageView {
            id: redHeart
            objectName: "rotateHeartImage"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: -190
                positionY: 0
            }
            //imageSource: "asset:///images/heart_large.png"
            imageSource: "theme/" + "space" + "/theme_icon.png"
        }
    }
    Container {
        ImageView {
            id: rotateImageMsg
            objectName: "rotateImageMsg"
            opacity: 0
            imageSource: "asset:///images/hint.png"
        }
    }
    Container {
        ImageView {
            imageSource: "asset:///images/tabs.png"
        }
    }
    Container {
        layout: AbsoluteLayout {
        }
        Container {
            id: help
            preferredHeight: 100
            preferredWidth: 175
            //background: Color.Gray
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 0
            }
            onTouch: {
                if (event.isDown()) {
                    tabHelp.opacity = 1;
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    tabHelp.opacity = 0;
                    homeSysToast.body = "Need a menu? Follow your heart\n(...or the pointing arrow)\nSwipe down from the top for options"
                    homeSysToast.show();
                }
            }
            onTouchExit: {
                tabHelp.opacity = 0;
            }
        }
        Container {
            id: hint
            preferredHeight: 100
            preferredWidth: 175
            //background: Color.Blue
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 120
            }
            onTouch: {
                if (event.isDown()) {
                    tabHints.opacity = 1;
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    tabHints.opacity = 0;
                    homeSysToast.body = "Be still my heart. Don't tap me...\n\"Rotate Me\""
                    homeSysToast.show();
                }
            }
            onTouchExit: {
                tabHints.opacity = 0;
            }
        }
        Container {
            id: themes
            preferredHeight: 100
            preferredWidth: 175
            //background: Color.Green
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 600
                positionY: 230
            }
            onTouch: {
                if (event.isDown()) {
                    tabHints.opacity = 1;
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    tabHints.opacity = 0;
                    homeSysToast.body = "Be still my heart. Don't tap me...\n\"Rotate Me\""
                    homeSysToast.show();
                }
            }
            onTouchExit: {
                tabHints.opacity = 0;
            }
        }
    } //tab buttons
}
