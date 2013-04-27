import bb.cascades 1.0

// This is a Dialog. It is a custom built overlay
// illustrating an alarm with a toggle button for dismissal.

Dialog {
    property string dialogTitle
    property int coinToSubtract
    property string dialogType
    property string dialogMsg
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
            maxHeight: 400
            preferredWidth: 550
            //background: Color.create("#272727")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            layout: DockLayout {
            }
            ImageView {
                imageSource: "images/test.png"
            }
            ImageView {
                imageSource: "images/gold.png"
            }

            // This Container contains the title and body of the dialog box.
            Container {
                topPadding: 5
                bottomPadding: 23
                leftPadding: 23
                rightPadding: 23
                preferredWidth: 550
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: dialogTitle //"Skip a Level?"
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#fafafa")
                    textStyle.textAlign: TextAlign.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
                Label {
                    id: txtMsg
                    text: dialogMsg
                    textStyle.base: SystemDefaults.TextStyles.BodyText
                    textStyle.color: Color.create("#fafafa")
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Button {
                        id: btnCancel
                        text: "Cancel"
                        onClicked: {
                            customDialog.close();
                        }
                    }
                    Button {
                        id: btnOk
                        text: "OK"
                        onClicked: {
                            sequentTiles.coinCount = sequentTiles.coinCount - coinToSubtract;
                            if (dialogType == "skip") {
                                sequentTiles.NextGame();
                                customDialog.close();
                            } else if (dialogType == "hint") {
                                btnOk.enabled = false;
                                txtMsg.text = "Here's your hint"
                                //sequentTiles.GetHint();
                            } else if (dialogType == "coins") {
                                customDialog.close();
                                paymentSheet.open();
                            }

                        }
                    }
                }
            }
        }
    }
    attachedObjects: [
        Sheet {
            id: paymentSheet
            PaymentContainer {
            }
        }
    ]
}