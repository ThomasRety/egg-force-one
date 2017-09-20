import QtQuick 2.2
//import QtQuick.Window 2.0
import QtQuick.Controls 1.0

Rectangle {
    width: 480
    height: 800
    color: "#4f4f4f"
    id: home
    property var langPack:  new Object({

                                       })
    property var varSys:    new Object({
                                           printStart:      false,
                                           moveHead:        1,
                                           targetTempHead1: 200,
                                           targetTempHead2: 200,
                                           targetTempBed:   60,
                                           targetFan:       255
                                       })
    property var varButton: new Object({
                                           color:       "#616161",
                                           colorBorder: "#4f4f4f",
                                           border:      1,
                                           colorText:   "#ffffff",
                                           sizeText:    24,
                                           familyText:  "Tahoma"
                                       })
    states: [
        State {
            name: "control"

            PropertyChanges {
                target: downButtonPrint
                visible: true
            }

            PropertyChanges {
                target: downButtonControl
                color: "#4f4f4f"
            }

            PropertyChanges {
                target: nozzleHeat1
                border.width: 2
            }

            PropertyChanges {
                target: dintanceMouseHead
                opacity: 1
            }

            PropertyChanges {
                target: text1
                text: qsTr("Return")
            }

            PropertyChanges {
                target: control
                visible: true
            }

            PropertyChanges {
                target: moveControl
                visible: true
            }

            PropertyChanges {
                target: sliderControl
                visible: true
            }
        },
        State {
            name: "print"

            PropertyChanges {
                target: control
                visible: false
            }

            PropertyChanges {
                target: downButtonPrint
                color: "#4f4f4f"
            }

            PropertyChanges {
                target: print1
                opacity: 1
            }

            PropertyChanges {
                target: text2
                text: qsTr("Return")
            }
        },
        State {
            name: "option"

            PropertyChanges {
                target: mouseArea3
                visible: true
            }

            PropertyChanges {
                target: control
                visible: false
            }

            PropertyChanges {
                target: downButtonOption
                color: "#4f4f4f"
            }

            PropertyChanges {
                target: text3
                text: qsTr("Return")
            }

            PropertyChanges {
                target: option
                visible: true
            }

            PropertyChanges {
                target: rectangle1
                opacity: 1
            }
        },
        State {
            name: "controlMenu"
            PropertyChanges {
                target: downButtonPrint
                visible: true
            }

            PropertyChanges {
                target: downButtonControl
                color: "#4f4f4f"
            }

            PropertyChanges {
                target: nozzleHeat1
                border.width: 2
            }

            PropertyChanges {
                target: dintanceMouseHead
                opacity: 1
            }

            PropertyChanges {
                target: control
                visible: true
            }

            PropertyChanges {
                target: moveControl
                visible: false
            }

            PropertyChanges {
                target: sliderControl
                visible: false
            }

            PropertyChanges {
                target: text1
                text: qsTr("Return")
            }
        }
    ]


    Item {
        id: mainScreen
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
        anchors.top: parent.top
        anchors.topMargin: 0

        Item {
            id: control
            visible: false
            anchors.fill: parent
            Item {
                id: upControl
                x: 0
                y: 360
                height: 80
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0

                Rectangle {
                    id: pausePlay
                    x: 145
                    y: 95
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.width: home.varButton.border
                    border.color: home.varButton.colorBorder
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 320

                    Text {
                        id: pausePlayText
                        text: "pause\nplay"
                        anchors.fill: parent
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Rectangle {
                    id: stop
                    x: 137
                    y: 93
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.width: home.varButton.border
                    anchors.left: parent.left
                    Text {
                        id: stopText
                        color: home.varButton.colorText
                        text: "stop"
                        horizontalAlignment: Text.AlignHCenter
                        font.family: home.varButton.familyText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        textFormat: Text.PlainText
                    }
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.leftMargin: 240
                    border.color: home.varButton.colorBorder
                }

                Rectangle {
                    id: controlMenu
                    x: 146
                    y: 102
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.width: home.varButton.border
                    anchors.left: parent.left
                    Text {
                        id: controlAvancerText
                        color: home.varButton.colorText
                        text: "control\nmenu"
                        horizontalAlignment: Text.AlignHCenter
                        font.family: home.varButton.familyText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        textFormat: Text.PlainText
                    }

                    MouseArea {
                        id: mouseAreaControlMenu
                        x: 2
                        y: -1
                        anchors.fill: parent
                        onClicked: {
                            if (home.state == 'controlMenu') {
                                home.state = 'control';
                                console.log("control");
                            }
                            else {
                                home.state = 'controlMenu';
                                console.log("controlMenu");
                            }
                        }
                    }
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.leftMargin: 400
                    border.color: home.varButton.colorBorder
                }
            }

            Item {
                id: moveControl
                width: 360
                height: 240
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 100


                Rectangle {
                    id: addX
                    x: 160
                    y: 320
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.width: home.varButton.border
                    anchors.left: parent.left
                    Text {
                        id: addTextX
                        color: home.varButton.colorText
                        text: qsTr("+X")
                        horizontalAlignment: Text.AlignHCenter
                        font.family: home.varButton.familyText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        textFormat: Text.PlainText
                    }
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.leftMargin: 80
                    border.color: home.varButton.colorBorder
                }

                Rectangle {
                    id: reduceX
                    width: 80
                    height: 80
                    border.width: home.varButton.border
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    anchors.top: parent.top
                    anchors.topMargin: 160
                    anchors.left: parent.left
                    anchors.leftMargin: 80
                    Text {
                        id: reduceTextX
                        text: qsTr("-X")
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    id: addY
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    radius: 0
                    border.width: home.varButton.border
                    anchors.top: parent.top
                    anchors.topMargin: 80
                    anchors.left: parent.left
                    anchors.leftMargin: 160
                    Text {
                        id: addTextY
                        text: qsTr("+Y")
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    id: reduceY
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    radius: 0
                    border.width: home.varButton.border
                    anchors.top: parent.top
                    anchors.topMargin: 80
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    Text {
                        id: reduceTextY
                        text: qsTr("-Y")
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    id: reduceZ
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    radius: 0
                    border.width: home.varButton.border
                    anchors.top: parent.top
                    anchors.topMargin: 160
                    anchors.left: parent.left
                    anchors.leftMargin: 160
                    Text {
                        id: reduceTextZ
                        text: qsTr("-Z")
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    id: addZ
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    radius: 0
                    border.width: home.varButton.border
                    anchors.left: parent.left
                    anchors.leftMargin: 160
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    Text {
                        id: addTextZ
                        text: qsTr("+Z")
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    id: distance
                    width: 80
                    height: 80
                    color: home.varButton.color
                    border.color: home.varButton.colorBorder
                    radius: 0
                    border.width: home.varButton.border
                    anchors.top: parent.top
                    anchors.topMargin: 80
                    anchors.left: parent.left
                    anchors.leftMargin: 80
                    Text {
                        id: distanceText
                        text: home.varSys.moveHead
                        anchors.fill: parent
                        font.pixelSize: home.varButton.sizeText
                        font.family: home.varButton.familyText
                        color: home.varButton.colorText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        id: dintanceMouseHead
                        anchors.fill: parent
                        opacity: 0
                        onClicked: {
                            console.log("moveHead");
                            if (home.varSys.moveHead == 0.1){
                                home.varSys.moveHead = 1;
                                distanceText.text = home.varSys.moveHead;
                            }
                            else if (home.varSys.moveHead == 1){
                                home.varSys.moveHead = 10;
                                distanceText.text = home.varSys.moveHead;
                            }
                            else if (home.varSys.moveHead == 10){
                                home.varSys.moveHead = 0.1;
                                distanceText.text = home.varSys.moveHead.toFixed(1);
                            }
                            console.log(home.varSys.moveHead);
                        }

                    }
                }

                Rectangle {
                    id: addExtrudeur
                    x: -3
                    y: 9
                    width: 80
                    height: 80
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    border.color: home.varButton.colorBorder
                    anchors.left: parent.left
                    border.width: home.varButton.border
                    anchors.leftMargin: 0
                    Text {
                        id: addTextExtrudeur
                        color: home.varButton.colorText
                        text: qsTr("+E")
                        font.family: home.varButton.familyText
                        textFormat: Text.PlainText
                        font.pixelSize: home.varButton.sizeText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: reduceExtrudeur
                    x: 3
                    y: 2
                    width: 80
                    height: 80
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    anchors.left: parent.left
                    border.color: home.varButton.colorBorder
                    border.width: home.varButton.border
                    anchors.leftMargin: 0
                    Text {
                        id: reduceTextExtrudeur
                        color: home.varButton.colorText
                        text: qsTr("-E")
                        font.family: home.varButton.familyText
                        textFormat: Text.PlainText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 160
                }

                Rectangle {
                    id: homeX
                    x: 4
                    y: -6
                    width: 80
                    height: 80
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    border.color: home.varButton.colorBorder
                    anchors.left: parent.left
                    border.width: home.varButton.border
                    anchors.leftMargin: 280
                    Text {
                        id: textHomeX
                        color: home.varButton.colorText
                        text: qsTr("X")
                        font.family: home.varButton.familyText
                        textFormat: Text.PlainText
                        font.pixelSize: home.varButton.sizeText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: homeY
                    x: 0
                    y: -7
                    width: 80
                    height: 80
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    anchors.left: parent.left
                    border.color: home.varButton.colorBorder
                    border.width: home.varButton.border
                    anchors.leftMargin: 280
                    Text {
                        id: textHomeY
                        color: home.varButton.colorText
                        text: qsTr("Y")
                        font.family: home.varButton.familyText
                        textFormat: Text.PlainText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 80
                }

                Rectangle {
                    id: homeZ
                    x: -2
                    y: 2
                    width: 80
                    height: 80
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    border.color: home.varButton.colorBorder
                    anchors.left: parent.left
                    border.width: home.varButton.border
                    anchors.leftMargin: 280
                    Text {
                        id: textHomeZ
                        color: home.varButton.colorText
                        text: qsTr("Z")
                        font.family: home.varButton.familyText
                        textFormat: Text.PlainText
                        font.pixelSize: home.varButton.sizeText
                        styleColor: home.varButton.colorText
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 160
                }

                Rectangle {
                    id: homeAxe
                    x: 1
                    y: -3
                    width: 30
                    height: 240
                    color: home.varButton.color
                    radius: 0
                    anchors.top: parent.top
                    anchors.left: parent.left
                    border.color: home.varButton.colorBorder
                    border.width: home.varButton.border
                    anchors.leftMargin: 250
                    Text {
                        id: textHomeAxe
                        color: home.varButton.colorText
                        text: "H\nO\nM\nE"
                        font.family: home.varButton.familyText
                        textFormat: Text.AutoText
                        styleColor: home.varButton.colorText
                        font.pixelSize: home.varButton.sizeText
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                    anchors.topMargin: 0
                }

            }

            Item {
                id: sliderControl
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 360

                Rectangle {
                    id: nozzleHeat1
                    width: 100
                    color: "#424242"
                    border.color: "#4c4c4c"
                    border.width: 2
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 15

                    Image {
                        id: imgNozzleHeat1
                        width: 80
                        height: 80
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        source: "qrc:/qtquickplugin/images/template_image.png"
                    }

                    Text {
                        id: textNozzleHeat1
                        height: 30
                        color: "#ffffff"
                        text: qsTr("temp")
                        anchors.top: parent.top
                        anchors.topMargin: 90
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        font.family: "Tahoma"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 26
                    }

                    Slider {
                        id: sliderNozzleHeat1
                        maximumValue: 300
                        minimumValue: -1
                        value: home.varSys.targetTempHead1
                        activeFocusOnPress: false
                        tickmarksEnabled: true
                        stepSize: 1
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 120
                        orientation: Qt.Vertical
                    }


                }

                Rectangle {
                    id: fan
                    x: -2
                    y: -8
                    width: 100
                    color: "#424242"
                    Image {
                        id: imgFan
                        width: 80
                        height: 80
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 5
                    }

                    Text {
                        id: textFan
                        color: "#ffffff"
                        text: qsTr("temp")
                        horizontalAlignment: Text.AlignHCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        font.family: "Tahoma"
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.rightMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 26
                        anchors.topMargin: 90
                    }

                    Slider {
                        id: sliderFan
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        value: home.varSys.targetFan
                        tickmarksEnabled: true
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        maximumValue: 255
                        orientation: Qt.Vertical
                        anchors.bottomMargin: 5
                        stepSize: 1
                        activeFocusOnPress: false
                        anchors.topMargin: 120
                    }
                    anchors.left: parent.left
                    border.color: "#4c4c4c"
                    anchors.leftMargin: 135
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.bottomMargin: 0
                    border.width: 2
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: bedHeat
                    x: -6
                    y: -6
                    width: 100
                    color: "#424242"
                    Image {
                        id: imgBedHead
                        width: 80
                        height: 80
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 5
                    }

                    Text {
                        id: textBedHead
                        color: "#ffffff"
                        text: qsTr("temp")
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 90
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Tahoma"
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 26
                    }

                    Slider {
                        id: sliderBedHead
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        value: home.varSys.targetTempBed
                        tickmarksEnabled: true
                        anchors.leftMargin: 10
                        orientation: Qt.Vertical
                        maximumValue: 120
                        anchors.rightMargin: 10
                        anchors.bottomMargin: 5
                        stepSize: 1
                        activeFocusOnPress: false
                        anchors.topMargin: 120
                    }
                    anchors.left: parent.left
                    border.color: "#4c4c4c"
                    anchors.leftMargin: 250
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    border.width: 2
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: nozzleHeat2
                    x: -8
                    y: -6
                    width: 100
                    color: "#424242"
                    Image {
                        id: imgNozzleHeat2
                        width: 80
                        height: 80
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 5
                    }

                    Text {
                        id: textNozzleHeat2
                        color: "#ffffff"
                        text: qsTr("temp")
                        horizontalAlignment: Text.AlignHCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        font.family: "Tahoma"
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.rightMargin: 0
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 90
                        font.pixelSize: 26
                    }

                    Slider {
                        id: sliderNozzleHeat2
                        maximumValue: 300
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        value: home.varSys.targetTempHead2
                        tickmarksEnabled: true
                        anchors.leftMargin: 10
                        orientation: Qt.Vertical
                        anchors.rightMargin: 10
                        anchors.bottomMargin: 5
                        stepSize: 1
                        activeFocusOnPress: false
                        anchors.topMargin: 120
                    }
                    anchors.left: parent.left
                    border.color: "#4c4c4c"
                    anchors.leftMargin: 365
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    border.width: 2
                    anchors.topMargin: 0
                }
            }

        }

        Item {
            id: print1
            visible: false
            anchors.fill: parent
        }

        Item {
            id: option
            x: -6
            y: 7
            visible: false
            anchors.fill: parent

            Rectangle {
                id: rectangle1
                width: 200
                height: 200
                color: "#ffffff"
                opacity: 0
            }
        }


    }

    Item {
        id: downButton
        y: 491
        height: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Rectangle {
            id: downButtonControl
            width: 160
            color: "#666666"
            border.width: 0
            border.color: "#ffffff"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
                onClicked: {
                    if(home.state == "control") {
                        home.state = '';
                        console.log("home");
                    }
                    else {
                        home.state = 'control'
                        console.log("control");
                    }
                }
            }

            Text {
                id: text1
                color: home.varButton.colorText
                text: qsTr("Control")
                font.family: "Tahoma"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 24
            }
        }

        Rectangle {
            id: downButtonPrint
            width: 160
            color: "#666666"
            border.width: 0
            anchors.left: parent.left
            anchors.leftMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            MouseArea {
                id: mouseArea2
                anchors.fill: parent
                onClicked: {
                    home.state = 'print'
                    console.log("print");
                }
            }

            Text {
                id: text2
                x: 5
                y: 1
                color: home.varButton.colorText
                text: qsTr("Print")
                horizontalAlignment: Text.AlignHCenter
                font.family: "Tahoma"
                font.pixelSize: 24
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: downButtonOption
            width: 160
            color: "#666666"
            anchors.left: parent.left
            anchors.leftMargin: 320
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            border.width: 0

            MouseArea {
                id: mouseArea3
                anchors.fill: parent
                onClicked: {
                    home.state = 'option';
                    console.log("option");
                }
            }

            Text {
                id: text3
                x: -1
                y: 9
                color: home.varButton.colorText
                text: qsTr("Option")
                horizontalAlignment: Text.AlignHCenter
                font.family: "Tahoma"
                font.pixelSize: 24
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}