import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle
            preferredWidth: 700
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container { //word of the day section
                Container {
                    background: Color.create("#272727")
                    TextArea {
                        text: "WORD OF THE DAY"
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: wordnikSheetBigBodyNormalBlue.style
                            textAlign: TextAlign.Center
                        }
                    }
                }
                Label {
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                    //text: "Tues Sept 2013"
                    text: {
                        var newDate = new Date();
                        var strDate = newDate.toDateString();
                        strDate
                    }
                    textStyle {
                        base: wordnikSheetSubTitleNormalWhite.style
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container { //word section
                Container {
                    //background: Color.create("#272727")
                    TextArea {
                       	//text: "VEEPOSKETENT"
                       	text: (wordsPlus.wordnikWord).toUpperCase();
                        editable: false
                        touchPropagationMode: TouchPropagationMode.None
                        textStyle {
                            base: wordnikSheetSubTitleNormalBurntOrgange.style
                        }
                    }
                    
                }
            }
            Container { //def section
                topMargin: 50
                Container {
                    //background: Color.create("#272727")
                    Label {
                        multiline: true
                        text: "Part of speech:"
                        textStyle {
                            base: wordnikSheetSubTitleNormalWhite.style
                        }
                    }
                    Label {
                        multiline: true
                        text: "noun"
                        textStyle {
                            base: wordnikSheetBigBodyNormalWhite.style
                        }
                    }
                    Divider {
                        opacity: 0
                        topMargin: 50
                    }
                    Label {
                        multiline: true
                        text: "Definition:"
                        textStyle {
                            base: wordnikSheetSubTitleNormalWhite.style
                        }
                    }
                    Label {
                        multiline: true
                        //text: "by plagasul via freesoundby plagasul via freesound by plagasul via freesound"
                        text: wordsPlus.wordnikDefinition
                        textStyle {
                            base: wordnikSheetBigBodyNormalWhite.style
                        }
                    }
//                    TextArea {
//                        text: "Definition: by plagasul via freesound.org " + "sweetalertsound1 + 2 by kizilsungur via freesound.org"
//                        //text: "Part of speech: "+ wordsPlus.wordnikPartOfSpeech +"\n\nDefinition: "+ wordsPlus.wordnikDefinition
//                        editable: false
//                        touchPropagationMode: TouchPropagationMode.None
//                        textStyle {
//                            base: wordnikSheetBigBodyNormalWhite.style
//                        }
//                    }
                }


            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "wordnikSheet"
        }
    }
    onCreationCompleted: {
        wordsPlus.InitializeWordnik("WordOfTheDay");
    }
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: wordnikSheetBigBodyNormalBlack
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#272727")
        },
        TextStyleDefinition {
            id: wordnikSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: wordnikSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: wordnikSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: wordnikSheetSubTitleNormalBurntOrgange
            base: SystemDefaults.TextStyles.BigText
            fontFamily: "Slate Pro Light"
            color: Color.create("#CC3F10")
            fontSize: FontSize.XXLarge
        }
    ]
}
