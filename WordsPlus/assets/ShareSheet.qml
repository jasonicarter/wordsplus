import bb.cascades 1.0

Page {
    Container {
        property int bbm_personalmessage: 6
        property int bbm_statusmessage: 7
        property int bbm_invitetodownload: 8
        layout: DockLayout {
        }
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle
            preferredWidth: 700
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                background: Color.create("#272727")
                TextArea {
                    text: "SHARE THE LOVE"
                    editable: false
                    touchPropagationMode: TouchPropagationMode.None
                    textStyle.textAlign: TextAlign.Center
                    textStyle {
                        base: shareSheetBigBodyNormalBlue.style
                    }
                }
                contextActions: [
                    ActionSet {
                        title: "Animations"
                        subtitle: "Choose your animation"

                        // This action plays the translation animation
                        ActionItem {
                            title: "Slide"
                            imageSource: "asset:///images/invite.png"

                            onTriggered: {
                                wordsPlus.ControlsForBBM(bbm_invitetodownload);
                            }
                        }
                    } // end of ActionSet
                ] // end of contextActions list
            }
            Divider {
                opacity: 0
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Leave a Review"
                    onClicked: {
                        invokeLeaveReview.trigger("bb.action.OPEN");
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Invite My Friends"
                    onClicked: {
                        wordsPlus.ControlsForBBM(bbm_invitetodownload);
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "I Love WordsPlus!"
                    onClicked: {
                        wordsPlus.ControlsForBBM(bbm_personalmessage);
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Playing WordsPlus"
                    onClicked: {
                        wordsPlus.ControlsForBBM(bbm_statusmessage);
                    }
                }
            }

            Container {
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    preferredHeight: 400
                    preferredWidth: 400
                    imageSource: "images/qrcode.png"
                }
            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "shareSheet"
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: shareSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        Invocation {
            id: invokeLeaveReview
            query {
                invokeTargetId: "sys.appworld"
                uri: "appworld://content/21931881"
            }
        }
    ]
}
