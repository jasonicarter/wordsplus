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
        //rightPadding: 40
        ImageView {
            imageSource: "images/tabs.png"
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
                positionY: 20
            }
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    homeSysToast.body = "Follow your heart\n(...or the pointing arrow)\nSwipe down from the top for options"
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
                positionY: 140
            }
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
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
                positionY: 250
            }
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
                    themeSheet.open();
                }
            }
            onTouchExit: {
                tabHints.opacity = 0;
            }
        }
    } //tab buttons
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