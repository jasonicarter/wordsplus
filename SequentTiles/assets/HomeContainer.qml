import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    background: Color.create("#272727")
    //    ImageView {
    //        horizontalAlignment: HorizontalAlignment.Center
    //        imageSource: "images/background.png"
    //    }
    ImageView {
        horizontalAlignment: HorizontalAlignment.Center
        imageSource: "images/background_home.png"
    }
    Container {
        preferredHeight: 1280
        preferredWidth: 768
        TopNavContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
        //        HomeCenterContainer {
        //            horizontalAlignment: HorizontalAlignment.Center
        //        }
        HomeBtmNavContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    //        Container {
    //            background: Color.create("#272727")
    //            ImageView {
    //                horizontalAlignment: HorizontalAlignment.Center
    //                imageSource: "images/background_home.png"
    //            }
    //        }
}
