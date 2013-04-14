import bb.cascades 1.0

Container {
    //preferredWidth: 768
    background: Color.create("#272727")
    horizontalAlignment: HorizontalAlignment.Center
    Container {
        preferredHeight: 1280
        preferredWidth: 720
        background: Color.create("#272727")
        
        TopNavContainer {
            //horizontalAlignment: HorizontalAlignment.Center
        }
        HomeCenterContainer {
            //horizontalAlignment: HorizontalAlignment.Center
        }
        HomeBtmNavContainer {
            //horizontalAlignment: HorizontalAlignment.Center
        }
    }
}
