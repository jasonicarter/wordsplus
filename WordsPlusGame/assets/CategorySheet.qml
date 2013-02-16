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
        Container { //middle container
            preferredWidth: 720
            preferredHeight: 1000
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                topPadding: 50
                preferredWidth: 720
                property string category
                Container {
                    property int settingHard: 8
                    property int settingMedium: 4
                    property int settingEasy: 2
                    preferredWidth: 720
                    DropDown {
                        id: diffDropDown
                        title: "Difficulty:"
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
                Container {
                    preferredWidth: 720
                    DropDown {
                        id: catDropDown
                        title: "Theme Category:"
                        Option {
                            id: defaultCat
                            text: "WordsPlus"
                            description: "Included Categories"
                            value: "wordsplus"
                        }
                        Option {
                            id: spacingOut
                            text: "Spacing Out"
                            description: "Technology, Star Trek and everything nerdy"
                            value: "spacingout"
                        }
                        Option {
                            id: schoolTime
                            text: "School Time"
                            description: "Recess, H2 pencils, gym class and more"
                            value: "schooltime"
                        }
                        onSelectedOptionChanged: {
                            if (selectedValue == "spacingout") {
                                catList.dataModel.source = "models/spacingout.xml";
                            } else if (selectedValue == "wordsplus") {
                                catList.dataModel.source = "models/wordsplus.xml";
                            } else if (selectedValue == "schooltime") {
                                catList.dataModel.source = "models/schooltime.xml";
                            }
                        }
                    }
                    onCreationCompleted: {
                        defaultCat.selected = true;
                    }
                } //category dropdown
                Divider {
                    opacity: 0
                }
                Container {
                    layout: DockLayout {
                    }
                    ListView {
                        id: catList
                        dataModel: XmlDataModel {
                            //source: "models/wordsplus.xml"
                        }
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                StandardListItem {
                                    imageSpaceReserved: true
                                    title: ListItemData.category
                                    imageSource: ListItemData.image
                                }
                            }
                        ]
                        onTriggered: {
                            var selectedItem = dataModel.data(indexPath);
                            wordsPlus.category = selectedItem.filename;
                            wordsPlus.intializePlayArea();
                            categorySheet.close();
                        }
                    } //listview
                }
            }
        } //middle container
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.startTimer();
                categorySheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: categorySheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: categorySheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: categorySheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: categorySheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
