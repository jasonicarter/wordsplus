import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#272727")
        preferredWidth: 768
        preferredHeight: 1000
        horizontalAlignment: HorizontalAlignment.Center
        ScrollView {
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                preferredWidth: 700
                preferredHeight: 1280
                topPadding: 100
                Container {
                    Container {
                        layout: DockLayout {
                        }
                        background: Color.create("#272727")
                        preferredWidth: 700
                        preferredHeight: 100
                        leftPadding: 15
                        Label {
                            text: "Enable Reset Button:"
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
                                id: resetToggle
                                checked: false
                                onCheckedChanged: {
                                    if (resetToggle.checked == true) {
                                        btnReset.enabled = true;
                                    } else {
                                        btnReset.enabled = false;
                                    }
                                }
                            }
                        }
                    }
                    Divider {

                    }
                    Label {
                        text: 
                        "1) Enable reset button.\n"
                        + "2) Check 'Guest Mode' on to reset guest levels\n"
                        + "3) Press 'Reset Game' button\n\n"
                        + "All progress will be lost. Coins will be saved."
                        multiline: true
                        touchPropagationMode: TouchPropagationMode.None
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle {
                            base: settingsSheetSubTitleNormalWhite.style
                        }
                    }
                    Button {
                        id: btnReset
                        text: "RESET GAME"
                        enabled: false
                        onClicked: {
                            resetToggle.checked = false;
                            sequentTiles.ResetAll();
                        }
                    }
                    Divider {
                    	opacity: 0
                    }
                    Container {
                        Container {
                            layout: DockLayout {
                            }
                            background: Color.create("#272727")
                            preferredWidth: 700
                            preferredHeight: 100
                            leftPadding: 15
                            Label {
                                text: "Skip to end:"
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
                                    id: skipToggle
                                    checked: false
                                    onCheckedChanged: {
                                        if (skipToggle.checked == true) {
                                            btnSkip.enabled = true;
                                        } else {
                                            btnSkip.enabled = false;
                                        }
                                    }
                                }
                            }
                        }
                        Divider {

                        }
                        Label {
                            text: "For testing ONLY.\nGo to last puzzle, answer or skip to see final screen."
                            multiline: true
                            touchPropagationMode: TouchPropagationMode.None
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle {
                                base: settingsSheetSubTitleNormalWhite.style
                            }
                        }
                        Button {
                            id: btnSkip
                            text: "SKIP GAME"
                            enabled: false
                            onClicked: {
                                skipToggle.checked = false;
                                sequentTiles.SkipToEnd();
                            }
                        }
                    }
                } // middle container
            }
        } //end of scroll
        Container {
            layout: DockLayout {
            }
            preferredHeight: 150
            preferredWidth: 768
            background: Color.create("#272727")
            verticalAlignment: VerticalAlignment.Bottom
            ImageView {
                id: homeBtn
                horizontalAlignment: HorizontalAlignment.Center
                imageSource: "images/buttons/home.png"
            }
            ImageView {
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Center
                imageSource: "images/dashed_line.png"
            }
            onTouch: {
                if (event.isUp()) {
                    homeBtn.imageSource = "images/buttons/home.png"
                    settingsSheet.close();
                } else if (event.isDown()) {
                    pressedImageSource:
                    homeBtn.imageSource = "images/buttons/home_selected.png"
                }
            }
            onTouchExit: {
                //do nothing
            }
        }
    }
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
