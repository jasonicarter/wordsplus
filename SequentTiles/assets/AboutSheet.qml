import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#272727")
        preferredHeight: 1000
        ScrollView {
            preferredHeight: 1500
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                preferredHeight: 1500
                preferredWidth: 700
                topPadding: 100
                //background: Color.create("#272727")
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                Container { //developer section
                    Label {
                        text: "Game Design & Programming:"
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                    Divider {

                    }
                    Label {
                        text: "by Jason I. Carter"
                        textStyle {
                            base: aboutSheetSubTitleNormalWhite.style
                        }
                    }
                }
                Container { //website section
                    topMargin: 50
                    Label {
                        text: "Website, Twitter & Email Support:"
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                    Divider {

                    }
                    Label {
                        leftPadding: 25
                        multiline: true
                        text: "Help improve Sequent by sending any requests, suggestions or issues to: \n\n" + "Twitter: @jasonicarter\n" + "Email: jason.ian.carter@hotmail.com"
                        textStyle {
                            base: aboutSheetSubTitleNormalWhite.style
                        }
                    }
                }
                Container { //music section
                    topMargin: 50
                    Label {
                        text: "Music:"
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                    Divider {

                    }
                    Label {
                        multiline: true
                        text: "sweetalertsound2 by kizilsungur via freesound.org\n" + "negativebeep by splashdust via freesound.org"
                        textStyle {
                            base: aboutSheetSubTitleNormalWhite.style
                        }
                    }
                }
                Container { //images section
                    topMargin: 50

                    Label {
                        text: "Attribution: The Noun Project"
                        textStyle {
                            base: aboutSheetBigBodyNormalBlue.style
                        }
                    }
                    Divider {

                    }
                    Label {
                        multiline: true
                        text: "rocket designed by Antonis Makriyannis\n" + "car designed by Geremy Good\n" + "airplane designed by Simon Child\n" + "remote-control designed by Simon Child\n" + "sail-boat designed by ___Lo\n" + "microware-oven designed by Marc Serre\n" + "radio designed by Monika Ciapala\n" + "zip-drive designed by Mike Wirth\n" + "cassette designed by mathies janssen\n" + "Drawing designed by Daniel Shannon\n"
                        textStyle {
                            base: aboutSheetSubTitleNormalWhite.style
                        }
                    }
                }
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
                    aboutSheet.close();
                }else if (event.isDown()) {
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
            id: aboutSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: aboutSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: aboutSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: aboutSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
