/*
 * Copyright (c) 2012 Jason I. Carter
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0

Page {
    Container { //mainContainer
        onCreationCompleted: {
            _registrationHandler.registerApplication();
        }
        layout: DockLayout {
        }
        Container {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            ImageView {
                imageSource: "asset:///images/splashScreen.png"
            }
        }
        Container {
            bottomPadding: 200
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                horizontalAlignment: HorizontalAlignment.Center
                visible: _registrationHandler.temporaryError
                text: qsTr("Connect to BBM")
                onClicked: {
                    _registrationHandler.registerApplication()
                }
            }
            Label {
                visible: _registrationHandler.temporaryError
                text: "BBM Status Message: \n" + _registrationHandler.statusMessage
                multiline: true
                textStyle.fontSize: FontSize.Small
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.textAlign: TextAlign.Center
            }
        }
    } //end of mainContainer
}
