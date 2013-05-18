import bb.cascades 1.0
// This is a Dialog. It is a custom built overlay

//Dialog {
Container {
    Container {
        preferredWidth: 720
        preferredHeight: 1280

        // The background is set to semi-transparent to indicate
        // that it is not possible to interact with the screen
        // behind the dialog box.

        background: Color.create(0.0, 0.0, 0.0, 0.5)

        layout: DockLayout {
        }

        Container {
            preferredHeight: 600
            preferredWidth: 600
            //background: Color.create("#272727")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            layout: DockLayout {
            }
            ImageView {
                imageSource: "images/splash.png"
            }

            // This Container contains the title and body of the dialog box.
            Container {
                preferredWidth: 550
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    id: txtMsg
                    text: "version 1.3"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.SubtitleText
                        color: Color.create("#fafafa")
                        textAlign: TextAlign.Center
                    }
                }
                Container {
                    Divider {
                        opacity: 0
                        bottomMargin: 160
                    }
                    Label {
                        text: "What's new"
                        textStyle {
                            base: welcomeDialogBlue.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "1. An updated design\n" 
                        + "2. WordsPlus Facebook page - Like Me!\n" 
                        + "3. Better social integration with Facebook and Twitter\n"
                        + "4. A new Welcome page :)"
                        textStyle {
                            base: welcomeDialogWhite.style
                        }
                    }
                    Label {
                        text: "Menu + Shortcuts"
                        textStyle {
                            base: welcomeDialogBlue.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "~ Press h: to go home\n"
                        + "~ Press p: to (re)play \n"
                        + "~ Swipe down from the top for menu options" 
                        textStyle {
                            base: welcomeDialogWhite.style
                        }
                    }
                }
            } // text container
            Label {
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
                text: "TAP TO CLOSE"
            }
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: welcomeDialogBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#cc3f10")
        },
        TextStyleDefinition {
            id: welcomeDialogWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#262626")
        }
    ]
}