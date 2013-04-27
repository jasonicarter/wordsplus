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
                    text: "Here's an easy one - follows succession\n" 
                    + "1, 2, 3 (ascending base 10)\n" + "or even 3, 9, 12 (ascending multiples of 3)"
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

                            imageSource: "packages/pkg_1/example_1/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/2.png"
                        }
                    }
                }
                Label {
                    text: "Write stuff here\n" + "up and to the right\n" + "add some images"
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

                            imageSource: "packages/pkg_1/example_1/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/2.png"
                        }
                    }
                }
                Label {
                    text: "Write stuff here\n" + "up and to the right\n" + "add some images"
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

                            imageSource: "packages/pkg_1/example_1/0.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        rightMargin: 10
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/1.png"
                        }
                    }
                    Container {
                        preferredHeight: 200
                        preferredWidth: 200
                        background: Color.create("#0098f0")
                        ImageView {

                            imageSource: "packages/pkg_1/example_1/2.png"
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
