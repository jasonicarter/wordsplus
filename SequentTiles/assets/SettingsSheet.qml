import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#272727")
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ScrollView {
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                preferredWidth: 700
                topPadding: 100
                Container {
                    Container { // bbm
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
                                	if(resetToggle.checked == true){
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
                        text: "1) Enable reset button.\n 2) Click button 'Reset Game'\n\n" 
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
                        text:"RESET GAME"
                        enabled: false;
                        onClicked: {
                            resetToggle.checked = false;
                            sequentTiles.ResetAll();                      
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
