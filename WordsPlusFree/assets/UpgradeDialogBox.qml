import bb.cascades 1.0
import com.sample.payment 1.0

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
            preferredHeight: 700
            preferredWidth: 700
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
                preferredWidth: 720
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        id: upgradeMsg
                        text: "UPGRADE"
                        editable: false                      
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle.textAlign: TextAlign.Center
                        textStyle {
                            base: welcomeDialogNormalBlue.style
                        }
                    }
                }
                Container {
                    id: notPaid
                    preferredWidth: 600
                    horizontalAlignment: HorizontalAlignment.Center
                    Divider {
                        opacity: 0
                        bottomMargin: 200
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        multiline: true
                        text: "Although word categories are\n FREE, "  
                        +"Theme Skins and Scoreloop features are only available with\n" 
                        +"the premium edition of WordsPlus"
                        textStyle {
                            base: welcomeDialog.style
                            textAlign: TextAlign.Center
                        }
                    }
                    Divider {
                        topMargin: 50
                    }
                    Container {
                        layout: DockLayout {
                        }
                        preferredWidth: 600
                        Button {
                            id: upgrade
                            text: "CANCEL"
                            preferredWidth: 250
                            horizontalAlignment: HorizontalAlignment.Left
                            onClicked: {
                                upgradeDialog.close();
                            }
                        }
                        Button {
                            id: upgrade2
                            text: "OK"
                            preferredWidth: 250
                            horizontalAlignment: HorizontalAlignment.Right
                            onClicked: {
                                paymentControl.id = "28487887"
                                paymentControl.sku = "full_upgrade"
                                paymentControl.name = "WordsPlus Full Upgrade"
                                paymentControl.metadata = "full_upgrade"
                                paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                                paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
                            }
                        }
                    }
                    
                }
            } // text container
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: welcomeDialog
            base: SystemDefaults.TextStyles.BodyText
            //fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: welcomeDialogWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            //fontFamily: "Times New Roman"
            color: Color.create("#262626")
        },
        TextStyleDefinition {
            id: welcomeDialogNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            //fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        PaymentServiceControl {
            id: paymentControl
            property string id
            property string sku
            property string name
            property string metadata
            onPriceResponseSuccess: {
            }
            onPurchaseResponseSuccess: {
                wordsPlus.isPaid = true;
                wordsPlus.cntlyIAP(metadata,0.99);
                upgradeDialog.close();
            }
            onExistingPurchasesResponseSuccess: {
            }
            onCheckStatusResponseSuccess: {
            }
            onInfoResponseError: {
            }
        }
    ]
}