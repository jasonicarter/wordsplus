import bb.cascades 1.0

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
        Container { //middle
            preferredWidth: 700
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                Container {
                    property int settingHard: 8
                    property int settingMedium: 4
                    property int settingEasy: 2
                    preferredWidth: 700

                    DropDown {
                        id: diffDropDown
                        title: "Select Difficulty:"
                        Option {
                            id: hard
                            text: "Hard"
                            description: "Now we're talking!"
                            value: settingHard
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 8;
                                }
                            }
                        }
                        Option {
                            id: medium
                            text: "Medium"
                            description: "Great place to start"
                            value: settingMedium
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 4;
                                }
                            }
                        }
                        Option {
                            id: easy
                            text: "Easy"
                            description: "Don't pick me, I'm too easy"
                            value: settingEasy
                            onSelectedChanged: {
                                if (selected == true) {
                                    wordsPlus.difficulty = 2; //settingEasy;
                                }
                            }
                        }
                    }
                    onCreationCompleted: {
                        //diffDropDown.setSelectedOption(easy);
                        if (wordsPlus.difficulty == 2) {
                            diffDropDown.setSelectedOption(easy);
                        } else if (wordsPlus.difficulty == 4) {
                            diffDropDown.setSelectedOption(medium);
                        } else if (wordsPlus.difficulty == 8) {
                            diffDropDown.setSelectedOption(hard);
                        }
                    }
                } //diff buttons
                Divider {
                    opacity: 0
                }
                Container { // sound
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 700
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
                    preferredWidth: 700
                    preferredHeight: 100
                    leftPadding: 15
                    Label {
                        text: "Background Music:"
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
                                    bgMusic.setRepeatMode(1);
                                    bgMusic.play();
                                } else if (music.checked == false) {
                                    wordsPlus.musicOn = false;
                                    bgMusic.stop();
                                }
                            }
                        }
                    }
                } // music
                Divider {
                    opacity: 0
                }
                Container { // bbm
                    layout: DockLayout {
                    }
                    background: Color.create("#272727")
                    preferredWidth: 700
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
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "settingsSheet"
        }
    } // main container
    attachedObjects: [
        TextStyleDefinition {
            id: settingsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
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
