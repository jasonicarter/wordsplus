import bb.cascades 1.0

Container {
    property variant sheetName
    Container { // bottom panel
        //background: Color.create("#0098f0")
        preferredHeight: 150
        preferredWidth: 768
        layout: DockLayout {
        }
        Container {
            preferredWidth: 768
            preferredHeight: 45
            background: Color.create("#262626")
            verticalAlignment: VerticalAlignment.Bottom
        }
        Container {
            preferredHeight: 150
            preferredWidth: 400
            //background: Color.create("#0091f0")
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                horizontalAlignment: HorizontalAlignment.Center
                ImageView {
                    id: pLetter
                    preferredHeight: 75
                    preferredWidth: 75
                    rightMargin: 0
                    leftMargin: 0
                    imageSource: "theme/" + "wordsPlus" + "/letters/x.png"
                    onTouch: {
                        if (event.isDown()) {
                            pLetter.imageSource = "theme/" + "wordsPlus" + "/letters/highlight/x.png"
                            wordsPlus.playSound("letterSelected");
                        } else if (event.isUp()) {
                            pLetter.imageSource = "theme/" + "wordsPlus" + "/letters/x.png"
                            wordsPlus.startTimer();
                            if (sheetName == "aboutSheet") {
                                aboutSheet.close()
                            } else if (sheetName == "helpSheet") {
                                helpSheet.close()
                            } else if (sheetName == "settingsSheet") {
                                settingsSheet.close()
                            } else if (sheetName == "categorySheet") {
                                categorySheet.close()
                            } else if (sheetName == "statsSheet") {
                                statsSheet.close()
                            } else if (sheetName == "themeSheet") {
                                themeSheet.close()
                            } else if (sheetName == "puzzleCompletedSheet") {
                                wordsPlus.intializePlayArea();
                                puzzleCompletedSheet.close()
                            } else if (sheetName == "shareSheet") {
                                shareSheet.close()
                            }else if (sheetName == "wordnikSheet") {
	                            wordnikSheet.close()
	                        }
                    }
                }
            }
        } // end of letters
        Container {
            topPadding: 40
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "CLOSE ME"
                textStyle {
                    base: btmNavPanelSmallNormalWhite.style
                }
            }
        }
    }
} // bottom panel
    attachedObjects: [
        TextStyleDefinition {
            id: btmNavPanelSmallNormalWhite
            base: SystemDefaults.TextStyles.SmallText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
