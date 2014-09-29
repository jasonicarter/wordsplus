import bb.cascades 1.0
import com.sample.payment 1.0

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    preferredHeight: 150
    preferredWidth: 720
    //background: Color.LightGray
    ImageButton {
        horizontalAlignment: HorizontalAlignment.Left
        defaultImageSource: "images/buttons/home.png"
        pressedImageSource: "images/buttons/home_selected.png"
        onTouch: {
            if (event.isUp()) {
                sequentTiles.Home();
            }
        }
        onTouchExit: {
            //do nothing
        }
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        preferredHeight: 150
        //background: Color.Gray
        horizontalAlignment: HorizontalAlignment.Right
        ImageView {
            verticalAlignment: VerticalAlignment.Center
            imageSource: "images/gold.png"
        }
        Label {
            verticalAlignment: VerticalAlignment.Center
            text: sequentTiles.coinCount
            textStyle {
                base: SystemDefaults.TextStyles.BigText
                color: Color.create("#fafafa")
            }

        }
        onTouch: {
            if (event.isUp()) {
                paymentSheet.open();
            }
        }
    }
    attachedObjects: [
        Sheet {
            id: paymentSheet
            PaymentContainer {
            }
        }
    ]
}
