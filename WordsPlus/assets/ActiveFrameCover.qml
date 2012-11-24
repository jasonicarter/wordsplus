import bb.cascades 1.0

Container {
    objectName: "mainContainer"
    layout: DockLayout {
    }
    ImageView {
        imageSource: "asset:///images/cover.png"
        verticalAlignment: VerticalAlignment.Top
        horizontalAlignment: HorizontalAlignment.Center
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
