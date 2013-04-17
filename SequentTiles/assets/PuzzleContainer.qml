import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    background: Color.create("#272727")
    ImageView {
        horizontalAlignment: HorizontalAlignment.Center
        imageSource: "images/background.png"
    }
    Container {
        preferredHeight: 1280
        preferredWidth: 768
        TopNavContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
        PuzzleCenterContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
        HomeBtmNavContainer {
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}