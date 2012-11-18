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
//            Label {
//                text: "To Play With."
//                verticalAlignment: VerticalAlignment.Center
//                horizontalAlignment: HorizontalAlignment.Center
//                textStyle {
//                    base: settingsSheetBigTextNormalWhite.style
//                }
//            }
            ImageView {
                imageSource: "asset:///images/titles/toplaywith.png"
            }
        }
        ScrollView {
            preferredWidth: 720
            preferredHeight: 900
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
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
                                id: soundEffects
                                checked: wordsPlus.soundOn
                                onCheckedChanged: {
                                    if (soundEffects.checked == true) {
                                        wordsPlus.soundOn = true;
                                    } else if (soundEffects.checked == false) {
                                        wordsPlus.soundOn = false;
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
                                id: music
                                checked: wordsPlus.musicOn
                                onCheckedChanged: {
                                    if (music.checked == true) {
                                        wordsPlus.musicOn = true;
                                    } else if (music.checked == false) {
                                        wordsPlus.musicOn = false;
                                    }
                                }
                            }
                        }
                    } // music
//                    Divider {
//                        opacity: 0
//                    }
//                    Container { // difficulty
//                        property int settingHard: 8
//                        property int settingMedium: 5
//                        property int settingEasy: 2
//                        layout: DockLayout {
//                        }
//                        background: Color.create("#272727")
//                        preferredWidth: 720
//                        preferredHeight: 100
//                        leftPadding: 15
//                        Label {
//                            text: "Difficulty Level:"
//                            verticalAlignment: VerticalAlignment.Center
//                            horizontalAlignment: HorizontalAlignment.Left
//                            textStyle {
//                                base: settingsSheetBigBodyNormalBlue.style
//                            }
//                        }
//                        Container {
//                            layout: StackLayout {
//                                orientation: LayoutOrientation.LeftToRight
//                            }
//                            rightPadding: 20
//                            horizontalAlignment: HorizontalAlignment.Right
//                            verticalAlignment: VerticalAlignment.Center
//                            Label {
//                                id: hard
//                                text: "Hard"
//                                textStyle {
//                                    base: settingsSheetBigBodyNormalWhite.style
//                                }
//                                onTouch: {
//                                    wordsPlus.difficulty = settingsHard;
//                                    hard.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                    medium.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                    easy.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                }
//                            }
//                            Label {
//                                id: medium
//                                text: "Medium"
//                                textStyle {
//                                    base: settingsSheetBigBodyNormalWhite.style
//                                }
//                                onTouch: {
//                                    wordsPlus.difficulty = settingsMedium;
//                                    medium.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                    hard.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                    easy.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                }
//                            }
//                            Label {
//                                id: easy
//                                text: "Easy"
//                                textStyle {
//                                    base: settingsSheetBigBodyNormalWhite.style
//                                }
//                                onTouch: {
//                                    wordsPlus.difficulty = settingsEasy;
//                                    easy.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                    hard.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                    medium.textStyle.base = settingsSheetBigBodyNormalWhite.style
//                                }
//                            }
//                            onCreationCompleted: {
//                                if (wordsPlus.difficulty == settingHard) {
//                                    hard.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                }
//                                if (wordsPlus.difficulty == settingMedium) {
//                                    medium.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                }
//                                if (wordsPlus.difficulty == settingEasy) {
//                                    easy.textStyle.base = settingsSheetBigBodyNormalBlue.style
//                                }
//                            }
//                        } //diff buttons
//                    } // difficulty
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
                                id: profileBox
                                checked: wordsPlus.profileBoxOn
                                onCheckedChanged: {
                                    if (profileBox.checked == true) {
                                        wordsPlus.profileBoxOn = true;
                                    } else if (profileBox.checked == false) {
                                        wordsPlus.profileBoxOn = false;
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
            id: settingsSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
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
