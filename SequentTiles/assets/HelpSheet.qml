import bb.cascades 1.0

Page {
    Container {
        layout: DockLayout {
        }
        preferredWidth: 768
        background: Color.create("#272727")
        horizontalAlignment: HorizontalAlignment.Center
        ScrollView {
            horizontalAlignment: HorizontalAlignment.Center
            Container { //middle
                preferredWidth: 700
                topPadding: 100
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: "Help:"
                    textStyle {
                        base: helpSheetBigBodyNormalBlue.style
                    }
                }
                Divider {

                }
                Label {
                    text: "Logical...If given numbers '3, 1, 2' and asked to arrange them," 
                    + " how would you do it?"
                    multiline: true
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: helpSheetSubTitleNormalWhite.style
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_1/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_1/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_1/2.png"
                        }
                    }
                }
                Label {
                    text: "Natural...If given '2, 0, H' how would you arrange them?\n"
                    +"The chemical 'name' for water is - H20,"
                    multiline: true
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: helpSheetSubTitleNormalWhite.style
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_2/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_2/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_2/2.png"
                        }
                    }
                }
                Label {
                    text: "Now think traffic lights and their sequence, " 
                    + "'Green' comes before 'Yellow' which comes before 'Red'"
                    multiline: true
                    touchPropagationMode: TouchPropagationMode.None
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Left
                    textStyle {
                        base: helpSheetSubTitleNormalWhite.style
                    }
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_3/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_3/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/example_3/2.png"
                        }
                    }
                }
            }
            
        }
    }
    actions: [
        ActionItem {
            title: "Close"
            imageSource: "asset:///images/close.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                helpSheet.close();
            }
        }
    ]
    attachedObjects: [
        // When modifying the SystemDefult fonts, like changing wieght or color,
        // it is better from a memory consumption point of view to create text
        // styles as attached objects.
        TextStyleDefinition {
            id: helpSheetBigTextNormalWhite
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#fafafa")
        },
        TextStyleDefinition {
            id: helpSheetBigBodyNormalBlue
            base: SystemDefaults.TextStyles.BodyText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: helpSheetSubTitleNormalBlue
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#0098f0")
        },
        TextStyleDefinition {
            id: helpSheetSubTitleNormalWhite
            base: SystemDefaults.TextStyles.SubtitleText
            fontWeight: FontWeight.Normal
            fontFamily: "Times New Roman"
            color: Color.create("#fafafa")
        }
    ]
}
