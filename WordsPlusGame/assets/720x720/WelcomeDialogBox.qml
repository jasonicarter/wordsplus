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
                preferredWidth: 600
                horizontalAlignment: HorizontalAlignment.Center
//                Label {
//                    id: txtMsg
//                    text: "version 1.4"
//                    horizontalAlignment: HorizontalAlignment.Center
//                    textStyle {
//                        base: SystemDefaults.TextStyles.SubtitleText
//                        color: Color.create("#fafafa")
//                        textAlign: TextAlign.Center
//                    }
//                }
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "v1.4"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: welcomeDialogBlue.style
                            textAlign: TextAlign.Center
                        }
                    }
                }
                Container {
                    preferredWidth: 550
                    horizontalAlignment: HorizontalAlignment.Center
                    Divider {
                        opacity: 0
                        bottomMargin: 120
                    }
                    Label {
                        text: "What's new"
                        textStyle {
                            base: welcomeDialogOrg.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "1. An updated design\n" 
                        + "2. WordsPlus Facebook page - Like Me!\n" 
                        + "3. Post to Facebook and Twitter\n" 
                        + "4. Q10 and v10.1 support"
                        textStyle {
                            base: welcomeDialogWhite.style
                        }
                    }
                    Label {
                        text: "Menu + Shortcuts"
                        textStyle {
                            base: welcomeDialogOrg.style
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
            id: welcomeDialogOrg
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
        },
        TextStyleDefinition {
            id: welcomeDialogBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            //fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        }
    ]
}