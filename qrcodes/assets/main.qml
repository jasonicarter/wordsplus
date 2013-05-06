// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    Container {
        layout: StackLayout {}
        Label {
            text: qsTr("Hello World")
            textStyle.base: SystemDefaults.TextStyles.BigText
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        DropDown {
            topMargin: 100
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
}

