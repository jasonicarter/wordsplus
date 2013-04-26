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
            //            if (event.isDown()) {
            //            }
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
        //verticalAlignment: VerticalAlignment.Center
        ImageView {
            verticalAlignment: VerticalAlignment.Center
            imageSource: "images/gold.png"
        }
        Label {
            id: coinCount
            verticalAlignment: VerticalAlignment.Center
            text: sequentTiles.coinCount
            textStyle {
                base: SystemDefaults.TextStyles.BigText
                color: Color.create("#fafafa")
            }

        }
        onTouch: {
            if (event.isUp()) {
                paymentControl.id = "123456789"
                paymentControl.sku = "SKU-1"
                paymentControl.name = "200 Coins"
                paymentControl.metadata = "200 Coins"
                paymentControl.getPrice(paymentControl.id, paymentControl.sku)
                paymentControl.purchase(paymentControl.id, paymentControl.sku, paymentControl.name, paymentControl.metadata)
            }
        }
    }
    attachedObjects: [

        //! [3]
        // The custom payment element for holding item data
        // and used for method invocation and receiving events as a
        // result of those invocations
        PaymentServiceControl {
            id: paymentControl
            property string id
            property string sku
            property string name
            property string metadata
            onPriceResponseSuccess: {

            }

            onPurchaseResponseSuccess: {
                var coins = Number(coinCount.text);
                //coinCount.text = coins + 200;
                sequentTiles.coinCount = coins + 200;
            }
            onExistingPurchasesResponseSuccess: {

            }
            onSubscriptionTermsResponseSuccess: {

            }
            onCancelSubscriptionResponseSuccess: {

            }
            onCheckStatusResponseSuccess: {

            }
            onInfoResponseError: {
            }
        }
    //! [3]
    ]
}
