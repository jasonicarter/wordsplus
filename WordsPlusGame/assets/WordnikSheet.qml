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
                            textAlign: TextAlign.Center
                        }
                    }
                    Label {
                        multiline: true
                        text: "(" + wordsPlus.wordnikPartOfSpeech +")"
                        textStyle {
                            base: wordnikSheetSubTitleNormalWhite.style
                            textAlign: TextAlign.Center
                        }
                        preferredWidth: 700
                    }

                }
            }
            Divider {
                opacity: 0
                topMargin: 100
            }
            Container { //def section
                Container {
                    Label {
                        multiline: true
                        text: "Definition:"
                        textStyle {
                            base: wordnikSheetSubTitleNormalWhite.style
                            textAlign: TextAlign.Center
                        }
                        preferredWidth: 700
                    }
                    Label {
                        multiline: true
                        //text: "by plagasul via freesoundby plagasul via freesound by plagasul via freesound" 
                        //+ "freesound by plagasul via freesound"
                        text: wordsPlus.wordnikDefinition
                        textStyle {
                            base: wordnikSheetBigBodyNormalWhite.style
                            textAlign: TextAlign.Center
                        }
                        preferredWidth: 700
                    }
                }


            }
            Label{
                topMargin: 150
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom
                text: "Powered by Wordnik"
                textStyle {
                    base: wordnikSheetSubTitleNormalWhite.style
                    textAlign: TextAlign.Center
                }
            }
        }
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "wordnikSheet"
        }
    }
    onCreationCompleted: {
        //wordsPlus.InitializeWordnik("WordOfTheDay");
    }
    attachedObjects: [
        TextStyleDefinition {
            id: wordnikSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: wordnikSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: wordnikSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Slate Pro Light"
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
