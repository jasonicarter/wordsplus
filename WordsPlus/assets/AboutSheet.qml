import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.Black
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            background: Color.create("#00629C")
            preferredWidth: 768
            Label {
                text: "This Game."
                textStyle {
                    base: bigTextNormalWhite.style
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
        }
        Container { //middle
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                text: "WordsPlus (v...)"
                textStyle {
                    base: bigTextNormalWhite.style
                }
            }
            Container { //developer section
                topMargin: 50
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Game Design & Programming:"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                Label {
                    text: "by Jason I. Carter"
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
            Container { //website section
                topMargin: 100
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "Website & Email Support:"
                        touchPropagationMode: TouchPropagationMode.None
                        editable: false
                        textStyle {
                            base: bigBodyNormalWhite.style
                            color: Color.create("#0098f0")
                        }
                    }
                }
                Label {
                    leftPadding: 25
                    text: "jicarter@twocasualcoders.com"
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
                Label {
                    leftPadding: 25
                    text: "www.twocasualcoders.com"
                    textStyle {
                        base: subTitleNormalBlue.style
                        color: Color.create("#0098f0")
                    }
                }
            }
        }
        Container { //divider
            preferredWidth: 768
            preferredHeight: 50
            background: Color.create("#00629C")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    actions: [
        ActionItem {
            title: "Support"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                aboutSheet.close();
            }
        },
        ActionItem {
            title: "Close"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.startTimer();
                aboutSheet.close();
            }
        },
        ActionItem {
            title: "Website"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                aboutSheet.close();
            }
        }
    ]
}