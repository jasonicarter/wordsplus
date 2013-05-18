import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        
        ThemeOtherPages {
        }
        ThemeSchoolHighlight {
        }
        Container { //middle container
            //background: Color.Green
            preferredWidth: 700
            preferredHeight: 1130
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredWidth: 700
                property string category
                Container {
                    property int settingHard: 8
                    property int settingMedium: 4
                    property int settingEasy: 2
                    preferredWidth: 700
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
                            wordsPlus.cntlyCategory((wordsPlus.category).toLowerCase(), wordsPlus.difficulty.toString());
                            wordsPlus.intializePlayArea();
                            categorySheet.close();
                        }
                    } //listview
                }
            }
        } //middle container
        BtmSheetNavPanel {
            verticalAlignment: VerticalAlignment.Bottom
            sheetName: "categorySheet"
        }
    }
}
