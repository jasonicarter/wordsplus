import bb.cascades 1.0

Container {
    objectName: "mainContainer"
    layout: DockLayout {
    }
    ImageView {
        objectName: "activeImage"
        imageSource:  "images/activeFrame.png"
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
            text: "Category: " //updated dynamically in C++
            textStyle {
                base: SystemDefaults.TextStyles.BodyText
                color: Color.create("#252525")
                fontFamily: "Slate Pro"
                //fontSize: FontSize.PointValue(25)
            }
        }
    }
}
