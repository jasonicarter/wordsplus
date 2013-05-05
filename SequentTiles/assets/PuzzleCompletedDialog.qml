import bb.cascades 1.0

Dialog {
    Container {
        preferredWidth: 768
        layout: DockLayout {
        }
        background: Color.create("#272727")
        horizontalAlignment: HorizontalAlignment.Center
        ImageView {
            horizontalAlignment: HorizontalAlignment.Center
            imageSource: "images/background_payment.png"
        }
        Container {
            topPadding: 30
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "CONGRATULATIONS!"
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.BigText
                    color: Color.create("#fafafa")
                }
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "You've completed the game."
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.PrimaryText
                    color: Color.create("#fafafa")
                }
            }

        }
        Container {
            bottomPadding: 50
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Please Leave a Review"
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.BigText
                    color: Color.create("#fafafa")
                }
            }

        }
        Container {
            layout: AbsoluteLayout {
            }
            preferredHeight: 980
            preferredWidth: 720
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            //background: Color.Gray
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 42
                    positionY: 162
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    topPadding: 50
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Top
                        text: "Sequent.\nDid you love it?"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#272727")
                        }

                    }
                    Button {
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Review It!"
                        //                        preferredHeight: 100
                        //                        preferredWidth: 200
                        onClicked: {
                            invokeLeaveReview.trigger("bb.action.OPEN");
                        }
                    }
                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 379
                    positionY: 162
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    ImageView {
                        imageSource: "images/buttons/selected.png"
                    }

                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 379
                    positionY: 502
                }
                Container {
                    layout: DockLayout {
                    }
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    topPadding: 50
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Top
                        text: "WordsPlus\n$0.99"
                        multiline: true
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BodyText
                            color: Color.create("#272727")
                        }

                    }
                    Button {
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Get It Now!"
                        //                        preferredHeight: 200
                        //                        preferredWidth: 200
                        onClicked: {
                            invokeWordsPlus.trigger("bb.action.OPEN");
                        }
                    }
                }
            }
            Container {
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 42
                    positionY: 502
                }
                Container {
                    preferredHeight: 300
                    preferredWidth: 300
                    background: Color.create("#0098f0")
                    ImageView {
                        imageSource: "images/buttons/selected.png"
                    }
                }
            }
        }
        attachedObjects: [
            Invocation {
                id: invokeLeaveReview
                query {
                    invokeTargetId: "sys.appworld"
                    uri: "appworld://content/21931881"
                }
            },
            Invocation {
                id: invokeWordsPlus
                query {
                    invokeTargetId: "sys.appworld"
                    uri: "appworld://content/21931881"
                }
            }
        ]
    }
}
