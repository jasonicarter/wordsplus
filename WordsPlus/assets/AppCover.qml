import bb.cascades 1.0

SceneCover {
    // The content property must be explicitly specified
    content: Container {
        Container {
            layout: DockLayout {
            }
            background: Color.Black
            ImageView {
                imageSource: "asset:///images/cover.png"
            }
            Container {
                //background: Color.LightGray
                verticalAlignment: VerticalAlignment.Top
                horizontalAlignment: HorizontalAlignment.Center
                preferredWidth: 334
                Label {
                    objectName: "label_category"
                    text: "Category: " //+ wordsPlus.category
                    textStyle {
                        base: SystemDefaults.TextStyles.BodyText
                        color: Color.create("#252525")
                        //fontFamily: "Times New Roman"
                        fontFamily: "Slate Pro"
                        //fontSize: FontSize.PointValue(25)
                    }
                }
            }
        }
    }
}
