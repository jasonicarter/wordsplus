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
                text: "To Play With."
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    base: settingsSheetBigTextNormalWhite.style
                }
            }
        }
        ScrollView {
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                //                preferredWidth: 720
                //                preferredHeight: 900
                //                verticalAlignment: VerticalAlignment.Center
                //                horizontalAlignment: HorizontalAlignment.Center
                //background: Color.Gray
                Container {
                    Container { // sound
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Sound Effects:"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: settingsSheetBigBodyNormalBlue.style
                            }
                        }
                        Container {
                            rightPadding: 15
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Right
                            ToggleButton {
                                enabled: true
                                checked: true
                                onCheckedChanged: {
                                    if (checked == true) {
                                        wordsPlus.sound = true;
                                    } else {
                                        wordsPlus.sound = true;
                                    }
                                }
                            }
                        }
                    } // sound
                    Divider {
                        opacity: 0
                    }
                    Container { // music
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Music:"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: settingsSheetBigBodyNormalBlue.style
                            }
                        }
                        Container {
                            rightPadding: 15
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Right
                            ToggleButton {
                                enabled: true
                                checked: true
                                onCheckedChanged: {
                                    if (checked == true) {
                                        wordsPlus.sound = true;
                                    } else {
                                        wordsPlus.sound = true;
                                    }
                                }
                            }
                        }
                    } // music
                    Divider {
                        opacity: 0
                    }
                    Container { // difficulty
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Difficulty Level:"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: settingsSheetBigBodyNormalBlue.style
                            }
                        }
                    } // difficulty
                    Container {
                        //background: Color.Yellow
                        maxHeight: 400
                        RadioGroup {
                            Option {
                                id: option5
                                text: "HARD"
                                selected: false
                            }
                            Option {
                                id: option6
                                text: "MEDIUM"
                                selected: true
                            }
                            Option {
                                id: option7
                                text: "EASY"
                                selected: false
                            }
                        }
                    }
                    Divider {
                        opacity: 0
                    }
                    Container { // bbm
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 720
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "BBM App Updates:"
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: settingsSheetBigBodyNormalBlue.style
                            }
                        }
                        Container {
                            rightPadding: 15
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Right
                            ToggleButton {
                                enabled: true
                                checked: true
                                onCheckedChanged: {
                                    if (checked == true) {
                                        wordsPlus.sound = true;
                                    } else {
                                        wordsPlus.sound = true;
                                    }
                                }
                            }
                        }
                    } // bbm
                    Label {
                        text: "Updates occur whenever you completed a puzzle, beat your best time " + "or during other important in-game accomplishments. It's strongly recommended that you leave this feature on."
                        multiline: true
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: settingsSheetSubTitleNormalWhite.style
                        }
                    }
                }
            } // middle container
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
            title: "Close"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.startTimer();
                settingsSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: settingsSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: settingsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: settingsSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: settingsSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
