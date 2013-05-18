import bb.cascades 1.0

Container {
    Container {
        //background: Color.create("#262626")
        preferredHeight: 125
        preferredWidth: 720
        layout: DockLayout {
        }
        Container {
            preferredWidth: 720
            preferredHeight: 45
            background: Color.create("#262626")
            verticalAlignment: VerticalAlignment.Top
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.RightToLeft
                }
                //background: Color.Red
                rightPadding: 200
                preferredWidth: 720
                preferredHeight: 45
                Label {
                    leftMargin: 65
                    text: "POST"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
                Label {
                    leftMargin: 55
                    text: "TWEET"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
//                Label {
//                    leftMargin: 40
//                    text: "THEMES"
//                    verticalAlignment: VerticalAlignment.Center
//                    textStyle {
//                        base: btmNavPanelSmallNormalWhite.style
//                    }
//                }
                Label {
                    text: "WORDPLUS"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
            }
        }

        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.RightToLeft
            }
            rightPadding: 190
            preferredHeight: 150
            preferredWidth: 720
            //background: Color.Red
            ImageView {
                leftMargin: 50
                preferredHeight: 70
                preferredWidth: 70
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/facebook_large.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        wordsPlus.cntlySocial("Facebook");
                        invokeFacebook.trigger("bb.action.SHARE")
                    }
                }
            }
            ImageView {
                leftMargin: 50
                preferredHeight: 70
                preferredWidth: 70
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/twitter_large.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        wordsPlus.cntlySocial("Twitter");
                        invokeTwitter.trigger("bb.action.SHARE")
                    }
                }
            }
//            ImageView {
//                rightMargin: 50
//                preferredHeight: 70
//                preferredWidth: 70
//                horizontalAlignment: HorizontalAlignment.Right
//                verticalAlignment: VerticalAlignment.Bottom
//                imageSource: "images/theme_red.png"
//                onTouch: {
//                    if (event.isDown()) {
//                        wordsPlus.playSound("letterSelected");
//                    } else if (event.isUp()) {
//                        themeSheet.open();
//                    }
//                }
//            }
            ImageView {
                rightMargin: 50          
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/facebook_like.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        wordsPlus.cntlySocial("fb_Like");
                        wordsPlus.invokeFacebook();
                    }
                }
            }

        }

    } // panel
    attachedObjects: [
        TextStyleDefinition {
            id: btmNavPanelSmallNormalWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        Invocation {
            id: invokeTwitter
            query {
                invokeTargetId: "Twitter"
                mimeType: "text/plain"
                data: "WordsPlus is one of the best games on BlackBerry. Go get it! " 
                + "https://appworld.blackberry.com/webstore/content/21931881\n\n"
            }
        },
        Invocation {
            id: invokeFacebook
            query {
                invokeTargetId: "Facebook"
                mimeType: "text/plain"
                data: "WordsPlus is one of the best games on BlackBerry. Go get it! "
                + "https://appworld.blackberry.com/webstore/content/21931881\n\n"
            }
        }
    ]
}
