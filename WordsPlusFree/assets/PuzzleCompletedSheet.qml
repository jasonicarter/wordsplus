import bb.cascades 1.0
import bb.system 1.0
import com.sample.payment 1.0

Page {
    Container {
        layout: DockLayout {
        }
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        TopNavPanel {
            horizontalAlignment: HorizontalAlignment.Center
        }

        Container { //middle
            //topPadding: 100
            preferredWidth: 700
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            //background: Color.Gray
            Container {
                opacity: wordsPlus.achievedAward
                preferredWidth: 768
                preferredHeight: 70
                topPadding: 10
                background: Color.create("#FFD700")
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    id: achievementWon
                    text: "Achievement Won!"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: statsSheetBigBodyNormalBlue.style
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container {
                id: localStats
                Container { // time
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 700
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Your Time/Best Time: "
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: statsSheetBigBodyNormalBlue.style
                        }
                    }
                    Container {
                        rightPadding: 15
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Right
                        Label {
                            text: wordsPlus.lastPuzzleTime + " / " + wordsPlus.puzzleCompletedTime
                            //text: "11:59 / 09:34"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: statsSheetBigBodyNormalWhite.style
                            }
                        }
                    }
                } // time
                Divider {
                    opacity: 0
                }
                Container { // ranking
                    //background: Color.create("#272727")
                    preferredWidth: 700
                    preferredHeight: 650
                    Container {
                        background: Color.create("#272727")
                        preferredWidth: 700
                        SegmentedControl {
                            id: segmentedRankingCrtl
                            preferredWidth: 710
                            Option {
                                id: ranking
                                text: "Ranking"
                                value: "ranking"
                                selected: true
                            }
                            Option {
                                id: achievements
                                text: "Achievements"
                                value: "achievements"
                            }
                            onSelectedIndexChanged: {
                                if (wordsPlus.isPaid == true) {
                                    notPaid.visible = false;
                                    notPaid.removeAll();
                                    if (segmentedRankingCrtl.selectedValue == "achievements") {
                                        position.visible = false;
                                        awards.visible = true;
                                        awards.removeAll();
                                        var awardsContainer = achievementDef.createObject();
                                        awards.add(awardsContainer);
                                    } else if (segmentedRankingCrtl.selectedValue == "ranking") {
                                        awards.visible = false;
                                        position.visible = true;
                                        position.removeAll();
                                        var positionContainer = positionDef.createObject();
                                        position.add(positionContainer);
                                    }
                                } else {
                                    awards.visible = false;
                                    position.visible = false;
                                    position.removeAll();
                                    awards.removeAll();
                                    notPaid.visible = true;
                                }
                            }
                        }
                    }
                    Divider {
                        opacity: 0
                        topMargin: 50
                    }
                    Container {
                        id: notPaid
                        horizontalAlignment: HorizontalAlignment.Center
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            ImageView {
                                imageSource: "images/randompuzzle.png"
                            }
                            Label{
                                text:"+ Ranking\n+ Achievements\n+ Theme Skins"
                                multiline: true;
                            }

                        }
                        Divider {
                            opacity: 0
                            topMargin: 50
                        }
                        Label {
                            text:"These features are only available\n with the unlocked edition of WordsPlus"
                            multiline: true
                            textStyle.textAlign: TextAlign.Center
                            horizontalAlignment: HorizontalAlignment.Center                       
                        }
                        Divider {
                            opacity: 0
                            topMargin: 50
                        }
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            horizontalAlignment: HorizontalAlignment.Right
                            ImageView {
                                rightMargin: 50
                                imageSource: "images/lock.png"
                            }
                            Button {
                                id: upgrade
                                text: "UNLOCK"
                                preferredWidth: 250
                                horizontalAlignment: HorizontalAlignment.Center
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
                    Container {
                        id: position
                        visible: false;
                        //background: Color.LightGray
                        preferredWidth: 700
                        //preferredHeight: 500
                    }
                    Container {
                        id: awards
                        visible: false;
                        //background: Color.LightGray
                        preferredWidth: 700
                        //preferredHeight: 500
                    }
                } // end of ranking
            }
        } // end of middle container
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "puzzleCompletedSheet"
        }
    } // end of page
    onCreationCompleted: {
        if (wordsPlus.isPaid) {
            notPaid.visible = false;
            position.visible = true;
            var positionContainer = positionDef.createObject();
            position.add(positionContainer);
        }
        if ((wordsPlus.gamesPlayed % 5 == 0) && ! wordsPlus.isReviewed) {
            reviewDialog.show();
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: statsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetBurntOrgange
            base: SystemDefaults.TextStyles.BodyText
            //fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#CC3F10")
            //fontSize: FontSize.Large
        },
        ComponentDefinition {
            id: achievementDef
            source: "Achievements.qml"
        },
        ComponentDefinition {
            id: positionDef
            source: "PositionLeaderboard.qml"
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
                notPaid.visible = false;
                position.visible = true;
                var positionContainer = positionDef.createObject();
                position.add(positionContainer);
                wordsPlus.cntlyIAP(metadata, 0.99);
            }
            onExistingPurchasesResponseSuccess: {
            }
            onCheckStatusResponseSuccess: {
            }
            onInfoResponseError: {
            }
        },
        SystemDialog {
            id: reviewDialog
            title: "WOW! You've played " + wordsPlus.gamesPlayed + " times."
            body: "Please give a 5 Star review and your feedback. Help make WordsPlus even better."
            onFinished: {
                if (reviewDialog.result == SystemUiResult.CancelButtonSelection) {
                    //on cancel do nothing
                }
                if (reviewDialog.result == SystemUiResult.ConfirmButtonSelection) {
                    invokeLeaveReview.trigger("bb.action.OPEN");
                    wordsPlus.isReviewed = true;
                }
            }
        },
        Invocation {
            id: invokeLeaveReview
            query {
                invokeTargetId: "sys.appworld"
                uri: "appworld://content/24752875"
            }
        }
    ]
}
