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
        preferredWidth: 500
        ImageView {
            id: redHeart
            objectName: "rotateHeartImage"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: -190
                positionY: 0
            }
            imageSource: "theme/" + wordsPlus.theme + "/theme_icon.png"
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
        horizontalAlignment: HorizontalAlignment.Right
        rightPadding: 40
        ImageView {
            imageSource: "images/tools.png"
        }
    }
    Container{
        layout: StackLayout {
        	orientation: LayoutOrientation.LeftToRight
        }
        horizontalAlignment: HorizontalAlignment.Right
        rightPadding: 40
        Container {
            preferredHeight: 75
            preferredWidth: 175
            //background: Color.Gray
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    themeSheet.open();
                }
            }
            onTouchExit: {
                tabHelp.opacity = 0;
            }
        }
        Container {            
            preferredHeight: 75
            preferredWidth: 175
            //background: Color.Blue
            leftMargin: 20
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    homeSysToast.body = "MENU:\nSwipe down from the top\n\nHINTS:\nRotate device counter-clockwise"
                    homeSysToast.show();
                }
            }
            onTouchExit: {
                tabHints.opacity = 0;
            }
        }
    }
    Container {
        topPadding: 50
        ImageView {
            imageSource: "images/upgrade_small.png"
            onTouch: {
                invokeBuy.trigger("bb.action.OPEN");
            }

            attachedObjects: [
                Invocation {
                    id: invokeBuy
                    query: InvokeQuery {
                        invokeTargetId: "sys.appworld"
                        uri: "appworld://content/21931881"
                    }
                }
            ]
        }
    }
}
