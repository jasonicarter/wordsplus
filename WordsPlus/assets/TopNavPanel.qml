import bb.cascades 1.0

Container {
    Container {
        //background: Color.create("#262626")
        preferredHeight: 150
        preferredWidth: 768
        layout: DockLayout {
        }
        Container {
            preferredWidth: 768
            preferredHeight: 45
            background: Color.create("#262626")
            verticalAlignment: VerticalAlignment.Top
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.RightToLeft
                }
                //background: Color.Red
                rightPadding: 70
                preferredWidth: 720
                preferredHeight: 45
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    leftMargin: 90
                    text: "POST"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
                Label {
                    leftMargin: 70
                    text: "TWEET"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
                Label {
                    leftMargin: 50
                    text: "THEMES"
                    verticalAlignment: VerticalAlignment.Center
                    textStyle {
                        base: btmNavPanelSmallNormalWhite.style
                    }
                }
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
            rightPadding: 50
            preferredHeight: 150
            preferredWidth: 720
            //background: Color.Red
            horizontalAlignment: HorizontalAlignment.Center
            ImageView {
                leftMargin: 50
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/facebook_large.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        invokeFacebook.trigger("bb.action.SHARE")
                    }
                }
            }
            ImageView {
                leftMargin: 50
                preferredHeight: 100
                preferredWidth: 100
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/twitter_large.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        invokeTwitter.trigger("bb.action.SHARE")
                    }
                }
            }
            ImageView {
                rightMargin: 50
                preferredHeight: 100
                preferredWidth: 100
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/theme_red.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
                        themeSheet.open();
                    }
                }
            }
            ImageView {
                rightMargin: 50
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
                imageSource: "images/facebook_like.png"
                onTouch: {
                    if (event.isDown()) {
                        wordsPlus.playSound("letterSelected");
                    } else if (event.isUp()) {
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
