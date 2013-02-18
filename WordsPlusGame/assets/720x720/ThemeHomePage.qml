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
                positionY: 20
            }
            onTouch: {
                if (event.isDown()) {
                    wordsPlus.playSound("letterSelected");
                } else if (event.isUp()) {
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
        preferredHeight: 300
        preferredWidth: 720
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Bottom
        Container {
            layout: DockLayout {
            }
            //not using button image to keep image and app size down
//            ImageView {
//                imageSource: "images/social.png"
//            }
            Container {
                layout: AbsoluteLayout {
                }
                Container {
                    preferredHeight: 100
                    preferredWidth: 100
                    //background: Color.Green
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 100
                        positionY: 0
                    }
                    onTouch: {
                        if (event.isDown()) {
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            wordsPlus.Share("Facebook", "home");
                        }
                    }
                }
                Container {
                    preferredHeight: 100
                    preferredWidth: 100
                    //background: Color.Green
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 300
                        positionY: 0
                    }
                    attachedObjects: [
                        Invocation {
                            id: invokeReview
                            query {
                                invokeTargetId: "sys.appworld"
                                uri: "appworld://content/21931881"
                            }
                        }
                    ]
                    onTouch: {
                        if (event.isDown()) {
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            invokeReview.trigger("bb.action.OPEN");
                        }
                    }
                }
                Container {
                    preferredHeight: 100
                    preferredWidth: 100
                    //background: Color.Green
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 500
                        positionY: 0
                    }
                    onTouch: {
                        if (event.isDown()) {
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            wordsPlus.Share("Twitter", "home");
                        }
                    }
                }
            }
        }
    } //end of social block
}
