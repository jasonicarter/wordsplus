import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        background: Color.create("#0098f0")
        preferredWidth: 768
        horizontalAlignment: HorizontalAlignment.Center
        ThemeOtherPages {
        }
        Container { //middle
            topPadding: 100
            preferredWidth: 720
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                preferredWidth: 768
                preferredHeight: 70
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    id: themeSwitch
                    text: "A Change of Heart"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: statsSheetBigTextNormalWhite.style
                    }
                }
            }
            Divider {
                opacity: 0
            }
            Container { // details
                background: Color.create("#272727")
                preferredWidth: 720
                leftPadding: 15
                Label {
                    text: "Click a damn theme to switch to, it's that simple. " + "Also, you may have to pay $0.99 per bundle (theme + categories). " + "This is the third line which is the most I'll have."
                    multiline: true
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: statsSheetSubTitleNormalBlue.style
                    }
                }
            } // details
            Divider {
                opacity: 0
            }
            Container {
                background: Color.create("#272727")
                ScrollView { //imagescroller
                    scrollViewProperties.scrollMode: ScrollMode.Horizontal
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        preferredHeight: 750
                        Container {
                            rightPadding: 5
                            Container {
                                topPadding: 5
                                rightPadding: 5
                                leftPadding: 5
                                bottomPadding: 5
                                background: Color.create("#fafafa")
                                ImageView {
                                    imageSource: "theme/words/theme_sample.jpg"
                                }
                                Label {
                                    text: "FREE!\n"
                                    multiline: true
                                    horizontalAlignment: HorizontalAlignment.Center
                                    textStyle {
                                        base: statsSheetSubTitleNormalBlue.style
                                    }
                                }
                            }
                        }
                        Container {
                            rightPadding: 5
                            Container {
                                topPadding: 5
                                rightPadding: 5
                                leftPadding: 5
                                bottomPadding: 5
                                background: Color.create("#fafafa")
                                ImageView {
                                    imageSource: "theme/space/theme_sample.jpg"
                                }
                                Label {
                                    text: "Outer Limits + \n" + "5 Categories"
                                    multiline: true
                                    horizontalAlignment: HorizontalAlignment.Center
                                    textStyle {
                                        base: statsSheetSubTitleNormalBlue.style
                                    }
                                }
                            }
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                        ImageView {
                            imageSource: "images/heart.png"
                        }
                    }
                } //imagescroller
            }
        } // end of middle container
    } // end of page
    onCreationCompleted: {
        //        var positionContainer = positionDef.createObject();
        //        position.add(positionContainer);
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                wordsPlus.InitializeHomePage();
                themeSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: statsSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetBigBodyNormalWhite
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: statsSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
