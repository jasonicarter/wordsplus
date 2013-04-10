import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ScrollView {
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                preferredWidth: 700
                topPadding: 100
                Container {
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
                                checked: true
                                onCheckedChanged: {

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
                                checked: false
                                onCheckedChanged: {

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
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
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
