import bb.cascades 1.0
// This is a Dialog. It is a custom built overlay

Dialog {
    Container {

        preferredWidth: 768
        preferredHeight: 1280

        // The background is set to semi-transparent to indicate
        // that it is not possible to interact with the screen
        // behind the dialog box.

        background: Color.create(0.0, 0.0, 0.0, 0.5)

        layout: DockLayout {
        }

        Container {
            preferredHeight: 900
            preferredWidth: 600
            background: Color.create("#272727")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            layout: DockLayout {
            }
//            ImageView {
//                imageSource: "images/background_dialog.png"
//            }

            // This Container contains the title and body of the dialog box.
            Container {
                preferredWidth: 550
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: "Welcome to WordsPlus"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                        color: Color.create("#fafafa")
                        textAlign: TextAlign.Center
                    }

                }
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
                	Label{
                	    text:"What's new"
                        textStyle {
                            base: welcomeDialogBlue.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "Just something stuff here werwere wlksjdlf  sjkdhf lksdjf"
                        +" sdlkjsdf wlke io ndm ksldfkj dih fsldkjf skld uewr" 
                        + " sdlkjsdf wlke io ndm ksldfkj dih fsldkjf s sd f;lksd  werl;wer" 
                        + "m ksldfkj dih fsldkjrt r ter wer we\n\n"
                        + "1) sdlkjfsd fslkjdfsd fsd kljf\n"
                        + "2) lkjlkj s d uiower lkjwe jk lkj oiu oiuoiu ljk\n"
                        + "3) wthwer ouoiu lkj iu  lkwjerjwer klj"
                        textStyle {
                            base: welcomeDialogWhite.style
                        }
                    }
                    Label {
                        text: "Menu Options"
                        textStyle {
                            base: welcomeDialogBlue.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "Looking for more options? Try the Application Menu.\n\n" 
                        + "Swipe down from the top to:\n" 
                        + "~Select different word categories\n" 
                        + "~Change the difficulty level\n"
                        + "~Read up on your stats and leaderboards\n"
                        + "~Learn more about the developer"
                        textStyle {
                            base: welcomeDialogWhite.style
                        }
                    }
                }
            } // text container
            Button {
                id: btnOk
                text: "OK"
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                onClicked: {
                    welcomeDialog.close();
                }
            }
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: welcomeDialogBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: welcomeDialogWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}